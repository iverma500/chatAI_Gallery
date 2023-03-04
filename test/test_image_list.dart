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
  group('Testing Photo List', () {

    test('A new photo should be added to the gallery', () {

      final Image imageWidget = Image.asset(
        'images/img0.jpg',
        package: 'test_package',
      );

      final Image imageWidgetError = Image.asset(
        'images/imgError.jpg',
        package: 'test_package',
      );

      assert(imageWidget.image is AssetImage);
      final AssetImage assetImage = imageWidget.image as AssetImage;
      expect(assetImage.keyName, 'packages/test_package/images/img0.jpg');

      assert(imageWidgetError.image is AssetImage);
      final AssetImage assetImageWrong = imageWidgetError.image as AssetImage;
      expect(assetImageWrong.keyName == 'packages/test_package/images/img1.jpg', false);
    });
  });
}