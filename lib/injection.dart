import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:suitemedia_flutter_test/common/internetCheck.dart';
import 'package:suitemedia_flutter_test/data/repositories/userInformationRepositoryImpl.dart';
import 'package:suitemedia_flutter_test/domain/repositories/userInformationRepository.dart';
import 'package:suitemedia_flutter_test/domain/usecases/userinformation/getUserInformation.dart';
import 'package:suitemedia_flutter_test/presentation/pages/thirdScreen/bloc/user_bloc.dart';

final locator = GetIt.instance;

void init() {
  initRepository();
  initUseCase();
  initBloc();

  // external
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => Logger());
  locator.registerLazySingleton(() => InternetCheck());
}

void initRepository() {
  locator.registerLazySingleton<UserInformationRepository>(
    () => UserInformationRepositoryImpl(
      client: locator(),
    ),
  );
}

void initUseCase() {
  locator.registerLazySingleton(() => GetUserInformation(locator()));
}

void initBloc() {
  locator.registerFactory(
    () => UserBloc(
      getUserInformationUseCase: locator()
    ),
  );
}