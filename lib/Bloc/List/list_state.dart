part of 'list_cubit.dart';

@immutable
abstract class ListState {}

class ListInitial extends ListState {}

class SecGet extends ListState{
  final SecResponse? secResponse;
  SecGet({this.secResponse});
}

class GetSecSurvey extends ListState{
  final SecSurveyResponse? secSurveyResponse;
  GetSecSurvey({this.secSurveyResponse});
}

class GetSecSale extends ListState{
  final SaleResponse? saleResponse;
  GetSecSale({this.saleResponse});
}


class SecTrainingAtd extends ListState{
  final secTrainingResponse? trainingResponse;
  SecTrainingAtd({this.trainingResponse});
}

class SecAtd extends ListState{
  final AtdInfoResponse? atdInfoResponse;
  SecAtd({this.atdInfoResponse});
}

