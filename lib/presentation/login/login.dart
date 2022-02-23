import 'package:flutter/material.dart';
import 'package:store/app/di.dart';
import 'package:store/presentation/login/login_viewmodel.dart';
import 'package:store/presentation/resources/assets_manager.dart';
import 'package:store/presentation/resources/routes_manager.dart';
import 'package:store/presentation/resources/strings_manager.dart';
import 'package:store/presentation/resources/values_manager.dart';

import '../resources/color_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _build() {
    _viewModel.start();
    _userNameController
        .addListener(() => _viewModel.setUserName(_userNameController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));
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
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Container(
        padding: const EdgeInsets.only(top: AppPadding.p100),
        child: SingleChildScrollView(
          physics:  BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: AppSize.s28,
                ),
                const Image(
                  image: AssetImage(ImageAssets.splashLogo),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                      stream: _viewModel.outputIsUsernameValid,
                      builder: (context, snapshotUsername) {
                        return TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _userNameController,
                          decoration: InputDecoration(
                            hintText: AppStrings.userName,
                            labelText: AppStrings.userName,
                            errorText: (snapshotUsername.data ?? true)
                                ? null
                                : AppStrings.userNameError,
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                      stream: _viewModel.outputIsPasswordValid,
                      builder: (context, snapshotPassword) {
                        return TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          controller: _passwordController,
                          autofillHints: [AutofillHints.email],
                          decoration: InputDecoration(
                            hintText: AppStrings.password,
                            labelText: AppStrings.password,
                            errorText: (snapshotPassword.data ?? true)
                                ? null
                                : AppStrings.passwordError,

                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                SizedBox(
                  height: AppSize.s40,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p28, right: AppPadding.p28),
                    child: StreamBuilder<bool>(
                        stream: _viewModel.outputIsAllInputsValid,
                        builder: (context, snapshot) {
                          return ElevatedButton(
                              onPressed: (snapshot.data?? false)
                                  ? () async{
                                     await _viewModel.login();
                                    }
                                  : null,
                              child: const Text(AppStrings.login));
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p28,
                    top: AppPadding.p8,
                    right: AppPadding.p28,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.forgotPasswordRoute);
                          },
                          child: Text(
                            AppStrings.forgetPassword,
                            style: TextStyle(color: ColorManager.primary),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.registerRoute);
                          },
                          child: Text(
                            AppStrings.registerText,
                            style: TextStyle(color: ColorManager.primary),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
