import 'package:dictionary/bloc/dictionary_cubit.dart';
import 'package:dictionary/repo/word_repo.dart';
import 'package:dictionary/screens/home/home_screen.dart';
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
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          child: const HomeScreen(),
          create: (context) => DictionaryCubit(WordRepository())),
    );
  }
}
