
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Constants/Colors/app_colors.dart';
import '../../Screens/SplashScreen/splash_screen.dart';
import '../../Widgets/Button/CustomButoon/custom_button.dart';
import '../../main_screen.dart';
class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  int? selected;
  int? radioValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selected = 0;
  }

  setSelectedRadio(int val){
    setState(() {
      selected = val;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Feedback',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back,color: Colors.black,size: 27,),
              ),
            ),
            toolbarHeight: 60,
            elevation: 0.5,
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(

              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Question : 1/1',style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color:Color(0xFF2D2D2D)
                      ),),
                      const SizedBox(height: 24,),
                      const Text('Dose thew retailer compel you to do his\npersonal task?',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color:Color(0xFF232C2E)
                      ),),
                      const SizedBox(height: 16,),
                      InkWell(
                        onTap: (){
                          setState(() {
                            setSelectedRadio(1);
                          });
                        },
                        child: Container(
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFF7F8F8),
                          ),
                          child: Row(
                            children: [
                              Radio(
                                  value: 1,
                                  groupValue: selected,
                                  onChanged: (val){
                                    setState(() {
                                      setSelectedRadio(val as int);
                                    });
                                  }
                              ),
                              const Text('Yes',style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color:Color(0xFF232C2E)
                              ),),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12,),
                      InkWell(
                        onTap: (){
                          setState(() {
                            setSelectedRadio(2);
                          });
                        },
                        child: Container(
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xFFF7F8F8),
                          ),
                          child: Row(
                            children: [
                              Radio(
                                  value: 2,
                                  groupValue: selected,
                                  onChanged: (val){
                                    setState(() {
                                      setSelectedRadio(val as int);
                                    });
                                  }
                              ),
                              Text('No',style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color:Color(0xFF232C2E)
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                CustomButton(
                  title: 'Next',
                  onTap: (){
                    showAlertDialog(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Container(
        height: 423,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/feedbackConfirm.svg'),
                  const SizedBox(height: 25,),
                  const Text(
                    "Great",
                    style: TextStyle(
                        color: Color(0XFF567DF4),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5,),
                  const Text(
                    "Survey Done",
                    style: TextStyle(
                        color: Color(0XFF22215B),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context, PageTransition(MainScreen()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(16),
                            height: 54,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0XFF0180F5)),
                            child: Center(
                              child: Text(
                                "Back to home",
                                style:
                                TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
