import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Bloc/Survey/survey_cubit.dart';
import '../../../../Constants/Strings/app_strings.dart';
import '../../../Widgets/Card/Survey/phone_card.dart';
import '../survey_noData.dart';

class SurveyListComponents extends StatefulWidget {
  final String? date;
  const SurveyListComponents({this.date,Key? key}) : super(key: key);

  @override
  _SurveyListComponentsState createState() => _SurveyListComponentsState();
}

class _SurveyListComponentsState extends State<SurveyListComponents> {

  @override
  Widget build(BuildContext context) {
    return BlocListener<SurveyCubit, SurveyState>(
      listener: (context, state) {
        if(state is SurveyLodedByMonth){
          setState(() {

          });
        }
      },
      child: BlocBuilder<SurveyCubit, SurveyState>(
        builder: (context, state) {
          if (state is! SurveyLodedByMonth) {
            return Center(child: CircularProgressIndicator(),);
          }
          final data = (state as SurveyLodedByMonth).surveyResponse;
          return Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12,),
                  data!.surveys!.isEmpty ?
                  Container(
                    height: MediaQuery.of(context).size.height*0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/nodata.png'),
                        Text('No data available',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.8)
                        ),),
                      ],
                    ),
                  ) :
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 19.0,
                        mainAxisSpacing: 17.0,
                        childAspectRatio: 4 / 3
                    ),
                    itemCount: data.surveys!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, SURVEY_DETAILS,
                              arguments: {
                                'name': data.surveys![index].customername,
                                'mobile': data.surveys![index]
                                    .customercontactno,
                                'age': data.surveys![index].customerage,
                                'email': data.surveys![index].customeremail,
                                'interestIn': data.surveys![index].interestedin,
                                'minbudget': data.surveys![index].pricerange,
                                'maxbudget': data.surveys![index]
                                    .customerbudget,
                                'currentContact': data.surveys![index]
                                    .customercurrentphone,
                              });
                        },
                        child: Phone(
                          name: data.surveys![index].customername,
                          phoneNumber: data.surveys![index].customercontactno,
                        ),
                      );
                    },
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }

}
