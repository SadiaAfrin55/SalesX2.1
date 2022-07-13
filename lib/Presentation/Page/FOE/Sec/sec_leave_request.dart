
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salesx_new_project/Presentation/Widgets/Button/CustomButoon/custom_button.dart';
import 'package:salesx_new_project/Service/LocalDataBase/localdata.dart';

import '../../../../Bloc/Leave/leave_cubit.dart';
import '../../../../Constants/Strings/app_strings.dart';
import '../../../Widgets/Card/Attendence/attendencelist_card.dart';
import '../../../Widgets/Card/ProfileCard/profile_Card.dart';
import '../../../Widgets/Card/Sales/mysale_card.dart';
import '../../../Widgets/Card/Sec/leaveRequest_card.dart';
import '../../../Widgets/Card/Sec/survey_card.dart';
import '../../../Widgets/Card/Sec/target_card.dart';
import '../../Attendence/Component/attendance_list-component.dart';
import 'LeaveRequest/LeaveApproveal/ApprovedLeave.dart';
import 'LeaveRequest/LeaveApproveal/RejectedLeave.dart';
import 'LeaveRequest/approved_request.dart';
import 'LeaveRequest/pending_request.dart';
class SecLeaveRequest extends StatefulWidget {
  const SecLeaveRequest({Key? key}) : super(key: key);

  @override
  _SecLeaveRequestState createState() => _SecLeaveRequestState();
}

class _SecLeaveRequestState extends State<SecLeaveRequest> {

  List<String> issueTypeDrop = ['Approved','Rejected','Pending'];
  String? issueType;
  String? linmanagerName;
  String? linemanageId;
  bool isSelected = false;

  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      linmanagerName = tokenx.get('linmanagerName');
      linemanageId = tokenx.get('userId');

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getToken();
    BlocProvider.of<LeaveCubit>(context).loadedApprovedLeave(linemanageId!,"accept","s");
    BlocProvider.of<LeaveCubit>(context).loadedPendingLeave(linemanageId!,"pending","s");
    BlocProvider.of<LeaveCubit>(context).loadedRejectLeave(linemanageId!,"reject","s");

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
            title: const Text('Leave Request',
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
          body: Container(
            padding: EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                                width: MediaQuery.of(context).size.width*0.85,
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
                    SizedBox(height: 20,),
                    issueType=="Approved"?ApprovedLeave():Text(''),
                    issueType=="Pending"?PendingLeave():Text(''),
                    issueType=="Rejected"?RejectedLeave():Text(''),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
