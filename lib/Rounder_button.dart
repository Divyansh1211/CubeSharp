import 'package:flutter/material.dart';

class Rounded_Button extends StatelessWidget {
  const Rounded_Button(
      {required this.color,
      required this.text,
      required this.onPressed,
      this.BR,
      this.mW,
      this.H});

  final double? BR, mW, H;
  final Color? color;
  final String? text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(BR ?? 30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: mW ?? 250.0,
          height: H ?? 42.0,
          child: Text(
            text!,
          ),
        ),
      ),
    );
  }
}
