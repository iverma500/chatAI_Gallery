// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';
import 'dart:developer';

import 'package:app/classes/Photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:app/main.dart';

void main() {
  group('Testing Api Call', () {

    test('Call == 200', () async {

      String apiKey = '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';
      String apiKeyWrong = 'sk-A05k2mfo4iMcQvJT3BlbkFJyM3goNwsnGdqPntebCMu';

      String url = 'https://api.openai.com/v1/images/generations';

      var data = {
        "prompt" : 'bear in hawaii',
        "n" : 1,
        "size" : "256x256",
      };

      var dataWrong = {
        "prompt" : '',
        "n" : 1,
        "size" : "256x256",
      };

      var response = await http.post(
          Uri.parse(url),
          headers: {"Authorization":"Bearer $apiKey","Content-Type" : "application/json"},
          body: jsonEncode(data)
      );

      var responseWrong = await http.post(
          Uri.parse(url),
          headers: {"Authorization":"Bearer $apiKeyWrong","Content-Type" : "application/json"},
          body: jsonEncode(data)
      );

      var responseWrongData = await http.post(
          Uri.parse(url),
          headers: {"Authorization":"Bearer $apiKey","Content-Type" : "application/json"},
          body: jsonEncode(dataWrong)
      );

      expect(response.statusCode == 200, true);
      expect(responseWrong.statusCode != 200, true);
      expect(responseWrongData.statusCode != 200, true);

    });
  });
}