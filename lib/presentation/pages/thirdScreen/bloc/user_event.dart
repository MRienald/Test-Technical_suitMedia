part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class GetUserEvent extends UserEvent {

  GetUserEvent();

  @override
  List<Object> get props => [];
}