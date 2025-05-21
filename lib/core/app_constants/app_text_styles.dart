import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/app_constants/app_colors.dart';

class ApptTextStyles {
  ApptTextStyles._();

  static TextStyle font11Grey600Normal = TextStyle(
    fontSize: 11.sp,
    color: Colors.grey.shade600,
    fontWeight: FontWeight.normal,
  );

  static TextStyle font12GreyMedium = TextStyle(
    fontSize: 12.sp,
    color: Colors.grey,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font13GreyNormal = TextStyle(
    fontSize: 13.sp,
    color: Colors.grey,
    fontWeight: FontWeight.normal,
  );

  static TextStyle font14PrimaryColorMedium = TextStyle(
    fontSize: 14.sp,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font15BlackMedium = TextStyle(
    fontSize: 15.sp,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font16BlackBold = TextStyle(
    fontSize: 16.sp,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font18WhiteBold = TextStyle(
    fontSize: 18.sp,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  static TextStyle font20BlackMedium = TextStyle(
    fontSize: 20.sp,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font24BlackSemiBold = TextStyle(
    fontSize: 24.sp,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
}
