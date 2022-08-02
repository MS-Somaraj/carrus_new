import 'dart:async';
import 'package:carrus_new/data/models/ShopDetailsModel.dart';
import 'package:carrus_new/helper/sharedpreferences.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repository.dart';





class ShopDetailsBloc extends Bloc<ShopDetailsEvent, ShopDetailsState> {
  ShopDetailsBloc() : super(ShopDetailsState()) {

    on<CheckDETAILS>(_checkDetails);
  }



  Future<FutureOr<void>> _checkDetails(
      CheckDETAILS event, Emitter<ShopDetailsState> emit) async {
    emit(CheckingDetails());
    ShopDetailsModel shopDetailsModel;



    shopDetailsModel =
    await Repository().details(url: '/shop/viewshop',);
    if (shopDetailsModel.status == true) {



      emit(DetailsChecked());
    } else {
      print(shopDetailsModel.msg);
      emit(DetailsError(error: shopDetailsModel.msg.toString()));
    }
  }
}
//events
class ShopDetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckDETAILS extends ShopDetailsEvent {

  CheckDETAILS();
}


//states

class ShopDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingDetails extends ShopDetailsState {}
class DetailsChecked extends ShopDetailsState {

  DetailsChecked();
}

class DetailsError extends ShopDetailsState {
  final String error;
  DetailsError({required this.error});
}