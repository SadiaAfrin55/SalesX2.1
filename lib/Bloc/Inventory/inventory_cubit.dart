import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../Repository/Inventory/inventory_repository.dart';



part 'inventory_state.dart';

class InventoryCubit extends Cubit<InventoryState> {
  InventoryRepository inventoryRepository = InventoryRepository();
  var logger = Logger();
  InventoryCubit() : super(InventoryInitial());


  void createInventory(String deviceModel,String quantity,String storeId,String token){
    logger.d("inventory ");
    inventoryRepository.createInventroy(deviceModel,quantity,storeId,token).then((inventory){
    logger.d(inventory);
        emit(InventoryCreate(response: inventory["status"]));
    });

  }

  void editInventory(String productId, String quantity, String storeId, String token) {
    inventoryRepository.editInventory(productId,quantity,storeId,token).then((inventory){
      logger.d(inventory);
      emit(InventoryCreate(response: inventory["status"]));
    });
  }

  void DeleteInventory(String productId, String storeId, String token) {
    inventoryRepository.DeleteInventory(productId,storeId,token).then((inventory){
      logger.d(inventory);
      emit(InventoryCreate(response: inventory["status"]));
    });
  }

}
