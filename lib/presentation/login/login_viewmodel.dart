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

  final StreamController _allValidStreamController =
      StreamController<void>.broadcast();

  var loginObject = LoginObject("","");
  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

  //input
  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
    _allValidStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    _validate();
  }

  @override
  setUserName(String userName) {
    inputUsername.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
    _validate();
  }

  @override
   login() async {
    (await _loginUseCase.execute(LoginUseCaseInput(loginObject.userName, loginObject.password),))
       .fold((failure) {
      //left -> failure
      print(failure.message);
    }, (data) {
      //right ->success
      print(data.customer?.name);
    }
    );
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUsername => _userNameStreamController.sink;

  @override
  Sink get inputIsAllInputsValid => _allValidStreamController.sink;

  //output
  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsUsernameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _allValidStreamController.stream.map((_) => _isAllInputsValid());

  bool _isPasswordValid(String password) {
    _validate();
    return password.length>=8;
  }

  bool _isUserNameValid(String userName) {
    _validate();
    return userName.contains("@")&&userName.contains(".com");
  }

  bool _isAllInputsValid() {
    if (_isUserNameValid(loginObject.userName) && _isPasswordValid(loginObject.password)==true) {
      return true;
    } else {
      return false;
    }
  }

  _validate() {
    inputIsAllInputsValid.add(null);
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

  Sink get inputIsAllInputsValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUsernameValid;

  Stream<bool> get outputIsPasswordValid;

  Stream<bool> get outputIsAllInputsValid;
}
