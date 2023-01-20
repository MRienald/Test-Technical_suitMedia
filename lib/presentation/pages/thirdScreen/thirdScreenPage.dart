
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:suitemedia_flutter_test/data/source/local/sharedpreferences.dart';
import 'package:suitemedia_flutter_test/data/source/remote/userInformation/user_information.dart';
import 'package:suitemedia_flutter_test/presentation/component/customAppBar.dart';
import 'package:suitemedia_flutter_test/presentation/component/noInternet.dart';
import 'package:suitemedia_flutter_test/presentation/component/server_problem.dart';
import 'package:suitemedia_flutter_test/presentation/pages/secondScreen/secondScreenPage.dart';
import 'package:suitemedia_flutter_test/presentation/pages/thirdScreen/bloc/user_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../component/constant.dart';

class ThirdScreenPage extends StatefulWidget {
  const ThirdScreenPage({Key? key}) : super(key: key);

  @override
  State<ThirdScreenPage> createState() => _ThirdScreenPageState();
  
}

class _ThirdScreenPageState extends State<ThirdScreenPage>{

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  late UserBloc _userBloc;
  late String dummy;

  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _palindromeTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of<UserBloc>(context);
    return BlocBuilder<UserBloc, UserState>(
      builder: (((context, state) {
        if(state is UserLoadedState){
          return Container(
            child: Scaffold(
              backgroundColor: whiteBgPage,
              appBar: CustomAppBar(
                title: "Third Screen",
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.black, 
                  onPressed: ()=> Navigator.of(context).pop(),
                ),
              ),
              body: RefreshIndicator(
                key: _refreshIndicatorKey,
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                color: Colors.white,
                backgroundColor: Colors.blue,
                strokeWidth: 4.0,
                onRefresh: () async{ 
                  return Future<void>.delayed(const Duration(seconds: 2)).then((value) => _userBloc.add(GetUserEvent()));
                },
                child: _body(context, state.listUser),
              )
            )
          );
        }else if(state is UserLoadingState){
          return Container(
            child: Scaffold(
              backgroundColor: whiteBgPage,
              appBar: CustomAppBar(
                title: "Third Screen",
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.black, 
                  onPressed: ()=> Navigator.of(context).pop(),
                ),
              ),
              body: Container(
                child:  Center(child: CircularProgressIndicator(color: blueLinear1)),
              )
            )
          );
        } else if(state is UserNoInternetState){
          return Container(
            child: Scaffold(
              backgroundColor: whiteBgPage,
              appBar: CustomAppBar(
                title: "Third Screen",
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.black, 
                  onPressed: ()=> Navigator.of(context).pop(),
                ),
              ),
              body: RefreshIndicator(
                key: _refreshIndicatorKey,
                color: Colors.white,
                backgroundColor: Colors.blue,
                strokeWidth: 4.0,
                onRefresh: () async{ 
                  return Future<void>.delayed(const Duration(seconds: 2)).then((value) => _userBloc.add(GetUserEvent()));
                 },
                child:  NoInternet(
                  onPressed: () async{
                    _refreshIndicatorKey.currentState?.show();
                  },
                  buttonHide: false,
                )
              )
            )
          );
        } else{
          return Container(
            child: Scaffold(
              backgroundColor: whiteBgPage,
              appBar: CustomAppBar(
                title: "Third Screen",
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.black, 
                  onPressed: ()=> Navigator.of(context).pop(),
                ),
              ),
              body: RefreshIndicator(
                key: _refreshIndicatorKey,
                color: Colors.white,
                backgroundColor: Colors.blue,
                strokeWidth: 4.0,
                onRefresh: () async{ 
                  return Future<void>.delayed(const Duration(seconds: 2)).then((value) => _userBloc.add(GetUserEvent()));
                 },
                child:  ServerProblem(
                  onPressed: () {
                    _refreshIndicatorKey.currentState?.show();
                  },
                  buttonHide: false,
                )
              )
            )
          );
        }
      }))
    );
  }

  Widget _body(
    BuildContext context, List<User> listUser
  ){
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: listUser.length,
      itemBuilder: (BuildContext context, int i){
        return Container(
          child: _content(
              id: listUser[i].id, 
              firstName: listUser[i].firstName, 
              lastName: listUser[i].lastName, 
              email: listUser[i].email, 
              avatar: listUser[i].avatar
            )
        );
      }
    );
  }
  Widget _content({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required String avatar,
  }){
    return GestureDetector(
      onTap: () {
        Prefs.setUsername("$firstName $lastName");
        Prefs.setEmail(email);
        Prefs.setAvatar(avatar);
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(
            builder: (context)=>SecondScreenPage(),
          )
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 40.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                avatar,
              ),
              maxRadius: 30.w,
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$firstName $lastName",
                  style: TextStyle(
                      color: neutral100,
                      fontSize: 16.sp,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  email,
                  style: TextStyle(
                      color: neutral100,
                      fontSize: 10.sp,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}