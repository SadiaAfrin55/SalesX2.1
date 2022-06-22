
import 'package:flutter/material.dart';

import '../../../Data/Model/Survey/Survey.dart';

class SurveyDetailPageInfo extends StatefulWidget {
  final Survey? survey;

  const SurveyDetailPageInfo({Key? key, this.survey}) : super(key: key);

  @override
  _SurveyDetailPageInfoState createState() => _SurveyDetailPageInfoState();
}

class _SurveyDetailPageInfoState extends State<SurveyDetailPageInfo> {
  String? cusName;
  String? cusAge;
  String? cusEmail;
  String? cusphoneNumber;
  String? cusintyerested;
  String? cusMiniBudget;
  String? cusMaximumBudget;
  String? cusCurrentPhone;

  @override
  void initState() {

    setState(() {
      cusName=widget.survey!.customername;
      cusAge=widget.survey!.customerage;
      cusEmail=widget.survey!.customeremail;
      cusphoneNumber=widget.survey!.customercontactno;
      cusintyerested=widget.survey!.interestedin;
      cusMiniBudget=widget.survey!.customerbudget;
      cusMaximumBudget=widget.survey!.customerage;
      cusCurrentPhone=widget.survey!.customercurrentphone;

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Details',
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
          toolbarHeight: 84,
          elevation: 0.5,
        ),
        body:Stack(
          children: [
            dhashboard(context)
          ],
        )
    );
  }

  Widget dhashboard(context){
    return Material(
      elevation: 30.0,
      shadowColor: Colors.blueAccent,
      color: Colors.blue,
      child: Container(
        padding: EdgeInsets.only(left: 0,right:0,top: 0),
        child: Column(
          children: [
            //AppBar//App bar
            //App Bar
            SizedBox(height:3,),
            Flexible(
              flex:100,
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 24,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child:Image.asset('assets/images/survey.png',height: 60,width: 60,),
                              ),

                              Expanded(
                                flex: 4,
                                child:Text("Customer Survey",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ),
                          SizedBox(height: 4,),
                          Divider(
                            height: 3,
                            thickness: 3,
                          ),
                          SizedBox(height: 20,),
                          Text("Customer Name: $cusName",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w900),),
                          SizedBox(height: 24,),
                          Text("Customer Number: $cusphoneNumber",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),
                          SizedBox(height: 24,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child:Text("Age: $cusAge",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                flex: 4,
                                child:Text("Email: $cusEmail",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ),
                          SizedBox(height: 24,),
                          Text("Interested in: $cusintyerested",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                          SizedBox(height: 24,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child:Text("Minimum Budget:\n $cusMiniBudget tk/=",style: TextStyle(fontSize: 24),),
                              ),
                              SizedBox(width: 8,),
                              Expanded(
                                flex: 2,
                                child:Text("Maximum Budget:\n $cusMaximumBudget tk/=",style: TextStyle(fontSize: 24),),
                              ),
                            ],
                          ),
                          SizedBox(height: 24,),
                          Text("Current Phone:   $cusCurrentPhone",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),


                        ],
                      ),
                    ),
                  ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
