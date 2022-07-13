
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Constants/Strings/app_strings.dart';
import '../../../Widgets/AppBar/home_custom_appbar.dart';
import '../../../Widgets/Button/HomePage/big_button_icon.dart';

class SMHomePage extends StatefulWidget {
  const SMHomePage({Key? key}) : super(key: key);

  @override
  _SMHomePageState createState() => _SMHomePageState();
}

class _SMHomePageState extends State<SMHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          return Future<void>.delayed(const Duration(seconds: 1));
        },
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
                        BigButtonIcon(text: "Visit",color: const Color(0xFFE2FDED),image: "assets/icons/cardIcon/visit.svg",tap: (){
                          Navigator.pushNamed(context, VISIT_SHOP_PAGE);
                        },),
                        BigButtonIcon(text: "OM’s Activity",color: const Color(0xFFE0EDFF),image: "assets/icons/cardIcon/glass.svg",tap: (){
                          Navigator.pushNamed(context, SM_ACTIVITY);
                        },),

                      ],
                    ),
                  )

                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}
