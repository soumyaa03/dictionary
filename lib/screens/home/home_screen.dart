import 'package:dictionary/bloc/dictionary_cubit.dart';
import 'package:dictionary/screens/show_list/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  getDictionaryFormWidget(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // ignore: prefer_const_constructors
          Spacer(),
          // ignore: prefer_const_constructors
          Text(
            "Dictionary App",
            style: TextStyle(
                fontSize: 30,
                color: Colors.orange[700],
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // ignore: prefer_const_constructors
          Text(
            "Search any word",
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: cubit.queryController,
            decoration: InputDecoration(
                hintText: "search a word",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                fillColor: Colors.grey[500],
                filled: true,
                prefixIcon: const Icon(Icons.search),
                hintStyle: const TextStyle(color: Colors.white)),
          ),
          const Spacer(),
          // ignore: sized_box_for_whitespace
          Container(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  cubit.getWordSearched();
                },
                child: const Text("SEARCH")),
          )
        ],
      ),
    );
  }

  getLoadingWidget() {
    return const Center(child: CircularProgressIndicator());
  }

  getErrorWidget(message) {
    return Center(child: Text(message));
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();
    return BlocListener(
      listener: (context, state) {
        if (state is WordSearchedState && state.words != null) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ListScreen(state.words)));
        }
      },
      bloc: cubit,
      child: Scaffold(
          backgroundColor: Colors.blueGrey[900],
          body: cubit.state is WordSearchingState
              ? getLoadingWidget()
              : cubit.state is ErrorState
                  ? getErrorWidget("Some Error occured")
                  : cubit.state is NoWordSearchedState
                      ? getDictionaryFormWidget(context)
                      : Container()),
    );
  }
}
