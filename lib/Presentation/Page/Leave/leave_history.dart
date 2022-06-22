import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import '../../../Bloc/Leave/leave_cubit.dart';
import '../../../Constants/Strings/app_strings.dart';
import '../../../Service/LocalDataBase/localdata.dart';
import '../../Widgets/Card/Leave/leave_card.dart';
import '../../Widgets/Card/Survey/phone_card.dart';
import 'Component/leave_list_component.dart';

class LeaveHistory extends StatefulWidget {
  const LeaveHistory({Key? key}) : super(key: key);

  @override
  _LeaveHistoryState createState() => _LeaveHistoryState();
}

class _LeaveHistoryState extends State<LeaveHistory>
    with TickerProviderStateMixin {

  var refreshKey = GlobalKey<RefreshIndicatorState>();
  String? linmanagerName;
  String? userId;
  String? leaveDate;
  String? saveMonth;
  String? showDateInfo;
  String? month;
  DateTime? selectedDate;
  String? token;
  String? role;
  DateTime initialDate=DateTime.now();
  String? Storename;
  String? newmonth;
  var dateParse;
  int? tabPosition=0;


  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      userId = tokenx.get('userId');
      token = tokenx.get('token');
      role = tokenx.get('role');
      BlocProvider.of<LeaveCubit>(context).loadedLeaveByMonth(userId!,newmonth!);
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
    var formattedmonth = "$month";

    setState(() {
      switch (month.toString()){
        case "01":
          tabPosition=0;
          break;
        case "02":
          tabPosition=1;
          break;
        case "03":
          tabPosition=2;
          break;
        case "04":
          tabPosition=3;
          break;
        case "05":
          tabPosition=4;
          break;
        case "06":
          tabPosition=5;
          break;
        case "07":
          tabPosition=6;
          break;
        case "08":
          tabPosition=7;
          break;
        case "09":
          tabPosition=8;
          break;
        case "10":
          tabPosition=9;
          break;
        case "11":
          tabPosition=10;
          break;
        case "12":
          tabPosition=11;
          break;
      }
    });
    print(month);
    print("xxxxxxxxx");
    saveMonth=formattedmonth.toString();
    newmonth = saveMonth;
    leaveDate=formattedDate.toString();

    getToken();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    //TabController _tabController = TabController(length: 12, vsync: this);
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text('Leave History',
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
              width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DefaultTabController(
                      length: 12,
                      initialIndex:tabPosition! ,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(left: 12),
                        height: 49,
                        child: TabBar(
                          onTap: (index){
                            print(index);
                            switch(index){
                              case 0:
                                BlocProvider.of<LeaveCubit>(context).loadedLeaveByMonth(userId!,"1");
                                Logger().d("january");
                                break;
                              case 1:
                                BlocProvider.of<LeaveCubit>(context).loadedLeaveByMonth(userId!,"2");

                                break;
                              case 2:
                                  BlocProvider.of<LeaveCubit>(context).loadedLeaveByMonth(userId!,"3");

                                break;
                              case 3:
                                BlocProvider.of<LeaveCubit>(context).loadedLeaveByMonth(userId!,"4");

                                break;
                              case 4:
                                BlocProvider.of<LeaveCubit>(context).loadedLeaveByMonth(userId!,"5");

                                break;
                              case 5:
                                BlocProvider.of<LeaveCubit>(context).loadedLeaveByMonth(userId!,"6");

                                break;
                              case 6:

                                BlocProvider.of<LeaveCubit>(context).loadedLeaveByMonth(userId!,"7");

                                break;
                              case 7:
                                BlocProvider.of<LeaveCubit>(context).loadedLeaveByMonth(userId!,"8");

                                break;
                              case 8:
                                BlocProvider.of<LeaveCubit>(context).loadedLeaveByMonth(userId!,"9");

                                break;
                              case 9:
                                BlocProvider.of<LeaveCubit>(context).loadedLeaveByMonth(userId!,"10");

                                break;
                              case 10:
                                BlocProvider.of<LeaveCubit>(context).loadedLeaveByMonth(userId!,"11");

                                break;
                              case 11:
                                BlocProvider.of<LeaveCubit>(context).loadedLeaveByMonth(userId!,"12");

                                break;

                            }
                            //BlocProvider.of<LeaveCubit>(context).loadedLeave(userId!,leaveDate!);
                          },
                          isScrollable: true,
                          indicatorColor: Colors.blue,
                          indicatorWeight: 2,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelColor: Colors.blue,
                          labelStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                          ),
                          unselectedLabelColor: Colors.black,

                          tabs:const [
                            Text('January'),
                            Text('February'),
                            Text('March'),
                            Text('April'),
                            Text('May'),
                            Text('June'),
                            Text('July'),
                            Text('August'),
                            Text('September'),
                            Text('October'),
                            Text('November'),
                            Text('December'),
                          ],),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    LeaveListComponents(),
                    const SizedBox(height: 35,),
                  ],
                ),
              ),
            ),

          )),
    );
  }

}
