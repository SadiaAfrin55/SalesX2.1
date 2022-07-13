import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import '../../Data/Model/Sale/SaleChartResponse.dart';
import '../../Data/Model/Sale/SaleResponse.dart';
import '../../Data/Model/Survey/SurveyPredictionDataResponse.dart';
import '../../Repository/Sales/sales_repository.dart';

part 'sales_state.dart';

class SalesCubit extends Cubit<SalesState> {
  SaleRepository saleRepository=SaleRepository();
  var logger = Logger();
  SalesCubit() : super(SalesInitial());

  void createSale(String storename, String username,String price,String productName, String date,String dateIn, String customername, String customermobile,
      String customeremail, int quatity, String color, String age,String remark, String userId, String managerId,String storeId) {

    SaleRepository().createSale(storename,username,date,dateIn,customername,customermobile,customeremail,quatity,color,age,price,productName,remark,userId,managerId,storeId).then((sale) {
      Logger().d(sale);
      if(sale!=null){
        Logger().d(sale);
        emit(SalesCreated());
      }
    });
  }

  void loadSales(String userId) {
    SaleRepository().getAllSales(userId).then((response) => {
      if(response!=null){
        emit(SalesGet(saleResponse: response)),
        logger.d(response)
      }
    });
  }

  void getUserSaleByMonth(String userId, String leaveDate) {
    SaleRepository().getUserSaleByMonth(userId,leaveDate).then((responsex) => {
      logger.d("working"),
      logger.d(leaveDate),
      if(responsex!=null){
        emit(SalesGetByMonth(saleResponsex: responsex)),
        // logger.d(responsex.length)
      }
    });
  }



  void loadSalesSurvy(String userId) {
    SaleRepository().loadSalesSurvy(userId).then((response) => {
      if(response!=null){
        emit(SalesGet(saleResponse: response)),
        logger.d(response)
      }
    });
  }

  void getUserSaleSurvyByMonth(String userId, String leaveDate) {
    SaleRepository().getUserSaleSurvyByMonth(userId,leaveDate).then((responsex) => {
      logger.d("working"),
      logger.d(leaveDate),
      if(responsex!=null){
        emit(SalesGetByMonth(saleResponsex: responsex)),
        logger.d(responsex.length)
      }
    });
  }

  void getUserSalesSurveyPrediction(String userId,String year) {
    SaleRepository().getUserSalesSurveyPrediction(userId,year).then((response){
      logger.d(response);
      if(response!=null){
        emit(GetSalesSurveyPradiction(saleChartResponse:response));
      }
    });
  }

  void getFoeUserSalesSurveyPrediction(String userId) {
    SaleRepository().getFoeUserSalesSurveyPrediction(userId).then((response){
      // logger.d(response);
      if(response!=null){
        emit(GetFoewUserSalesSurveyPradiction(surveyPredictionDataResponse:response));
      }
    });
  }

  void productSalesPrediction(String productId) {
    SaleRepository().productSalesPrediction(productId).then((response){
      logger.d(response);
      if(response!=null){
        emit(GetFoewUserSalesSurveyPradiction(surveyPredictionDataResponse:response));
      }
    });
  }

  void getReUserSalesSurveyPrediction(String userId) {
    SaleRepository().getReUserSalesSurveyPrediction(userId).then((response){
      // logger.d(response);
      if(response!=null){
        emit(GetFoewUserSalesSurveyPradiction(surveyPredictionDataResponse:response));
      }
    });
  }

}
