import 'dart:async';
import 'package:carrus_new/data/models/LoginModel.dart';
import 'package:carrus_new/helper/sharedpreferences.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repository.dart';





class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {

    on<CheckOTP>(_checkOtp);
  }



  Future<FutureOr<void>> _checkOtp(
      CheckOTP event, Emitter<LoginState> emit) async {
    emit(CheckingOtp());
    LoginModel loginModel;
    Map body = {
      "email": event.phone.toString(),
      "password": event.otpNumber.toString(),
    };


    loginModel =
    await Repository().login(url: '/user/login', data: body);
    if (loginModel.status == true) {
      await TempStorage.addToken(loginModel.token.toString());
      await TempStorage.addRole(loginModel.role.toString());


      emit(OtpChecked(role: loginModel.data!.role!));
    } else {
      print(loginModel.msg);
      emit(OtpError(error: loginModel.msg.toString()));
    }
  }
}
//events
class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckOTP extends LoginEvent {
  final String otpNumber, phone;
  CheckOTP({required this.otpNumber, required this.phone});
}


//states

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingOtp extends LoginState {}
class OtpChecked extends LoginState {
  final String role;
  OtpChecked({required this.role});
}

class OtpError extends LoginState {
  final String error;
  OtpError({required this.error});
}