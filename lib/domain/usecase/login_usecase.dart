import 'package:dartz/dartz.dart';
import 'package:store/app/functions.dart';
import 'package:store/data/network/failure.dart';
import 'package:store/data/request/request.dart';
import 'package:store/domain/model/model.dart';
import 'package:store/domain/repository/repository.dart';
import 'package:store/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput,Authentication>{

  final Repository _repository;
  LoginUseCase(this._repository);
  @override
  Future<Either<Failure, Authentication>> execute(input) async{
    DeviceInfo deviceInfo=await getDeviceInfo();
   return await _repository.login(LoginRequest(input.email, input.password, deviceInfo.identifier,deviceInfo.name));
  }
}

class LoginUseCaseInput{
  String email;
  String password;
  LoginUseCaseInput(this.email,this.password);
}