
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:progress_state_button/progress_button.dart';

import '../../../Bloc/Login/login_cubit.dart';
import '../../../Service/LoginService/save_user_data_local.dart';
import '../../Screens/SplashScreen/splash_screen.dart';
import '../../Widgets/Button/ProgressAnimtaionButton/progress_button.dart';
import '../../Widgets/TextFields/filledTextField.dart';
import '../../Widgets/TextFields/password_textdield.dart';
import '../../main_screen.dart';

class SurveyNoDataPage extends StatefulWidget {
  @override
  _SurveyNoDataPageState createState() => _SurveyNoDataPageState();
}

class _SurveyNoDataPageState extends State<SurveyNoDataPage> {

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: MediaQuery.of(context).size.width,
        //margin: EdgeInsets.symmetric(vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Center(child: SvgPicture.asset('assets/images/noData.svg')),
            Image.asset('assets/images/nodata.png'),
            Text('No data available',style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.8)
            ),),
          ],
        )
    );
  }
}
