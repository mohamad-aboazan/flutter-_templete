import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/post_bloc/post_bloc.dart';
import 'myapp.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PostBloc()),
      ],
      child: MyApp(),
    ),
  );
}
