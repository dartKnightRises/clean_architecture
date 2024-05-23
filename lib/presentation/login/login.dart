import 'package:clean_architecture/app/dependency_injection.dart';
import 'package:clean_architecture/data/data_source/remote_data_source.dart';
import 'package:clean_architecture/data/repository/repository_impl.dart';
import 'package:clean_architecture/domain/repository/repository.dart';
import 'package:clean_architecture/domain/usecase/login_usecase.dart';
import 'package:clean_architecture/presentation/login/login_view_model.dart';
import 'package:clean_architecture/presentation/resources/color_manager.dart';
import 'package:clean_architecture/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {


  LoginViewModel loginViewModel = instance<LoginViewModel>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _bind(){
    loginViewModel.start();
    userNameController.addListener(()=>loginViewModel.setUserName(userNameController.text));
    passwordController.addListener(()=>loginViewModel.setPassword(passwordController.text));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget(){
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: AppPadding.p100),
        color: ColorManager.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SvgPicture.asset(ImageAssets.loginIC),
                const SizedBox(height: AppSize.s28),
                Padding(padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                    stream: loginViewModel.outputIsUserNameValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: userNameController,
                        decoration: InputDecoration(
                            hintText: AppStrings.username,
                            labelText: AppStrings.username,
                            errorText: (snapshot.data ?? true)
                                ? null
                                : AppStrings.usernameError
                        ),
                      );
                    },
                  ),),
                const SizedBox(height: AppSize.s28),
                Padding(padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                    stream: loginViewModel.outputIsPasswordValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                        decoration: InputDecoration(
                            hintText: AppStrings.password,
                            labelText: AppStrings.password,
                            errorText: (snapshot.data ?? true)
                                ? null
                                : AppStrings.passwordError
                        ),
                      );
                    },
                  ),),
                const SizedBox(height: AppSize.s28),
                Padding(padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                    child: StreamBuilder<bool>(
                      stream: loginViewModel.outputIsAllInputsValid,
                      builder: (context, snapshot) {
                      return ElevatedButton(
                          onPressed: (snapshot.data ?? false)
                              ? () {
                            loginViewModel.login();
                          } : null, child: const Text(AppStrings.login));
                    },
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    loginViewModel.dispose();
    super.dispose();
  }
}
