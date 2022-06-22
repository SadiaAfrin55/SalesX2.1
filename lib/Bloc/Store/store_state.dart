part of 'store_cubit.dart';

@immutable
abstract class StoreState {}

class StoreInitial extends StoreState {}
class CreateStore extends StoreState{
  final String? status;

  CreateStore({this.status});
}

class InActivestyoreLoaded extends StoreState{
  final StoreInactiveResponse? storeInactiveResponse;

  InActivestyoreLoaded({this.storeInactiveResponse});
}

class UpdateStore extends StoreState{
  final String? status;

  UpdateStore({this.status});
}
class GetAllStore extends StoreState{
  final StoreGetResponse? storeGetResponse;

  GetAllStore({this.storeGetResponse});
}

class CheckStoreLanLot extends StoreState{
  final bool? isStoreLanLot;

  CheckStoreLanLot({this.isStoreLanLot});
}

class UpdateStoreLanLot extends StoreState{
  final String? status;

  UpdateStoreLanLot({this.status});
}

class UpdateStoreLan extends StoreState{
  final String? status;

  UpdateStoreLan({this.status});
}