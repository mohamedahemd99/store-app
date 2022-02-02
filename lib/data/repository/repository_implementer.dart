import 'package:dartz/dartz.dart';
import 'package:store/data/data_source/remote_data_source.dart';
import 'package:store/data/network/failure.dart';
import 'package:store/data/network/network_info.dart';
import 'package:store/data/request/request.dart';
import 'package:store/data/mapper/mapper.dart';
import 'package:store/domain/model.dart';
import 'package:store/domain/repository.dart';

class RepositoryImplementer implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _connection;

  RepositoryImplementer(this._remoteDataSource, this._connection);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _connection.isConnected) {
      // safe to call api
      final response = await _remoteDataSource.login(loginRequest);
      if (response.status == 0) {
        //return right response data
        return Right(response.toDomain());
      } else {
        //return bussinuss error
        //return left
        return Left(Failure(409, response.message ?? "error from server side"));
      }
    }
    //isConnection is false
    else {
      return Left(Failure(501, "check your internet connection"));
    }
  }
}
