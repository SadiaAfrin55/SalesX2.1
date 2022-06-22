part of 'sales_cubit.dart';

@immutable
abstract class SalesState {}

class SalesInitial extends SalesState {}
class SalesCreateing extends SalesState{}

class SalesCreated extends SalesState{
}

class SalesGet extends SalesState{
  final SaleResponse? saleResponse;
  SalesGet({this.saleResponse});
}

class SalesGetByMonth extends SalesState{
  final SaleResponse? saleResponsex;

  SalesGetByMonth({this.saleResponsex});
}

class SalesServyGet extends SalesState{
  final SaleResponse? saleServyResponse;
  SalesServyGet({this.saleServyResponse});
}

class SalesServyGetByMonth extends SalesState{
  final SaleResponse? saleServyResponsex;

  SalesServyGetByMonth({this.saleServyResponsex});
}

class GetSalesSurveyPradiction extends SalesState {
  final SurveyPredictionDataResponse? surveyPredictionDataResponse;

  GetSalesSurveyPradiction({this.surveyPredictionDataResponse});
}

class GetFoewUserSalesSurveyPradiction extends SalesState {
  final SurveyPredictionDataResponse? surveyPredictionDataResponse;

  GetFoewUserSalesSurveyPradiction({this.surveyPredictionDataResponse});
}