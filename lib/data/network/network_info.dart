import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo{
  Future<bool> get isConnected;
}
class NetworkInfoImplementer implements NetworkInfo{

  DataConnectionChecker _connectionChecker;
  NetworkInfoImplementer(this._connectionChecker);
  @override
  // TODO: implement isConnected
  Future<bool> get isConnected => _connectionChecker.hasConnection;
}