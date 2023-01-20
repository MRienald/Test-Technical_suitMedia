
import 'package:dartz/dartz.dart';
import 'package:suitemedia_flutter_test/common/failure.dart';
import 'package:suitemedia_flutter_test/data/source/remote/userInformation/user_information.dart';
import 'package:suitemedia_flutter_test/domain/repositories/userInformationRepository.dart';

class GetUserInformation{
  final UserInformationRepository repository;

  GetUserInformation(this.repository);

  Future<Either<Failure, List<User>>> execute(){
    return repository.getUserInformation();
  }
}