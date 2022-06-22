part of 'inventory_cubit.dart';

@immutable
abstract class InventoryState {}

class InventoryInitial extends InventoryState {}

class InventoryLoded extends InventoryState {

}

class InventoryCreate extends InventoryState {
  final String? response;

  InventoryCreate({this.response,});




}