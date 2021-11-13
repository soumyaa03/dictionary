import 'package:dictionary/model/word_response.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final WordResponse wordResponse;

  // ignore: use_key_in_widget_constructors
  const DetailsScreen(this.wordResponse);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Container(
        padding: const EdgeInsets.all(32),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "${wordResponse.word}",
              style: TextStyle(color: Colors.white, fontSize: 36),
            ),
            // ignore: prefer_const_constructors
            SizedBox(height: 16),
            Expanded(
                child: ListView.separated(
              itemBuilder: (context, index) {
                final meaning = wordResponse.meanings[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(meaning.partOfSpeech,
                        style: const TextStyle(color: Colors.white)),
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 32,
              ),
              itemCount: wordResponse.meanings.length,
              shrinkWrap: true,
            ))
          ],
        ),
      ),
    );
  }
}
