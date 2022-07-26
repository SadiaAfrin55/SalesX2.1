import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesx_new_project/Bloc/Attendence/VmAttendence/vm_attendence_cubit.dart';

import '../../../../Bloc/Attendence/attendence_cubit.dart';
import '../../../../Service/LocalDataBase/localdata.dart';
import '../../../Widgets/Card/Attendence/attendencelist_card.dart';
import '../../SM/Components/attendance_object_card.dart';
import '../../Survey/survey_noData.dart';

class VmAttendanceListComponenet extends StatefulWidget {
  const VmAttendanceListComponenet({Key? key}) : super(key: key);

  @override
  _VmAttendanceListComponenetState createState() => _VmAttendanceListComponenetState();
}

class _VmAttendanceListComponenetState extends State<VmAttendanceListComponenet> {
  String? role;

  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      role = tokenx.get('role');
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
    return BlocListener<VmAttendenceCubit, VmAttendenceState>(
      listener: (context, state) {
        if(state is GetVmAttendanceByDate){
          setState(() {

          });
        }
      },
      child: BlocBuilder<VmAttendenceCubit, VmAttendenceState>(
        builder: (context, state) {
          if(state is !GetVmAttendanceByDate){
            return Center(child: CircularProgressIndicator(),);
          }
          final data = (state as GetVmAttendanceByDate).vmAtdResponse;
          log('555 data $data');
          return Column(
            children: [
              data!.attendance.isEmpty?
              Container(
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
              ):
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.attendance.length,
                itemBuilder: (context, index) {
                  return AttendencelistCard(
                    img: data.attendance[index].storeAttendance[0].photo,
                    checkIn: data.attendance[index].workinghour.intime,
                    checkOut: data.attendance[index].workinghour.outtime,
                    attendenceDate: data.attendance[index].dateid,
                    status: '',
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
