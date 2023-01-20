
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suitemedia_flutter_test/data/source/local/sharedpreferences.dart';
import 'package:suitemedia_flutter_test/presentation/component/customAppBar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitemedia_flutter_test/presentation/pages/thirdScreen/bloc/user_bloc.dart';
import 'package:suitemedia_flutter_test/presentation/pages/thirdScreen/thirdScreenPage.dart';

import '../../component/constant.dart';
import 'package:suitemedia_flutter_test/injection.dart' as di;

class SecondScreenPage extends StatefulWidget {
  const SecondScreenPage({Key? key}) : super(key: key);

  @override
  State<SecondScreenPage> createState() => _SecondScreenPageState();
  
}

class _SecondScreenPageState extends State<SecondScreenPage>{

  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _palindromeTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: whiteBgPage,
        appBar: CustomAppBar(
          title: "Second Screen",
          leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.black, 
                  onPressed: ()=> Navigator.of(context).pop(),
                ),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 32.w, right: 33.w),
          child: _body(context),
        )
      )
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 12.h,
        ),
        Text(
          "Welcome",
          style: TextStyle(
              color: neutral100,
              fontSize: 20.sp,
              letterSpacing: 1,
              fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          Prefs.getUsername() ?? "User",
          style: TextStyle(
             color: neutral100,
              fontSize: 18.sp,
              letterSpacing: 1,
              fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(
          height: 120.h,
        ),
        _content(),
        SizedBox(
          height: 260.h,
        ),
        _buttonChooseUser()
      ],
    );
  }

  Widget _content(){
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              Prefs.getAvatar() ?? "https://www.pngitem.com/pimgs/m/421-4212341_default-avatar-svg-hd-png-download.png"
            ),
            maxRadius: 100.w,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            Prefs.getEmail() ?? "Selected User Name",
            style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            letterSpacing: 1,
            fontWeight: FontWeight.w500,
          ),
          )
        ],
      ),
    );
  }

  Widget _buttonChooseUser(){
    return GestureDetector(
      onTap: () => Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => di.locator<UserBloc>()
            ..add(GetUserEvent()),
            child: ThirdScreenPage(),
          )
        )
      ),
      child: Container(
        height: 41.h,
        width: 310.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color(0xFF2B637B), 
            borderRadius: BorderRadius.circular(12.r)),
        child: Center(
          child: Text(
            "Choose a User",
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