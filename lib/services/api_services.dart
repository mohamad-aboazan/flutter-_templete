import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_templete/utils/endpoints.dart';
import 'package:http/http.dart' as http;

enum RequestType { GET, POST, PUT, DELETE }

class ApiService {
  final String baseUrl = Endpoints.BASE_URL;
  // ignore: non_constant_identifier_names
  final int TIME_OUT_DURATION = 15;
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;

  ApiService._internal();
  // AuthModel auth;
  Future<Map> request({
    @required RequestType requestType,
    @required String endPoint,
    dynamic parameter,
    String contentType,
    bool convertParametersToJson = true,
    String externalToken,
  }) async {
    Uri url = Uri.parse("$baseUrl$endPoint");
    print("REQUEST : " + url.toString());
    print("REQUEST : " + parameter.toString());
    var response;
    switch (requestType) {
      case RequestType.GET:
        response = await http.get(url, headers: {
          "Accept": "application/json",
          "Content-Type": contentType ?? "application/json",
          "Authorization":
              null // auth?.token == null ? null : "Bearer " + auth.token,
        }).timeout(
          Duration(seconds: TIME_OUT_DURATION),
          onTimeout: () {
            return http.Response("[]", 408);
          },
        );
        break;
      case RequestType.POST:
        try {} catch (e) {}
        response = await http
            .post(
          url,
          headers: {
            "Accept": "application/json",
            "Content-Type": contentType ?? "application/json",
            "Authorization":
                null // auth?.token == null ? null : "Bearer " + auth.token,
          },
          body: convertParametersToJson ? jsonEncode(parameter) : parameter,
          encoding: Encoding.getByName("utf-8"),
        )
            .timeout(
          Duration(seconds: TIME_OUT_DURATION),
          onTimeout: () {
            return http.Response("[]", 408);
          },
        );
        break;
      case RequestType.PUT:
        response = await http
            .put(
          url,
          headers: {
            "Accept": "application/json",
            "Content-Type": contentType ?? "application/json",
            "Authorization":
                null // auth?.token == null ? null : "Bearer " + auth.token,
          },
          body: convertParametersToJson ? json.encode(parameter) : parameter,
          encoding: Encoding.getByName("utf-8"),
        )
            .timeout(
          Duration(seconds: TIME_OUT_DURATION),
          onTimeout: () {
            return http.Response("[]", 408);
          },
        );
        break;

      case RequestType.DELETE:
        response = await http.delete(
          url,
          headers: {
            "Accept": "application/json",
            "Content-Type": contentType ?? "application/json",
            "Authorization":
                null // auth?.token == null ? null : "Bearer " + auth.token,
          },
        ).timeout(
          Duration(seconds: TIME_OUT_DURATION),
          onTimeout: () {
            return http.Response("[]", 408);
          },
        );
        break;
    }
    print("RESPONSE : " + response.body.toString());
    return processResponse(response);
  }

  Map processResponse(http.Response response) {
    print("response.statusCode : ${response.statusCode}");
    switch (response.statusCode) {
      case 204:
      case 201:
      case 200:
        return {
          "state": ResponseState.success,
          "message": HTTP_REQUEST_STATE_CODE[200],
          "body": response.body ?? "{}",
          "statusCode": response.statusCode
        };

      case 400:
        return {
          "state": ResponseState.faild,
          "body": response.body,
          "message": jsonDecode(response.body)["messages"].toString(),
          "statusCode": response.statusCode
        };
      case 401:
        return {
          "state": ResponseState.faild,
          "body": response.body,
          "message": HTTP_REQUEST_STATE_CODE[response.statusCode].toString(),
          "statusCode": response.statusCode
        };
      case 500:
        return {
          "state": ResponseState.faild,
          "body": response.body,
          "message": jsonDecode(response.body)["messages"].toString(),
          "statusCode": response.statusCode
        };
      default:
        return {
          "state": ResponseState.faild,
          "body": response.body,
          "message": HTTP_REQUEST_STATE_CODE[response.statusCode],
          "statusCode": response.statusCode
        };
    }
  }

  static const Map<int, String> HTTP_REQUEST_STATE_CODE = {
    200: "Ok",
    400: "Error code 400 : Bad Request",
    401: "Error code 401 : you Unauthorized to do that",
    403: "Error code 403 : Forbidden",
    404: "Error code 404 : Not Found",
    408:
        "Error code 408 : Looks like the server is taking to long to respond, please try again in sometime",
    500: "Error code 500 : Sorry, Server is unavailable now"
  };
}

enum ResponseState { success, faild }
