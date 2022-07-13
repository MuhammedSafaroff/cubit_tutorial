import 'package:ders/presentation/blocs/cubit/post_cubit.dart';
import 'package:ders/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => PostCubit()..postFetch(),
        child: const MyHomePage(),
      ),
    );
  }
}
