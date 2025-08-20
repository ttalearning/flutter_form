import 'package:flutter/material.dart';

import 'package:flutter_form/pratice1.dart';
import 'package:flutter_form/pratice2.dart';

import 'package:flutter_form/pratice3.dart';
import 'package:flutter_form/pratice4_form.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SafeArea(child: MyWidget())),
    ),
  );
}
