
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

class SalesNoDataPage extends StatefulWidget {
  @override
  _SalesNoDataPageState createState() => _SalesNoDataPageState();
}

class _SalesNoDataPageState extends State<SalesNoDataPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset("assets/icons/down.png"),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Center(child: Image.asset("assets/icons/noData.png",)),
                  ],
                ),

              ],
            )
        ),
      ),
    );
  }
}
