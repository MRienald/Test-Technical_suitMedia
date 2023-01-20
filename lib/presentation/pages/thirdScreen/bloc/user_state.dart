part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class UserErrorState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadedState extends UserState {
  final List<User> listUser;

  UserLoadedState({required this.listUser});

  @override
  List<Object> get props => [listUser];
}

class UserNoInternetState extends UserState {
  @override
  List<Object> get props => [];
}