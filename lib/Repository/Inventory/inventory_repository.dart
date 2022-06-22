
import 'package:logger/logger.dart';

import '../../Network/Inventory/inventory_network.dart';

class InventoryRepository {
  InventoryNetwork inventoryNetwork = InventoryNetwork();
  var logger = Logger();

  Future  createInventroy(String deviceModel, String quantity,String storeId, String token) async{
    Map<String, String> data = {
      "product": deviceModel,
      "quantity": quantity,
    };

    final inventoryRaw=await inventoryNetwork.createInventory(data,storeId,token);
    if(inventoryRaw==null){
      return null;
    }
    logger.d(inventoryRaw);
    return inventoryRaw;

  }


  Future  editInventory(String deviceModel, String quantity,String storeId, String token) async{
    logger.d(quantity);
    Map<String, String> data = {
      "productquantity": quantity,
    };

    final inventoryRaw=await inventoryNetwork.editInventory(data,deviceModel,storeId,token);
    if(inventoryRaw==null){
      return null;
    }
    logger.d(inventoryRaw);
    return inventoryRaw;

  }

  Future DeleteInventory(String productId, String storeId, String token) async{
    final inventoryRaw=await inventoryNetwork.DeleteInventory(storeId,productId,token);
    if(inventoryRaw==null){
      return null;
    }
    logger.d(inventoryRaw);
    return inventoryRaw;
  }
}