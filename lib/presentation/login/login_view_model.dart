import 'dart:async';

import 'package:clean_architecture/domain/usecase/login_usecase.dart';
import 'package:clean_architecture/presentation/base/base_view_model.dart';
import 'package:clean_architecture/presentation/common/freezed_data_classes.dart';

// LoginViewModel class that implements both LoginViewModelInputs and LoginViewModelOutputs
class LoginViewModel extends BaseViewModel
    implements LoginViewModelInputs, LoginViewModelOutputs {

  // StreamControllers for username and password. These are broadcast streams allowing multiple listeners.
  StreamController<String> userNameStreamController =
  StreamController<String>.broadcast();
  StreamController<String> passwordStreamController =
  StreamController<String>.broadcast();

  StreamController isAllInputsValidStreamController =
  StreamController<void>.broadcast();

  // Initial login object with empty username and password  
  var loginObject = LoginObject('', ''); 
  
  LoginUseCase loginUseCase;
  LoginViewModel(this.loginUseCase);

  @override
  void dispose() {
    // Closing the stream controllers to free up resources when the ViewModel is disposed
    userNameStreamController.close();
    isAllInputsValidStreamController.close();
    passwordStreamController.close();
  }

  @override
  void start() {
    // Placeholder for any initialization logic when the ViewModel starts
  }

  @override
  Sink get inputPassword => passwordStreamController.sink; // Sink for password input stream

  @override
  Sink get inputUserName => userNameStreamController.sink;// Sink for username input stream

  @override
  Sink get inputIsAllInputValid => isAllInputsValidStreamController.sink;

  @override
  void login() async{
    // Placeholder for the login method which should handle login logic
    // Currently, it throws an UnimplementedError as it is not yet implemented
    (await loginUseCase.execute(LoginUseCaseInput(loginObject.userName, loginObject.password)))?.fold(
            (failure) => {
          // left -> failure
          print(failure.message)
        },
            (data) => {
          // right -> success (data)
          print(data.customer?.name)
        });
  }

  // Stream that outputs whether the password is valid by mapping each password input to a validation check
  @override
  Stream<bool> get outputIsPasswordValid => passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  // Stream that outputs whether the username is valid by mapping each username input to a validation check
  @override
  Stream<bool> get outputIsUserNameValid => userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  Stream<bool> get outputIsAllInputsValid =>
      isAllInputsValidStreamController.stream.map((_) => isAllInputsValid());

  // Private method to check if the password is valid (not empty in this case)
  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  // Private method to check if the username is valid (not empty in this case)
  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  _validate() {
    inputIsAllInputValid.add(null);
  }

  bool isAllInputsValid() {
    return _isPasswordValid(loginObject.password) &&
        _isUserNameValid(loginObject.userName);
  }

  @override
  void setPassword(String password) {
    // Adding the password to the password input stream
    inputPassword.add(password);
    // Updating the login object with the new password while keeping the object immutable
    loginObject = loginObject.copyWith(password: password);
    _validate();
  }

  @override
  void setUserName(String userName) {
    // Adding the username to the username input stream
    inputUserName.add(userName);
    // Updating the login object with the new username while keeping the object immutable
    loginObject = loginObject.copyWith(userName: userName);
    _validate();
  }
}

// Interface for the inputs of the LoginViewModel
abstract class LoginViewModelInputs {
  // Function declarations for setting username and password, and for login action
  void setUserName(String userName);
  void setPassword(String password);
  void login();

  // Sink getters for username and password input streams
  Sink get inputUserName;
  Sink get inputPassword;
  Sink get inputIsAllInputValid;
}

// Interface for the outputs of the LoginViewModel
abstract class LoginViewModelOutputs {
  // Stream getters for validating username and password
  Stream<bool> get outputIsUserNameValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputIsAllInputsValid;
}
