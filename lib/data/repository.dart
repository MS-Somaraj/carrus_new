import 'package:carrus_new/data/models/AddCarModel.dart';
import 'package:carrus_new/data/models/EditShopModel.dart';
import 'package:carrus_new/data/models/LoginModel.dart';
import 'package:carrus_new/data/models/LogoutModel.dart';
import 'package:carrus_new/data/models/ShopDetailsModel.dart';
import 'package:carrus_new/data/models/SignInModel.dart';
import 'package:carrus_new/data/webclient.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Repository {
  ///login/////////////////////////////////////
  Future<LoginModel> login({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url, data);
    final LoginModel loginModel = LoginModel.fromJson(response);
    return loginModel;
  }
  ///logout///////////////////////////////////////////////
  Future<LogoutModel> logout({required String url}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    final LogoutModel logoutModel = LogoutModel.fromJson(response);
    return logoutModel;
  }

  ///sign_in//////////////////////////////////
  Future<SignInModel> sign_in({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url, data);
    final SignInModel signInModel = SignInModel.fromJson(response);
    return signInModel;
  }

  ///editshop
  Future<EditShopModel> editshop({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url, data);
    final EditShopModel editShopModel = EditShopModel.fromJson(response);
    return editShopModel;
  }
  ///shopdetails///
  Future<ShopDetailsModel> details({required String url}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    final ShopDetailsModel shopDetailsModel = ShopDetailsModel.fromJson(response);
    return shopDetailsModel;
  }
  Future<AddCarModel> addcar({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url, data);
    final AddCarModel addCarModel = AddCarModel.fromJson(response);
    return addCarModel;
  }

}
