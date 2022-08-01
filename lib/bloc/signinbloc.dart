import 'dart:async';
import 'package:carrus_new/data/models/SignInModel.dart';
import 'package:carrus_new/helper/sharedpreferences.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repository.dart';





class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {

    on<CheckSIGN>(_checkSign);
  }



  Future<FutureOr<void>> _checkSign(
      CheckSIGN event, Emitter<SignInState> emit) async {
    emit(CheckingSign());
    SignInModel signInModel;
    Map body = {
      "name":event.name.toString(),
      "email": event.email.toString(),
      "phoneNumber": event.phoneNumber.toString(),
      "password": event.password.toString(),
      "place": event.place.toString(),
      "gender": event.gender.toString(),
      "date_of_birth": event.date_of_birth.toString(),

    };


    signInModel =
    await Repository().sign_in(url: '/customer/signin', data: body);
    if (signInModel.status == true) {
      


      emit(SignChecked());
    } else {
      print(signInModel.msg);
      emit(SignError(error: signInModel.msg.toString()));
    }
  }
}
//events
class SignInEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckSIGN extends SignInEvent {
  final String password, email,name,phoneNumber,place,gender,date_of_birth;
  CheckSIGN({required this.password, required this.email,
    required this.name,required this.phoneNumber,required this.place,required this.gender,required this.date_of_birth,});
}


//states

class SignInState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingSign extends SignInState {}
class SignChecked extends SignInState {

  SignChecked();
}

class SignError extends SignInState {
  final String error;
  SignError({required this.error});
}