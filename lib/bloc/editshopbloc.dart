import 'dart:async';
import 'package:carrus_new/data/models/EditShopModel.dart';
import 'package:carrus_new/helper/sharedpreferences.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repository.dart';

class EditShopBloc extends Bloc<EditShopEvent, EditShopState> {
  EditShopBloc() : super(EditShopState()) {
    on<CheckEDITSHOP>(_checkEditShop);
  }

  Future<FutureOr<void>> _checkEditShop(
      CheckEDITSHOP event, Emitter<EditShopState> emit) async {
    emit(CheckingEditShop());
    EditShopModel editShopModel;
    Map body = {
      "id": event.id.toString(),
      "shopname": event.shopname.toString(),
      "phone": event.phone.toString(),
      "email": event.email.toString(),
      "place": event.place.toString(),
      "ownername": event.ownername.toString(),
      "lat": event.lat.toString(),
      "lon": event.lon.toString(),


    };

    editShopModel = await Repository().editshop(url: '/shop/edit', data: body);
    if (editShopModel.status == true) {
      emit(EditShopChecked());
    } else {
      print(editShopModel.msg);
      emit(EditShopError(error: editShopModel.msg.toString()));
    }
  }
}

//events
class EditShopEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckEDITSHOP extends EditShopEvent {
  final String id, phone, shopname, email, place, ownername, lat, lon;
  CheckEDITSHOP({
    required this.id,
    required this.phone,
    required this.shopname,
    required this.email,
    required this.place,
    required this.ownername,
    required this.lat,
    required this.lon,
  });
}

//states

class EditShopState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingEditShop extends EditShopState {}

class EditShopChecked extends EditShopState {
  EditShopChecked();
}

class EditShopError extends EditShopState {
  final String error;
  EditShopError({required this.error});
}
