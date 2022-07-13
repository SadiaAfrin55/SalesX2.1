
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salesx_new_project/Presentation/Page/FOE/Sec/LeaveRequest/pending_request.dart';

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
import 'LeaveRequest/LeaveApproveal/ApprovedLeave.dart';
import 'LeaveRequest/LeaveApproveal/RejectedLeave.dart';

class SecLeaveHistory extends StatefulWidget {
  final String? name;
  const SecLeaveHistory({Key? key,this.name}) : super(key: key);

  @override
  _SecLeaveHistoryState createState() => _SecLeaveHistoryState();
}

class _SecLeaveHistoryState extends State<SecLeaveHistory> {

  List<String> issueTypeDrop = ['Approved','Rejected','Pending'];
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
      //BlocProvider.of<ListCubit>(context).loadSec(linemanagerid!);
      // BlocProvider.of<ListCubit>(context).loadSecdata(linemanageId!);
      // BlocProvider.of<LeaveCubit>(context).loadedApprovedLeave(linemanageId!,"accept",token!);
      BlocProvider.of<LeaveCubit>(context).loadedPendingLeave(linemanageId!,"pending",token!);
      // BlocProvider.of<LeaveCubit>(context).loadedRejectLeave(linemanageId!,"reject",token!);
    });
  }

  @override
  void initState() {
    // TODO: implement initState

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
                    style: TextStyle(
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
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 45,
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
                  const SizedBox(height: 20,),
                  //LeaveListCard()

                  issueType=="Approved"?ApprovedLeave():Text(''),
                  issueType=="Pending"?PendingLeave():Text(''),
                  issueType=="Rejected"?RejectedLeave():Text(''),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
