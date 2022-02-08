import 'dart:async';
import 'package:store/domain/usecase/login_usecase.dart';
import 'package:store/presentation/base/base_view_model.dart';
import 'package:store/presentation/common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _userNameStreamController =
  StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
  StreamController<String>.broadcast();
  var loginObject = LoginObject("", "");
  final LoginUseCase? _loginUseCase;

  LoginViewModel(this._loginUseCase);

  //input
  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
  }

  @override
  setUserName(String userName) {
    inputUsername.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
  }

  @override
  login() async {
    (await _loginUseCase!.execute(LoginUseCaseInput(loginObject.userName, loginObject.password),
    )).fold((failure) {
      //left -> failure
      print(failure.message);
    }, (data) {
      //right ->success
      print(data.customer?.name);
    });
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUsername => _userNameStreamController.sink;

  //output
  @override
  Stream<bool> get outputIsPasswordValid =>
      _passwordStreamController.stream
          .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsUsernameValid =>
      _userNameStreamController.stream
          .map((userName) => _isUserNameValid(userName));

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }
}

abstract class LoginViewModelInputs {
  //three function for inputs set username,password and login function
  setUserName(String userName);

  setPassword(String password);

  login();

  //two sink for username and password
  Sink get inputUsername;

  Sink get inputPassword;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUsernameValid;

  Stream<bool> get outputIsPasswordValid;
}
