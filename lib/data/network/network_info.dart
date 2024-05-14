import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo{
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo{

  final Connectivity _connectivity;

 NetworkInfoImpl(this._connectivity);

  @override

  Future<bool> get isConnected async{
    final List<ConnectivityResult> connectivityResult = await (_connectivity.checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
      // Wi-fi is available.
      // Note for Android:
      // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
    }else{
      return false;
    }
  }

}