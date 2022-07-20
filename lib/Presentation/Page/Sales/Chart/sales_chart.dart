import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:salesx_new_project/Bloc/Sales/sales_cubit.dart';
import 'package:salesx_new_project/Service/LocalDataBase/localdata.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../Bloc/Leave/leave_cubit.dart';
import '../../../../Bloc/Survey/survey_cubit.dart';
import 'bar_chart_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesChart extends StatefulWidget {
  SalesChart({Key? key}) : super(key: key);

  @override
  State<SalesChart> createState() => _SalesChartState();
}

class _SalesChartState extends State<SalesChart> {
  List<String> issueTypeDrop = ['2022', '2023', '2024'];
  String? issueType;
  bool isClicked = true;
  bool isSelected = false;
  String? userId;
  String? year;
  var dateParse;
  List<ChartData>? chartData = [];
  late TooltipBehavior _tooltipBehavior;

  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      userId = tokenx.get('userId');
      BlocProvider.of<SalesCubit>(context)
          .getUserSalesSurveyPrediction(userId!, year!);

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
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();

    // chartData!.add(ChartData("feb",93.0,Colors.red));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SalesCubit, SalesState>(
      listener: (context, state) {
        // TODO: implement listener}
        if (state is GetSalesSurveyPradiction) {
          final data = (state as GetSalesSurveyPradiction).saleChartResponse;
          setState(() {
            data!.object!.forEach((element) {
              chartData!.add(ChartData(
                element.month.toString(),
                element.totalunit!.toDouble(),
                element.saleamount!.toDouble(),
              ));
            });
          });
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Sales Chart',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          leading: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close_outlined,
                color: Colors.black,
                size: 27,
              ),
            ),
          ),
          toolbarHeight: 60,
          elevation: 0.5,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   margin: const EdgeInsets.only(left: 24, right: 24, top: 12),
              //   child: const Text(
              //     'Select Year',
              //     style: TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.w300,
              //         color: Color(0xFF121826)),
              //   ),
              // ),
              // Container(
              //   margin: const EdgeInsets.only(
              //       left: 10, right: 10, top: 12, bottom: 10),
              //   height: 45,
              //   width: MediaQuery.of(context).size.width * 0.94,
              //   padding: const EdgeInsets.all(13),
              //   color: const Color(0xFFF5F7F8),
              //   child: DropdownButtonHideUnderline(
              //     child: DropdownButton(
              //       value: issueType,
              //       icon: const Icon(
              //         Icons.keyboard_arrow_down,
              //         color: Color(0xFF292D32),
              //       ),
              //       iconSize: 20,
              //       onChanged: (newValue) {
              //         setState(() {
              //           issueType = newValue.toString();
              //
              //           if (issueType != null) {
              //             setState(() {
              //               isSelected = true;
              //               BlocProvider.of<SalesCubit>(context)
              //                   .getUserSalesSurveyPrediction(userId!, year!);
              //               log("selected userid: "+userId!);
              //               log("selected date: "+year!);
              //             });
              //           } else {
              //             setState(() {
              //               isSelected = false;
              //             });
              //           }
              //         });
              //       },
              //       items: issueTypeDrop.map(
              //         (location) {
              //           return DropdownMenuItem(
              //             child: Text(location),
              //             value: location,
              //           );
              //         },
              //       ).toList(),
              //     ),
              //   ),
              // ),
              Container(
                margin: const EdgeInsets.only(left: 24, right: 24, top: 12),
                child: const Text(
                  'Sales by SaleAmount',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF121826)),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Container(
                  margin: const EdgeInsets.all(8),
                  child: BlocBuilder<SalesCubit, SalesState>(
                    builder: (context, state) {
                      if (state is! GetSalesSurveyPradiction) {
                        return Container(
                            height: 190,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.grey,
                                  child: Container(
                                    height: 100,
                                    width: 30,
                                    color: Colors.grey,
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.grey,
                                  child: Container(
                                    height: 200,
                                    width: 30,
                                    color: Colors.grey,
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.grey,
                                  child: Container(
                                    height: 80,
                                    width: 30,
                                    color: Colors.grey,
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.grey,
                                  child: Container(
                                    height: 300,
                                    width: 30,
                                    color: Colors.grey,
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.grey,
                                  child: Container(
                                    height: 250,
                                    width: 30,
                                    color: Colors.grey,
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.grey,
                                  child: Container(
                                    height: 50,
                                    width: 30,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ));
                      }
                      final data =
                          (state as GetSalesSurveyPradiction).saleChartResponse;
                      Logger().d(data);
                      return Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              Container(
                                  height: 250,
                                  width: MediaQuery.of(context).size.width,
                                  child: SfCartesianChart(
                                      primaryXAxis: CategoryAxis(),
                                      primaryYAxis: NumericAxis(),
                                      tooltipBehavior: _tooltipBehavior,
                                      palette: const <Color>[
                                        Colors.lightBlueAccent,
                                      ],
                                      series: <CartesianSeries>[
                                        ColumnSeries<ChartData, String>(
                                          dataSource: chartData!,
                                          xValueMapper: (ChartData data, _) =>
                                              data.x,
                                          yValueMapper: (ChartData data, _) =>
                                              data.y,
                                        ),
                                      ]))
                            ],
                          )),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
                child: const Text(
                  'Sales by TotalUnit',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF121826)),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Container(
                  margin: const EdgeInsets.all(8),
                  child: BlocBuilder<SalesCubit, SalesState>(
                    builder: (context, state) {
                      if (state is! GetSalesSurveyPradiction) {
                        return Container(
                            height: 190,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.grey,
                                  child: Container(
                                    height: 100,
                                    width: 30,
                                    color: Colors.grey,
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.grey,
                                  child: Container(
                                    height: 200,
                                    width: 30,
                                    color: Colors.grey,
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.grey,
                                  child: Container(
                                    height: 80,
                                    width: 30,
                                    color: Colors.grey,
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.grey,
                                  child: Container(
                                    height: 300,
                                    width: 30,
                                    color: Colors.grey,
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.grey,
                                  child: Container(
                                    height: 250,
                                    width: 30,
                                    color: Colors.grey,
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.grey,
                                  child: Container(
                                    height: 50,
                                    width: 30,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ));
                      }
                      final data =
                          (state as GetSalesSurveyPradiction).saleChartResponse;
                      Logger().d(data);
                      return Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              Container(
                                  height: 250,
                                  width: MediaQuery.of(context).size.width,
                                  child: SfCartesianChart(
                                      primaryXAxis: CategoryAxis(),
                                      primaryYAxis: NumericAxis(),
                                      tooltipBehavior: _tooltipBehavior,
                                      palette: <Color>[
                                        Colors.lightBlue.shade200,
                                      ],
                                      series: <CartesianSeries>[
                                        ColumnSeries<ChartData, String>(
                                          dataSource: chartData!,
                                          xValueMapper: (ChartData data, _) =>
                                              data.x,
                                          yValueMapper: (ChartData data, _) =>
                                              data.z,
                                        ),
                                      ]))
                            ],
                          )),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.z);

  final String x;
  final double y;
  final double z;
}
