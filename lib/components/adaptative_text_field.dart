import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdapatativeTextField extends StatelessWidget {
  final void Function(String) onSubmitted;
  final TextEditingController controller;
  final String label;
  final TextInputType? keyboardType;
  const AdapatativeTextField({
    Key? key,
    required this.onSubmitted,
    required this.controller,
    required this.label,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: CupertinoTextField(
              controller: controller,
              keyboardType: keyboardType,
              onSubmitted: onSubmitted,
              placeholder: label,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
            ),
          )
        : TextField(
            onSubmitted: onSubmitted,
            keyboardType: keyboardType,
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }
}
