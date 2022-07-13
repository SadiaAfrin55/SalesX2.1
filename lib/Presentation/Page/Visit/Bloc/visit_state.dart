part of 'visit_cubit.dart';

@immutable
abstract class VisitState {}

class VisitInitial extends VisitState {}

class GetShopdata extends VisitState{
  final storeResponse? stores;

  GetShopdata({required this.stores});
}

class GetVisitData extends VisitState{
  final visitResponse? visit;

  GetVisitData({required this.visit});
}


class MarkVisit extends VisitState{
  final String? attendance;
  MarkVisit({this.attendance});
}
