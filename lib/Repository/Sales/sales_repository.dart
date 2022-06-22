import 'package:logger/logger.dart';
import '../../Data/Model/Sale/SaleResponse.dart';
import '../../Data/Model/Survey/SurveyPredictionDataResponse.dart';
import '../../Network/Sales/sales_network.dart';


class SaleRepository {
  SaleNetwork saleNetwork=SaleNetwork();
  var logger = Logger();

  Future createSale(String storename, String username, String date,
      String dateIn, String customername, String customermobile,
      String customeremail, int quatity, String color, String age, String price,
      String productName,
      String remark, String userId, String managerId, String storeId) async {
    logger.d("product " + dateIn);
    logger.d(color);
    Map<String, dynamic> data = {
      "storename": storename,
      "username": username,
      "date": date,
      "dataIn": dateIn,
      "customername": customername,
      "customermobile": customermobile,
      "customeremail": customeremail,
      "quatity": quatity,
      "color": color,
      "price": price,
      "age": age,
      "productName": productName,
      "remark": remark
    };

    final rawx = await saleNetwork.createSale(
        data, productName, userId, managerId, storeId);
    logger.d(rawx);
    return rawx;
  }


  Future loadSalesSurvy(String userId) async{
    final raw= await SaleNetwork().loadSalesSurvy(userId);

    return SaleResponse.fromJson(raw);
  }

  Future getAllSales(String userId) async{
    final raw= await SaleNetwork().getAllSales(userId);

    return SaleResponse.fromJson(raw);
  }

  Future getUserSaleByMonth(String userId,String leaveDate) async {
    final raw= await SaleNetwork().getUserSaleByMonth(userId,leaveDate);

    return  SaleResponse.fromJson(raw);
  }
  Future getUserSaleSurvyByMonth(String userId, String leaveDate) async{
    final raw= await SaleNetwork().getUserSaleSurvyByMonth(userId,leaveDate);

    return  SaleResponse.fromJson(raw);
  }

  Future<SurveyPredictionDataResponse> getUserSalesSurveyPrediction(String userId) async{
    final rawx=await SaleNetwork().getUserSalesSurveyPrediction(userId);
    // logger.d(rawx);
    return SurveyPredictionDataResponse.fromJson(rawx);
  }

  Future<SurveyPredictionDataResponse> getFoeUserSalesSurveyPrediction(String userId) async{
    final rawx=await SaleNetwork().getFoeUserSalesSurveyPrediction(userId);
    // logger.d(rawx);
    return SurveyPredictionDataResponse.fromJson(rawx);
  }

  Future<SurveyPredictionDataResponse> productSalesPrediction(String productId)async {
    final rawx=await SaleNetwork().productSalesPrediction(productId);
    logger.d(rawx);
    return SurveyPredictionDataResponse.fromJson(rawx);
  }



  Future<SurveyPredictionDataResponse> getReUserSalesSurveyPrediction(String userId) async{
    final rawx=await SaleNetwork().getReUserSalesSurveyPrediction(userId);
    // logger.d(rawx);
    return SurveyPredictionDataResponse.fromJson(rawx);
  }


}