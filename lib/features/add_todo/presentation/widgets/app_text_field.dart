import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.controller,
  });

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
      ),
      maxLines: label.toLowerCase() == "title" ? 1 : 4,
    );
  }
}
