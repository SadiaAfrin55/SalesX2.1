
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../Widgets/Card/Attendence/attendencelist_card.dart';

class FomAttendenceSurvey extends StatefulWidget {
  const FomAttendenceSurvey({Key? key}) : super(key: key);

  @override
  _FomAttendenceSurveyState createState() => _FomAttendenceSurveyState();
}

class _FomAttendenceSurveyState extends State<FomAttendenceSurvey> {
  bool isVisible = true;
  double _height = 61;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Attendance',
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
                  Icons.arrow_back, color: Colors.black, size: 27,),
              ),
            ),
            toolbarHeight: 60,
            elevation: 0.5,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      height: _height,
                      color: const Color(0xFFE6F2FE),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      flex:1,
                                      child: SvgPicture.asset('assets/icons/filter_icon.svg')),
                                  Expanded(
                                      flex: 8,
                                      child: Text('Filter',style: TextStyle(fontSize:16,fontWeight:FontWeight.w600,color: Color(0xFF0180F5),))),
                                ],
                              ),
                            ),

                            InkWell(
                              onTap: (){
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  isVisible?
                                  SvgPicture.asset('assets/icons/filter-side.svg'):
                                  SvgPicture.asset('assets/icons/filter-back.svg'),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          _height = 264;
                        });
                      },
                      child: Visibility(
                        visible: !isVisible,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut,
                            color: Colors.green,
                            height: _height,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [

                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 20,
                    itemBuilder: (context,index){
                      return AttendencelistCard();
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
