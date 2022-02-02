import 'package:dartz/dartz.dart';
import 'package:store/data/network/failure.dart';
import 'package:store/data/request/request.dart';
import 'package:store/domain/model.dart';

abstract class Repository{
  Future<Either<Failure,Authentication>>login(LoginRequest loginRequest );
}