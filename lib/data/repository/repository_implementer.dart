import 'package:dartz/dartz.dart';
import 'package:store/data/data_source/remote_data_source.dart';
import 'package:store/data/network/error%20handler.dart';
import 'package:store/data/network/failure.dart';
import 'package:store/data/network/network_info.dart';
import 'package:store/data/request/request.dart';
import 'package:store/data/mapper/mapper.dart';
import 'package:store/domain/model/model.dart';
import 'package:store/domain/repository/repository.dart';

class RepositoryImplementer implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _connection;

  RepositoryImplementer(this._remoteDataSource, this._connection);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _connection.isConnected) {
      try{
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.SUCCESS) {
          //return right response data
          return Right(response.toDomain());
        }
        else {
          //return business error
          //return left
          return Left(Failure(response.status??ApiInternalStatus.FAILURE,response.message??ResponseMessage.DEFAULT));
        }
      }
      catch(error){
        return (Left(ErrorHandler.handle(error).failure));
      }
      // safe to call api

    }
    //isConnection is false
    else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
