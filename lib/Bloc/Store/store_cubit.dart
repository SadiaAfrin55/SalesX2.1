import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../Data/Model/Store/StoreGetResponse.dart';
import '../../Data/Model/Store/StoreInactiveResponse.dart';
import '../../Repository/Store/store_repository.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  var logger = Logger();
  StoreCubit() : super(StoreInitial());
  void createStore(String storename, String storDms, String stortype,
      String storLocation, String teritory, String district,
      String area, String division, String lat, String lon, String cutoffTime, String _seletedHoliday) {

    StoreRepository().createStore(storename,storDms,stortype,storLocation,teritory,district,area,division,lat,lon,cutoffTime,_seletedHoliday).then((response) => {
      if(response!=null){
        logger.d(response),
        emit(CreateStore(status: response['status']))
      }
    });

  }

  void loadInActiveStore() {
    StoreRepository().loadInActiveStore().then((value) => {
      if(value!=null){
        logger.d(value),
        emit(InActivestyoreLoaded(storeInactiveResponse: value))
      }
    });
  }

  void updateOutlate(String storename, String storDms, String stortype,
      String storLocation, String teritory, String district,
      String area, String division, String lat, String lon, String cutoffTime, String _seletedHoliday,String id) {
    StoreRepository().updateOutlate(storename,storDms,stortype,storLocation,
        teritory,district,area,division,lat,lon,cutoffTime,_seletedHoliday,id).then((value) => {
      if(value!=null){
        emit(UpdateStore(status: value['status']))
      }
    });
  }

  void getAllStore() {
    StoreRepository().getAllStore().then((value) => {
      if(value!=null){
        logger.d(value),
        emit(GetAllStore(storeGetResponse:  value))
      }
    });
  }

  void checkStoreLanLot(String storeId) {
    StoreRepository().checkStoreLanLot(storeId).then((value) => {
      if(value['status']=="success"){
        // logger.d(value),
        emit(CheckStoreLanLot(isStoreLanLot: value['lat']))
      }
    });
  }

  void updateStoreLanLot(String storeId, String lat, String lon) {
    StoreRepository().updateStoreLanLot(storeId,lat,lon).then((value) => {
      if(value['status']=="success"){
        logger.d(value),
        emit(UpdateStoreLan(status:value['status']))
      }
    });
  }

}
