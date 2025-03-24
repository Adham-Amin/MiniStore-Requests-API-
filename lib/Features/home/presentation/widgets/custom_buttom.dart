
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key, required this.text,  this.onTap
  });
  final VoidCallback? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12)
        ),
        alignment: Alignment.center,
        child:  Text(text, style: const TextStyle(fontSize: 16, color: Colors.white),),
      ),
    );
  }
}
