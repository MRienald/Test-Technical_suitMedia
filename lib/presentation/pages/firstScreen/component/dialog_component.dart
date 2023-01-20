import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suitemedia_flutter_test/presentation/component/constant.dart';

YYDialog YYisNotPolindromDialog(BuildContext context) {
  return YYDialog().build(context)
    ..width = 340.w
    ..height = 231.h
    ..backgroundColor = whiteBgPage
    ..borderRadius = 10.0
    ..showCallBack = () {
      print("showCallBack invoke");
    }
    ..barrierDismissible = false
    ..widget(Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: Image.asset(
        'assets/firstScreen/icon_danger.png',
        width: 62.w,
        height: 62.h,
      ),
    ))
     ..widget(Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Text(
        "Is not Polindrom",
        style: TextStyle(
          fontSize: 18.sp, 
          color: neutral90, 
          fontWeight: FontWeight.w700
        ),
      ),
    ))
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
        child: child,
        scale: Tween(begin: 0.0, end: 1.0).animate(animation),
      );
    }
    ..widget(Padding(
      padding: EdgeInsets.only(top: 27.h),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: 129.w,
          height: 48.h,
          decoration: BoxDecoration(
              color: biruMuda2, borderRadius: BorderRadius.circular(5.r)),
          child: Center(
            child: Text(
              "Back",
              style: TextStyle(
                  fontSize: 16.sp, color: white, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    ))
    ..show();
}

YYDialog YYFieldEmptyDialog(BuildContext context) {
  return YYDialog().build(context)
    ..width = 340.w
    ..height = 231.h
    ..backgroundColor = whiteBgPage
    ..borderRadius = 10.0
    ..showCallBack = () {
      print("showCallBack invoke");
    }
    ..barrierDismissible = false
    ..widget(Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: Image.asset(
        'assets/firstScreen/icon_danger.png',
        width: 62.w,
        height: 62.h,
      ),
    ))
     ..widget(Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Text(
        "Field is Empty",
        style: TextStyle(
          fontSize: 18.sp, 
          color: neutral90, 
          fontWeight: FontWeight.w700
        ),
      ),
    ))
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
        child: child,
        scale: Tween(begin: 0.0, end: 1.0).animate(animation),
      );
    }
    ..widget(Padding(
      padding: EdgeInsets.only(top: 27.h),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: 129.w,
          height: 48.h,
          decoration: BoxDecoration(
              color: biruMuda2, borderRadius: BorderRadius.circular(5.r)),
          child: Center(
            child: Text(
              "Back",
              style: TextStyle(
                  fontSize: 16.sp, color: white, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    ))
    ..show();
}

YYDialog YYShortLenghtFieldDialog(BuildContext context) {
  return YYDialog().build(context)
    ..width = 340.w
    ..height = 231.h
    ..backgroundColor = whiteBgPage
    ..borderRadius = 10.0
    ..showCallBack = () {
      print("showCallBack invoke");
    }
    ..barrierDismissible = false
    ..widget(Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: Image.asset(
        'assets/firstScreen/icon_danger.png',
        width: 62.w,
        height: 62.h,
      ),
    ))
     ..widget(Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Text(
        "The input must be more than one character",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18.sp, 
          color: neutral90, 
          fontWeight: FontWeight.w700
        ),
      ),
    ))
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
        child: child,
        scale: Tween(begin: 0.0, end: 1.0).animate(animation),
      );
    }
    ..widget(Padding(
      padding: EdgeInsets.only(top: 27.h),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: 129.w,
          height: 48.h,
          decoration: BoxDecoration(
              color: biruMuda2, borderRadius: BorderRadius.circular(5.r)),
          child: Center(
            child: Text(
              "Back",
              style: TextStyle(
                  fontSize: 16.sp, color: white, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    ))
    ..show();
}

YYDialog YYisPolindromDialog(BuildContext context) {
  return YYDialog().build(context)
    ..width = 340.w
    ..height = 231.h
    ..backgroundColor = whiteBgPage
    ..borderRadius = 10.0
    ..showCallBack = () {
      print("showCallBack invoke");
    }
    ..barrierDismissible = false
    ..widget(Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: Image.asset(
        'assets/firstScreen/icon_success.png',
        width: 62.w,
        height: 62.h,
      ),
    ))
     ..widget(Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Text(
        "Is Polindrom",
        style: TextStyle(
          fontSize: 18.sp, 
          color: neutral90, 
          fontWeight: FontWeight.w700
        ),
      ),
    ))
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
        child: child,
        scale: Tween(begin: 0.0, end: 1.0).animate(animation),
      );
    }
    ..widget(Padding(
      padding: EdgeInsets.only(top: 27.h),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: 129.w,
          height: 48.h,
          decoration: BoxDecoration(
              color: biruMuda2, borderRadius: BorderRadius.circular(5.r)),
          child: Center(
            child: Text(
              "Back",
              style: TextStyle(
                  fontSize: 16.sp, color: white, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    ))
    ..show();
}