
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salesx_new_project/Presentation/Page/FOE/Sec/LeaveRequest/Issue/pending.dart';

import '../../../../Bloc/Leave/leave_cubit.dart';
import '../../../../Bloc/List/list_cubit.dart';
import '../../../../Constants/Strings/app_strings.dart';
import '../../../../Service/LocalDataBase/localdata.dart';
import '../../../Widgets/Card/Attendence/attendencelist_card.dart';
import '../../../Widgets/Card/Leave/leave_card.dart';
import '../../../Widgets/Card/ProfileCard/profile_Card.dart';
import '../../../Widgets/Card/Sales/mysale_card.dart';
import '../../../Widgets/Card/Sec/survey_card.dart';
import '../../../Widgets/Card/Sec/target_card.dart';
import 'LeaveRequest/Issue/accept.dart';
import 'LeaveRequest/Issue/reject.dart';



class SecLeaveHistory extends StatefulWidget {
  final String? name;
  final String? secId;

  const SecLeaveHistory({Key? key,this.name, this.secId}) : super(key: key);

  @override
  _SecLeaveHistoryState createState() => _SecLeaveHistoryState();
}

class _SecLeaveHistoryState extends State<SecLeaveHistory> {

  List<String> issueTypeDrop = ['accept','reject','pending'];
  String? issueType;
  String? linmanagerName;
  String? linemanageId;
  String? token;
  bool isSelected = false;

  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      linemanageId = tokenx.get('linmanagerid');
      token = tokenx.get('token');
      print("leeeeelimmmmmm: " + linemanageId!);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    //issueType="Pending";
    getToken();
    super.initState();
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
            titleSpacing: 0,
            title: Row(
              children: [
                   Expanded(
                   flex: 4,
                   child: Text('${widget.name}'+'  Leave History',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                ),
                 ),
              ],
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
            child: Container(
              margin: const EdgeInsets.only(top: 20,left: 15,right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Filter',style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),),
                  const SizedBox(height: 20,),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width*0.92,
                              padding: const EdgeInsets.all(13),
                              color: const Color(0xFFF5F7F8),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  value: issueType,
                                  icon: const Icon(Icons.keyboard_arrow_down,color: Color(0xFF292D32),),
                                  iconSize: 20,
                                  onChanged: (newValue) {
                                    setState(() {
                                      issueType = newValue.toString();

                                      if(issueType!=null){
                                        setState(() {
                                          isSelected=true;
                                        });
                                      }else{
                                        setState(() {
                                          isSelected=false;
                                        });
                                      }
                                    });
                                  },
                                  items: issueTypeDrop.map((location) {
                                    return DropdownMenuItem(
                                      child:  Text(location),
                                      value:location,
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),

                          ],
                        ),


                      ],
                    ),
                  ),
                  // const SizedBox(height: 20,),
                  //LeaveListCard()

                  issueType=="accept"?AcceptRequest(id: widget.secId,):Text(''),
                  issueType=="pending"?PendingRequest(id: widget.secId,):Text(''),
                  issueType=="reject"?RejectRequest(id: widget.secId,):Text(''),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
