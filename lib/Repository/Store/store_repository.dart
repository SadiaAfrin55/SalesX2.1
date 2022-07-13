import 'package:logger/logger.dart';
import '../../Data/Model/Holiday/HolidayResponse.dart';
import '../../Data/Model/Store/StoreGetResponse.dart';
import '../../Data/Model/Store/StoreInactiveResponse.dart';
import '../../Network/Store/store_network.dart';

class StoreRepository {
  var logger = Logger();

  Future<HolidayResponse?> checkStoreHoliday(String userId) async{
    final raw = await StoreNetwork().checkStoreHoliday(userId);
    if (raw == null) return null;
    // logger.d(raw);
    return HolidayResponse.fromJson(raw);
  }

  Future createStore(String storename, String storDms, String stortype, String storLocation, String teritory,
      String district, String area, String division, String lat, String lon, String cutoffTime, String seletedHoliday) async {

    Map<String, dynamic> data = {
      "storename": storename,
      "storedmscode": storDms,
      "storetype": stortype,
      "holiday": seletedHoliday,
      "location": storLocation,
      "teritory": teritory,
      "area": area,
      "district": district,
      "division":division,
      "lat":lat,
      "lon":lon,
      "cutofftime": cutoffTime
    };

    final rawx=await StoreNetwork().createStore(data);
    logger.d(rawx);
    return rawx;

  }

  Future<StoreInactiveResponse> loadInActiveStore() async{
    final rawx=await StoreNetwork().loadInActiveStore();
    logger.d(rawx);
    return StoreInactiveResponse.fromJson(rawx);
  }

  Future updateOutlate(String storename, String storDms, String stortype, String storLocation, String teritory,
      String district, String area, String division, String lat, String lon, String cutoffTime, String seletedHoliday, String id)async {
    Map<String, dynamic> data = {
      "storename": storename,
      "storedmscode": storDms,
      "storetype": stortype,
      "holiday": seletedHoliday,
      "location": storLocation,
      "teritory": teritory,
      "area": area,
      "district": district,
      "division":division,
      "lat":lat,
      "lon":lon,
      "cutofftime": cutoffTime
    };
    final rawx=await StoreNetwork().updateOutlate(data,id);
    logger.d(rawx);
    return rawx;
  }

  Future<StoreGetResponse> getAllStore() async{
    final rawx=await StoreNetwork().getAllStore();
    //logger.d(rawx);
    return StoreGetResponse.fromJson(rawx);
  }

  Future checkStoreLanLot(String storeId)async {
    final rawx=await StoreNetwork().checkStoreLanLot(storeId);
    logger.d(rawx);
    return rawx;

  }

  Future updateStoreLanLot(String storeId, String lat, String lon) async{
    Map<String, dynamic> data = {
      "lat":lat,
      "lon":lon,
    };
    final rawx=await StoreNetwork().updateStoreLanLot(storeId,data);
    logger.d(rawx);
    return rawx;
  }
}