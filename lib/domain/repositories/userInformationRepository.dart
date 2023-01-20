import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:suitemedia_flutter_test/common/failure.dart';
import 'package:suitemedia_flutter_test/data/source/remote/userInformation/user_information.dart';

abstract class UserInformationRepository{
  Future<Either<Failure, List<User>>> getUserInformation();

}