import 'package:dictionary/model/word_response.dart';
import 'package:dictionary/screens/details/details_screen.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class ListScreen extends StatelessWidget {
  late final List<WordResponse> words;
  ListScreen(this.words);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                title: Text(
                  "${index + 1}.${words[index].word}",
                  style: const TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreen(words[index])));
                },
              ),
          separatorBuilder: (context, index) => const Divider(
                color: Colors.grey,
              ),
          itemCount: words.length),
    );
  }
}
