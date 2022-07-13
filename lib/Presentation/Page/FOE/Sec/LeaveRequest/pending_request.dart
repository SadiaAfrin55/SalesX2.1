import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:salesx_new_project/Presentation/Page/FOE/Sec/LeaveRequest/Components/request_card.dart';

import '../../../../../Bloc/Leave/leave_cubit.dart';
import '../../../../../Service/LocalDataBase/localdata.dart';


class PendingLeave extends StatefulWidget {
  final String? id;

  const PendingLeave({Key? key, this.id}) : super(key: key);
  @override
  _PendingLeaveState createState() => _PendingLeaveState();
}

class _PendingLeaveState extends State<PendingLeave> {

  var refreshKey = GlobalKey<RefreshIndicatorState>();
  String? linmanagerName;
  String? linemanageId;

  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      linmanagerName = tokenx.get('linmanagerName');
      linemanageId = tokenx.get('userId');
      BlocProvider.of<LeaveCubit>(context).loadedPendingLeave(linemanageId!,"pending","s");
    });
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return  BlocBuilder<LeaveCubit,LeaveState>(
      builder: (context,state){
        if(!(state is LeaveLoded)){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final leave = (state as LeaveLoded).leaveResponse;
        Logger().d(leave.leaveform);
        return leave.leaveform==null?Center(
          child: Container(
            height: MediaQuery.of(context).size.height*0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/nodata.png'),
                Text('No data available',style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.8)
                ),),
              ],
            ),
          ),
        ):

        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
              physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              children: leave.leaveform!.map((leave) =>
                  Container(
                    margin: EdgeInsets.only(bottom: 14),
                    child: InkWell(
                      child: RequestCard(
                        name: leave.username,
                        status: leave.leaveformat,
                        reason: leave.reason,
                        fromDate: convertdateIntoDat(leave.date!, 0),
                        toDate: convertdateIntoDat(leave.date!, 1),

                      )
                    ),
                  )

              ).toList()
          ),
        );
      },

    );
  }


  //calculate days from data range
  String convertdateIntoDat(String date,int index){
    List dates = date.split('To');
    print(dates[0]);
    return dates[index];
  }
  String calculatedays(String date,int index){
    List dates = date.split('/');
    return dates[index];
  }
  int calculatedaymain(String date,String date2){
    int x=int.parse(date);
    int y=int.parse(date2);
    int math;
    if(x<y){
      math=y-x;
    }else{
      math=x-y;
    }
    print(math);
    return math;
  }
  //calculate days from data range



  Future<Null>refreshList() async{
    refreshKey.currentState?.show(atTop: false);
    setState(() {

    });
    return null;
  }
}
