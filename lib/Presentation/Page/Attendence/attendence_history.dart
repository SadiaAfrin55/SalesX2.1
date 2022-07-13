import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:salesx_new_project/Bloc/Attendence/VmAttendence/vm_attendence_cubit.dart';
import '../../../Bloc/Attendence/attendence_cubit.dart';
import '../../../Constants/Strings/app_strings.dart';
import '../../../Service/LocalDataBase/localdata.dart';
import '../../Widgets/Card/Survey/phone_card.dart';
import 'Component/attendance_list-component.dart';

class AttendenceHistory extends StatefulWidget {
  const AttendenceHistory({Key? key}) : super(key: key);

  @override
  _AttendenceHistoryState createState() => _AttendenceHistoryState();
}

class _AttendenceHistoryState extends State<AttendenceHistory> with TickerProviderStateMixin {

  bool isClicked = true;
  String? userId;
  String? role;
  String? leaveDate;
  String? saveMonth;
  String? showDateInfo;
  String? month;
  DateTime? selectedDate;
  DateTime initialDate=DateTime.now();
  String? Storename;
  var dateParse;
  int? tabPosition=0;

  //storage instance
  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      userId = tokenx.get('userId');
      role = tokenx.get('role');
      //BlocProvider.of<VmAttendenceCubit>(context).loadVmAttendanceByMonth(userId!,leaveDate!);
      BlocProvider.of<AttendenceCubit>(context).loadUserAttendanceByMonth(userId!,leaveDate!);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    var date = new DateTime.now().toString();
    dateParse = DateTime.parse(date);

    if(dateParse.month.toString().length<2){
      month="0"+dateParse.month.toString();
    }else{
      // selectedDate.month.toString().length<2 ? "0"+selectedDate.month.toString():selectedDate.month.toString()
      month=dateParse.month.toString();
    }

    var formattedDate = "$month-${dateParse.year}";
    //var formattedDate = "$month/${'0'+dateParse.day.toString()}/${dateParse.year}";
    var formattedmonth = "$month";

    print(month);
    print("xxxxxxxxx");
    saveMonth=formattedmonth.toString();
    leaveDate=formattedDate.toString();

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
              title: const Text('Attendance History',
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
              child: Container(
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    AttendanceListComponenet()
                  ],
                ),
              ),
            ),

          )),
    );
  }

}
