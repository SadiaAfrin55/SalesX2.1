import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../../../../Bloc/Survey/survey_cubit.dart';

class SurveyTest extends StatefulWidget {
  const SurveyTest({Key? key}) : super(key: key);

  @override
  _SurveyTestState createState() => _SurveyTestState();
}

class _SurveyTestState extends State<SurveyTest> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyCubit, SurveyState>(
      builder: (context, state) {
        if(state is !GetSurveyPradiction){
          Center(child: CircularProgressIndicator(),);
        }
        final data = (state as GetSurveyPradiction).surveyPredictionDataResponse;

        return Scaffold(
          appBar: AppBar(),
          body: Container(
            child: Column(
              children: [
                // Container(
                //   padding: const EdgeInsets.symmetric(horizontal: 10),
                //   height: 304,
                //   child: charts.BarChart(
                //     // id: "User",
                //     // data: data.surveyData.length,
                //     // domainFn:(chartModel series,_)=>series.week,
                //     // measureFn: (chartModel series,_)=>series.user,
                //     // colorFn: (chartModel series,_)=>series.color,
                //     // animate: true,
                //     // defaultRenderer: new charts.BarRendererConfig(
                //     //     cornerStrategy: const charts.ConstCornerStrategy(30)),
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
