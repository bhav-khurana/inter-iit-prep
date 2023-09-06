import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:http/http.dart" as http;

class API {
  static const url = 'https://api.openai.com/v1/chat/completions';
  static String? openAIKey = dotenv.env['OPENAI_API_KEY'];

  static Future<int> getCalorieCount(List<Map> messages, String gender, int age, int currWeight, int targetWeight, String expectedTime, String comments) async {
    messages.add({
      'role': 'user',
      'content': "I am a $gender. I am $age years old. My current weight is $currWeight kg. I want to reach $targetWeight kg in $expectedTime. $comments. Give me my expected calorie consumption per day. Reply with ONLY a single integer and NO OTHER TEXT.",
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
        int calorieCount = int.parse(content);
        messages.add({
          'role': 'assistant',
          'content': content,
        });
        return calorieCount;
      }
      return -1;
    } catch (e) {
      debugPrint(e.toString());
      return -1;
    }
  }

  static Future<int> getCaloriesToBeIncreased(List<Map> messages, String item, String quantity) async {
    messages.add({
      'role': 'user',
      'content': "I ate $item in the quantity of $quantity. What is the approximate number of calories I gained? Assume standard conditions wherever necessary. Reply with ONLY a single integer and NO OTHER TEXT.",
    });
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIKey}',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": messages,
        }),
      );
      if (response.statusCode == 200) {
        String content = jsonDecode(response.body)['choices'][0]['message']['content'];
        int calorieCount = int.parse(content);
        messages.add({
          'role': 'assistant',
          'content': content,
        });
        return calorieCount;
      }
      return -1;
    } catch (e) {
      debugPrint(e.toString());
      return -1;
    }
  }
}