import 'dart:async';
import 'dart:io';

import 'package:logger/logger.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:suitemedia_flutter_test/common/internetCheck.dart';
import 'package:suitemedia_flutter_test/data/source/remote/userInformation/user_information.dart';
import 'package:suitemedia_flutter_test/domain/usecases/userinformation/getUserInformation.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  GetUserInformation getUserInformationUseCase;

  UserBloc({
    required this.getUserInformationUseCase,

  }) : super(UserLoadingState()) {
    on<GetUserEvent>(_getUser);
  }

  void _getUser(
    GetUserEvent event, Emitter<UserState> emit
  ) async{
    final hasInternet = await InternetCheck().hasConnection();
    if(hasInternet){
      List<User> listUser = [];
      final resultUser = await getUserInformationUseCase.execute();

      resultUser.fold((failure){
        emit(UserErrorState());
      }, (response) {
        listUser = response;
        Logger().i(response);
      });

      if(listUser.isNotEmpty){
        emit(UserLoadedState(listUser: listUser));
      }else{
        emit(UserNoInternetState());
      }
    }else{
      emit(UserNoInternetState());
    }
  }

}