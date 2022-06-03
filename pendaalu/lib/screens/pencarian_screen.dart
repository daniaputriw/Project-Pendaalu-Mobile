import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

class Pencarian extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Pencarian',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600
          ),
        ), 
        ),
    );
  }
}