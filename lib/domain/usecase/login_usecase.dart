
import 'package:clean_architecture/app/functions.dart';
import 'package:clean_architecture/data/network/failure.dart';
import 'package:clean_architecture/data/request/request.dart';
import 'package:clean_architecture/domain/model/model.dart';
import 'package:clean_architecture/domain/repository/repository.dart';
import 'package:clean_architecture/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication>{
  Repository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, Authentication>> execute(LoginUseCaseInput input) async{

    DeviceInfo deviceInfo =await getDeviceDetails();

  return  await repository.login(LoginRequest(input.username, input.password, deviceInfo.identifier, deviceInfo.name));

  }

}

class LoginUseCaseInput{
  String username;
  String password;
  LoginUseCaseInput(this.username,this.password);
}