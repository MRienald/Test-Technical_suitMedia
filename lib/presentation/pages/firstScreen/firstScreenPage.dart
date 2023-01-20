
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suitemedia_flutter_test/presentation/pages/firstScreen/component/dialog_component.dart';
import 'package:suitemedia_flutter_test/presentation/pages/firstScreen/component/txtinput_component.dart';
import 'package:suitemedia_flutter_test/presentation/pages/secondScreen/secondScreenPage.dart';

import '../../component/constant.dart';

class FirstScreenPage extends StatefulWidget {
  const FirstScreenPage({Key? key}) : super(key: key);

  @override
  State<FirstScreenPage> createState() => _FirstScreenPageState();
  
}

class _FirstScreenPageState extends State<FirstScreenPage>{

  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _palindromeTextController = TextEditingController();

  bool checkPolindrom(String text){
    return text == text.split("").reversed.join();
  }

  @override
 @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: blue2,
        body: Container(
          padding: EdgeInsets.only(left: 32.w, right: 33.w),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/firstScreen/background.png'),
              fit: BoxFit.cover
            )
          ),
          child: _body(context),
        )
      )
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 186.h,
        ),
        Image.asset(
          'assets/firstScreen/ic_photo.png',
          width: 116.w,
          height: 116.h,
        ),
        SizedBox(
          height: 58.h,
        ),
        _textField(_nameTextController, "Name"),
        SizedBox(
          height: 22.h,
        ),
        _textField(_palindromeTextController, "Palindrome"),
        SizedBox(
          height: 45.h,
        ),
        _Button("CHECK"),
        SizedBox(
          height: 15.h,
        ),
        _Button("NEXT")
      ],
    );
  }

  Widget _textField(TextEditingController textEditingController, String hintText){
    return Container(
        decoration:
          BoxDecoration(
            color: white, 
            borderRadius: BorderRadius.circular(12.r)
          ),
        child: TextFormField(
          style: hintTextStyle.copyWith(color: neutral90),
          controller: textEditingController,
          decoration: inputDecorationTextInput(
            color: white,
            hintText: hintText,
          ),
        ),
      );
  }

  Widget _Button(String type){
    return GestureDetector(
      onTap: (){
        if(type == "CHECK"){
          if(_palindromeTextController.text.isNotEmpty){
            if(_palindromeTextController.text.length == 1){
              YYShortLenghtFieldDialog(context);
            }else{
              checkPolindrom(_palindromeTextController.text)
              ? YYisPolindromDialog(context)
              : YYisNotPolindromDialog(context);
            }
          }else{
            YYFieldEmptyDialog(context);
          }
        }else if(type == "NEXT"){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => SecondScreenPage()
            )
          );
        }
      },
      child: Container(
        height: 41.h,
        width: 310.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color(0xFF2B637B), 
            borderRadius: BorderRadius.circular(12.r)),
        child: Center(
          child: Text(
            type,
            style: TextStyle(
              color: white,
              fontSize: 18.sp,
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}