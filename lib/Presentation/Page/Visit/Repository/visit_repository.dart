import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:salesx_new_project/Presentation/Page/Visit/Data/storeResponse.dart';

import '../../../../Data/Model/Store/Store.dart';
import '../Data/visitResponse.dart';
import '../Network/visit_network.dart';


class VisitRepository {
  var logger = Logger();

  Future<storeResponse> loadShop() async{
    final rawx=await ShopNetwork().getShop();
    logger.d(rawx);
    return storeResponse.fromJson(rawx);
  }

  Future giveVisit(File iamge, String storeId,String useId) async{
    final rawx=await ShopNetwork().CreateShop(iamge,storeId,useId,);
     logger.d('5555 $rawx');
    return rawx;
  }

  Future<visitResponse> visitShophistory(String visitDate,String userId) async{
    print(userId);
    print(visitDate);
    final rawx=await ShopNetwork().visitShophistory(visitDate,userId);
    logger.d(rawx);
    return visitResponse.fromJson(rawx);
  }

}