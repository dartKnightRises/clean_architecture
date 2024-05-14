import 'package:clean_architecture/app/constants.dart';
import 'package:clean_architecture/data/data_source/remote_data_source.dart';
import 'package:clean_architecture/data/mapper/mapper.dart';
import 'package:clean_architecture/data/network/failure.dart';
import 'package:clean_architecture/data/network/network_info.dart';
import 'package:clean_architecture/data/request/request.dart';
import 'package:clean_architecture/domain/model.dart';
import 'package:clean_architecture/domain/repository.dart';
import 'package:dartz/dartz.dart';

// Implementation of the Repository interface
class RepositoryImpl implements Repository {
  // Remote data source for fetching data from an API or remote server
  RemoteDataSource remoteDataSource;
  // NetworkInfo to check for internet connectivity status
  NetworkInfo networkInfo;

  // Constructor to initialize the repository with the remote data source and network info
  RepositoryImpl(this.remoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async {
    // Check if the device is connected to the internet
    if (await networkInfo.isConnected) {
      // Safe to call the API since the device is connected to the internet
      final response = await remoteDataSource.login(loginRequest);

      // Check if the API response status indicates success
      if (response.status == Constants.zero) {
        // Convert the response to a domain model and return it wrapped in a Right (success) object
        return Right(response.toDomain());
      } else {
        // Return a business logic error wrapped in a Left (failure) object
        return left(Failure(Constants.loginErrorCode, response.message ?? Constants.loginError));
      }
    } else {
      // Device is not connected to the internet, return a network error wrapped in a Left (failure) object
      return left(Failure(Constants.networkErrorCode, Constants.networkError));
    }
  }
}
