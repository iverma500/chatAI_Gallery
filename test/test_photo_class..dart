// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:developer';

import 'package:app/classes/Photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app/main.dart';

void main() {
  group('Testing Photo Class', () {

    test('A new photo should be created', () {
      String name = 'photo1';
      String url = 'https://imagen_prueba.jpg';

      var photo = Photo(name, url);

      expect(photo.name == 'photo1', true);
      expect(photo.url == 'https://imagen_prueba.jpg', true);

    });
  });
}