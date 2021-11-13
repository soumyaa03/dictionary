// import 'dart:io';

import 'package:dictionary/model/word_response.dart';
import 'package:dictionary/service/http_service.dart';

class WordRepository {
  Future<List<WordResponse>> getWordsFromDictionary(String query) async {
    final response = await HttpService.getRequest("en_US/$query");

    final result = wordResponseFromJson(response.body);
    return result;
  }
}
