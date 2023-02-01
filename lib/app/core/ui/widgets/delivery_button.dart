import 'package:flutter/material.dart';

class DeliveryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double? widht;
  final double? height;

  const DeliveryButton(
      {super.key, required this.label, required this.onPressed, this.widht, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widht,
      height: height,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(label),
      ),
    );
  }
}
