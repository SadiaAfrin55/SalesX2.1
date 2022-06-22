
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Constants/Strings/app_strings.dart';
import '../../../Widgets/AppBar/home_custom_appbar.dart';
import '../../../Widgets/Button/HomePage/big_button_icon.dart';

class FOMHomePage extends StatefulWidget {
  const FOMHomePage({Key? key}) : super(key: key);

  @override
  _FOMHomePageState createState() => _FOMHomePageState();
}

class _FOMHomePageState extends State<FOMHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(65),
            child: CustomAppBar()
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 21,),
                Center(child: SvgPicture.asset("assets/images/banner.svg", semanticsLabel: 'Acme Logo',width: MediaQuery.of(context).size.width*0.9,)),
                const SizedBox(height: 24,),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0,right: 16,bottom: 10),
                  child: Text("Your work list",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 17.0,
                        mainAxisSpacing: 16.0,
                        childAspectRatio:6/3
                    ),
                    children: [
                      BigButtonIcon(text: "Attendance",color: const Color(0xFFFEEBEF),image: "assets/icons/cardIcon/Attendance.svg",tap: (){
                        Navigator.pushNamed(context, ATTENDANCE);
                      },),
                      BigButtonIcon(text: "Target",color: const Color(0xFFE1F3FF),image: "assets/icons/cardIcon/Target.svg",tap: (){
                        Navigator.pushNamed(context, TARGET_PAGE);
                      },),
                      BigButtonIcon(text: "Leave",color: const Color(0xFFF1E1FF),image: "assets/icons/cardIcon/Leave.svg",tap: (){
                        Navigator.pushNamed(context, LEAVE_PAGE);
                      },),
                      BigButtonIcon(text: "Training",color: const Color(0xFFFFEFE0),image: "assets/icons/cardIcon/Tr Attendance.svg",tap: (){
                        Navigator.pushNamed(context, TRAINING_PAGE);
                      },),
                      BigButtonIcon(text: "FOE’s Activity",color: const Color(0xFFE0EDFF),image: "assets/icons/cardIcon/glass.svg",tap: (){
                        Navigator.pushNamed(context, FOM_FOE_ACTIVITY_PAGE);
                      },),

                    ],
                  ),
                )

              ],

            ),
          ),
        ),
      ),
    );
  }
}
