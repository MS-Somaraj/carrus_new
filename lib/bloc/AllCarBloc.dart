import 'dart:async';

import 'package:carrus_new/data/models/CarDetailsModel.dart';
import 'package:carrus_new/helper/sharedpreferences.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repository.dart';





class AllCarBloc extends Bloc<AllCarEvent, AllCarState> {
  AllCarBloc() : super(AllCarState()) {

    on<CheckALLCAR>(_checkAllCar);
  }



  Future<FutureOr<void>> _checkAllCar(
      CheckALLCAR event, Emitter<AllCarState> emit) async {
    emit(CheckingAllCar());
    CarDetailsModel allCarModel;



    allCarModel =
    await Repository().cardetails(url: '/admin/viewallcars');
    if (allCarModel.status == true) {

//TempStorage.addRole(allCarModel.data[1].)

      emit(AllCarChecked(allCarModel: allCarModel));
    } else {
      print(allCarModel.msg);
      emit(AllCarError(error: allCarModel.msg.toString()));
    }
  }
}
//events
class AllCarEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckALLCAR extends AllCarEvent {

  CheckALLCAR();
}


//states

class AllCarState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingAllCar extends AllCarState {}
class AllCarChecked extends AllCarState {
  final CarDetailsModel allCarModel;
  AllCarChecked({required this.allCarModel});
}

class AllCarError extends AllCarState {
  final String error;
  AllCarError({required this.error});
}