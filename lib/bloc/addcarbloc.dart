import 'dart:async';
import 'package:carrus_new/data/models/AddCarModel.dart';
import 'package:carrus_new/helper/sharedpreferences.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repository.dart';





class AddCarBloc extends Bloc<AddCarEvent, AddCarState> {
  AddCarBloc() : super(AddCarState()) {

    on<CheckADDCAR>(_checkAddCar);
  }



  Future<FutureOr<void>> _checkAddCar(
      CheckADDCAR event, Emitter<AddCarState> emit) async {
    emit(CheckingAddCar());
    AddCarModel addCarModel;
    Map body = {
      "carname": event.carname.toString(),
      "type": event.type.toString(),
      "price":event.price.toString(),
      "enginetype":event.enginetype.toString()
    };


    addCarModel =
    await Repository().addcar(url: '/car/addcar', data: body);
    if (addCarModel.status == true) {



      emit(AddCarChecked());
    } else {
      print(addCarModel.msg);
      emit(AddCarError(error: addCarModel.msg.toString()));
    }
  }
}
//events
class AddCarEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckADDCAR extends AddCarEvent {
  final String carname, type,price,enginetype;
  CheckADDCAR({required this.carname, required this.type,required this.price,required this.enginetype});
}


//states

class AddCarState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingAddCar extends AddCarState {}
class AddCarChecked extends AddCarState {

  AddCarChecked();
}

class AddCarError extends AddCarState {
  final String error;
  AddCarError({required this.error});
}