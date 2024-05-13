// This class defines an abstract RemoteDataSource interface, which declares methods for interacting with remote data sources.
import '../network/app_api.dart';
import '../request/request.dart';
import '../responses/responses.dart';

abstract class RemoteDataSource {
  // This method declares a contract for performing a login operation asynchronously.
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

// This class implements the RemoteDataSource interface and provides concrete implementations for its methods.
class RemoteDataSourceImplementer implements RemoteDataSource {
  // Private field to hold an instance of the AppServiceClient, which is used for making network requests.
  AppServiceClient _appServiceClient;

  // Constructor for initializing the RemoteDataSourceImplementer with an instance of AppServiceClient.
  RemoteDataSourceImplementer(this._appServiceClient);

  // Implementation of the login method declared in the RemoteDataSource interface.
  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    // Call the login method on the AppServiceClient instance, passing loginRequest parameters, and await the result.
    return await _appServiceClient.login(
      loginRequest.username,
      loginRequest.password,
      loginRequest.iemi,
      loginRequest.deviceType,
    );
  }
}
