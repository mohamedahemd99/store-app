import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/presentation/login/login_viewmodel.dart';
import 'package:store/presentation/resources/assets_manager.dart';
import 'package:store/presentation/resources/strings_manager.dart';
import 'package:store/presentation/resources/values_manager.dart';

import '../resources/color_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel _viewModel = LoginViewModel(null);
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

  _build() {
    _viewModel.start();
    _userNameController
        .addListener(() => _viewModel.setUserName(_userNameController.text));
    _passwordController
        .addListener(() => _viewModel.setUserName(_passwordController.text));
  }

  @override
  void initState() {
    _build();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: AppPadding.p100),
      color: ColorManager.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SvgPicture.asset(ImageAssets.loginIc),
              const SizedBox(
                height: AppSize.s28,
              ),
               Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsUsernameValid,
                    builder:(context,snapshot){
                      return TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _userNameController,
                        decoration:  InputDecoration(
                          hintText: AppStrings.userName,
                          labelText: AppStrings.userName,
                          errorText:(snapshot.data??true)?null:AppStrings.userNameError,
                        ),
                      );
                    }
                ),
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
               Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsUsernameValid,
                    builder:(context,snapshot){
                      return TextFormField(
                        obscureText: true,
                        keyboardType: TextInputType.emailAddress,
                        controller: _userNameController,
                        decoration:  InputDecoration(
                          hintText: AppStrings.password,
                          labelText: AppStrings.password,
                          errorText:(snapshot.data??true)?null:AppStrings.passwordError,
                        ),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
