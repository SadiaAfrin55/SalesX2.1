
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:salesx_new_project/Service/LocalDataBase/localdata.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../Bloc/Leave/leave_cubit.dart';
import '../../../../Bloc/Survey/survey_cubit.dart';
import 'bar_chart_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class SurveyChart extends StatefulWidget {
  SurveyChart({Key? key}) : super(key: key);

  @override
  State<SurveyChart> createState() => _SurveyChartState();
}

class _SurveyChartState extends State<SurveyChart>{

  bool isClicked = true;
  String? userId;
  String? year;
  var dateParse;
  List<ChartData>? chartData=[];

  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      userId = tokenx.get('userId');
      BlocProvider.of<SurveyCubit>(context).getUserSurveyPrediction(userId!,year!);

      print(userId);
      print(year);

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    var date = new DateTime.now().toString();
    dateParse = DateTime.parse(date);
    year = dateParse.year.toString();
    getToken();



    super.initState();

    // chartData!.add(ChartData("feb",93.0,Colors.red));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SurveyCubit, SurveyState>(
      listener: (context, state) {
        // TODO: implement listener}
        if(state is GetSurveyPradiction){
          final data=(state as GetSurveyPradiction).surveyPredictionDataResponse;
          setState(() {
            data!.object!.forEach((element) {
              chartData!.add(ChartData(element.month.toString(),element.totalsurvey!.toDouble(),Colors.blueAccent));
            });
          });
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
          color: Colors.white,
          child: Container(
            margin: EdgeInsets.all(8),
            child: BlocBuilder<SurveyCubit, SurveyState>(
              builder: (context, state) {
                if(state is !GetSurveyPradiction){
                  return Container(
                      height: 190,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.grey,
                            child: Container(height: 100,width: 30,color: Colors.grey,),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.grey,
                            child: Container(height: 200,width: 30,color: Colors.grey,),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.grey,
                            child: Container(height: 80,width: 30,color: Colors.grey,),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.grey,
                            child: Container(height: 300,width: 30,color: Colors.grey,),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.grey,
                            child: Container(height: 250,width: 30,color: Colors.grey,),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.grey,
                            child: Container(height: 50,width: 30,color: Colors.grey,),
                          ),
                        ],
                      )
                  );
                }
                final data=(state as GetSurveyPradiction).surveyPredictionDataResponse;
                 Logger().d(data);
                return Row(
                  children: [
                    Expanded(
                        child:Column(
                          children: [

                            Container(
                                height: 190,
                                child: SfCartesianChart(
                                    primaryXAxis: CategoryAxis(),
                                    series: <CartesianSeries>[
                                      ColumnSeries<ChartData, String>(
                                          dataSource: chartData!,
                                          xValueMapper: (ChartData data, _) => data.x,
                                          yValueMapper: (ChartData data, _) => data.y,
                                          // Map color for each data points from the data source
                                          pointColorMapper: (ChartData data, _) => data.color
                                      )
                                    ]
                                )
                            )
                          ],
                        )
                    ),

                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
