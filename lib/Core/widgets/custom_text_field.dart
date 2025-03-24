
import 'package:flutter/material.dart';
import 'package:mini_store/Core/utils/app_colors.dart';
import 'package:mini_store/Core/utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.onChanged, this.textInputType, required this.text,
  });

  final Function(String) onChanged; 
  final TextInputType? textInputType;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.black, width: 2.0),
        ),
        prefixIcon: Icon(
          Icons.search,
        ),
        hintText: text,
        hintStyle: AppStyles.textMedium16,
      ),
    );
  }
}