import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:http/http.dart" as http;

class API {
  static const url = 'https://api.openai.com/v1/chat/completions';
  static String? openAIKey = dotenv.env['OPENAI_API_KEY'];

  static List<String> parseFlashcards(String text) {
    List<String> flashcards = text.split('\n');
    return flashcards;
  }

  static Future<String> getSummary(List<Map> messages, String text, int noOfCards) async {
    messages.add({
      'role': 'user',
      'content': 'Generate a summary for the following paragraph(s) in $noOfCards (not too long) points. The points should be separated by a new line character and should be numbered from 1 to $noOfCards. The paragraph is: $text',
    });
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": messages,
        }),
      );
      if (response.statusCode == 200) {
        String content = jsonDecode(response.body)['choices'][0]['message']['content'];
        print(content);
        print(parseFlashcards(content));
        messages.add({
          'role': 'assistant',
          'content': content,
        });
        return content;
      }
      return '';
    } catch (e) {
      debugPrint(e.toString());
      return '';
    }
  }
}