import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:suitemedia_flutter_test/common/baseURL.dart';
import 'package:suitemedia_flutter_test/common/failure.dart';
import 'package:suitemedia_flutter_test/data/source/remote/userInformation/user_information.dart';
import 'package:suitemedia_flutter_test/domain/repositories/userInformationRepository.dart';

class UserInformationRepositoryImpl implements UserInformationRepository {
  
  final http.Client client;

  UserInformationRepositoryImpl({required this.client});

  @override
  Future<Either<Failure, List<User>>> getUserInformation() async {
    var uri = Uri.parse(urlreqres);
    var response = await client.get(uri);
    
    if(response.statusCode == 200){
      String jsonDataString = response.body.toString();
      var jsonData = jsonDecode(jsonDataString);
      return Right(UserInformation.fromJson(jsonData).data);
    }else{
      return left(ServerFailure(''));
    }
  }

}