// To parse this JSON data, do
//
//     final wordResponse = wordResponseFromJson(jsonString);

import 'dart:convert';

List<WordResponse> wordResponseFromJson(String str) => List<WordResponse>.from(
    json.decode(str).map((x) => WordResponse.fromJson(x)));

String wordResponseToJson(List<WordResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WordResponse {
  WordResponse({
    required this.word,
    required this.phonetics,
    required this.meanings,
  });

  String word;
  List<Phonetic> phonetics;
  List<Meaning> meanings;

  factory WordResponse.fromJson(Map<String, dynamic> json) => WordResponse(
        word: json["word"],
        phonetics: List<Phonetic>.from(
            json["phonetics"].map((x) => Phonetic.fromJson(x))),
        meanings: List<Meaning>.from(
            json["meanings"].map((x) => Meaning.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "word": word,
        "phonetics": List<dynamic>.from(phonetics.map((x) => x.toJson())),
        "meanings": List<dynamic>.from(meanings.map((x) => x.toJson())),
      };
}

class Meaning {
  Meaning({
    required this.partOfSpeech,
    required this.definitions,
  });

  String partOfSpeech;
  List<Definition> definitions;

  factory Meaning.fromJson(Map<String, dynamic> json) => Meaning(
        partOfSpeech: json["partOfSpeech"],
        definitions: List<Definition>.from(
            json["definitions"].map((x) => Definition.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "partOfSpeech": partOfSpeech,
        "definitions": List<dynamic>.from(definitions.map((x) => x.toJson())),
      };
}

class Definition {
  Definition({
    required this.definition,
    required this.example,
  });

  String definition;
  String example;

  factory Definition.fromJson(Map<String, dynamic> json) => Definition(
        definition: json["definition"],
        example: json["example"],
      );

  Map<String, dynamic> toJson() => {
        "definition": definition,
        "example": example,
      };
}

class Phonetic {
  Phonetic({
    required this.text,
    required this.audio,
  });

  String text;
  String audio;

  factory Phonetic.fromJson(Map<String, dynamic> json) => Phonetic(
        text: json["text"],
        audio: json["audio"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "audio": audio,
      };
}
