import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:salesx_new_project/Presentation/Page/Visit/Data/storeResponse.dart';
import 'package:salesx_new_project/Presentation/Page/Visit/Data/visitResponse.dart';

import '../../../../Data/Model/Store/Store.dart';
import '../Repository/visit_repository.dart';

part 'visit_state.dart';

class VisitCubit extends Cubit<VisitState> {
  var logger = Logger();
  VisitCubit() : super(VisitInitial());

  void loadStoreInfo() {
    VisitRepository().loadShop().then((value) => {
      logger.d(value),
      if(value!=null){
        emit(GetShopdata(stores: value))
      }
    });
  }

  void loadVisitInfo(String visitDate,String userId) {
    VisitRepository().visitShophistory(visitDate,userId).then((value) => {
      logger.d(value),
      if(value!=null){
        emit(GetVisitData(visit: value))
      }
    });
  }



  void giveVisitShop(File iamge, String storeId,String useId) {
    VisitRepository().giveVisit(iamge,storeId,useId).then((data) => {
      logger.d(data['success']),
      if(data!=null){
        emit(MarkVisit(attendance: data['status']))
      }
    });
  }


}
