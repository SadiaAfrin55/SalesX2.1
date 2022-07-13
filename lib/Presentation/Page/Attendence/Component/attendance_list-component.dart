import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesx_new_project/Bloc/Attendence/VmAttendence/vm_attendence_cubit.dart';

import '../../../../Bloc/Attendence/attendence_cubit.dart';
import '../../../../Service/LocalDataBase/localdata.dart';
import '../../../Widgets/Card/Attendence/attendencelist_card.dart';
import '../../Survey/survey_noData.dart';

class AttendanceListComponenet extends StatefulWidget {
  final String? date;
  const AttendanceListComponenet({Key? key, this.date}) : super(key: key);

  @override
  _AttendanceListComponenetState createState() => _AttendanceListComponenetState();
}

class _AttendanceListComponenetState extends State<AttendanceListComponenet> {
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
    return role=="OM"?
    BlocListener<VmAttendenceCubit, VmAttendenceState>(
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
          final data = (state as GetVmAttendanceByDate).attendance;
          return Column(
            children: [
              data!.isEmpty?
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
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return AttendencelistCard(
                      img: data[index].storeAttendance![index].photo,
                      checkIn: data[index].workinghour!.intime,
                      checkOut: data[index].workinghour!.outtime,
                      attendenceDate: data[index].dateid
                  );
                },
              ),
            ],
          );
        },
      ),
    ):
    role=="FOM"?
    BlocListener<VmAttendenceCubit, VmAttendenceState>(
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
          final data = (state as GetVmAttendanceByDate).attendance;
          return Column(
            children: [
              data!.isEmpty?
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
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return AttendencelistCard(
                      img: data[index].storeAttendance![index].photo,
                      checkIn: data[index].workinghour!.intime,
                      checkOut: data[index].workinghour!.outtime,
                      attendenceDate: data[index].dateid
                  );
                },
              ),
            ],
          );
        },
      ),
    ):
    role=="FOE"?
    BlocListener<VmAttendenceCubit, VmAttendenceState>(
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
          final data = (state as GetVmAttendanceByDate).attendance;

          return data==null?Center(child: Text('no data'),):Column(
            children: [
              data.isEmpty?
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
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return AttendencelistCard(
                      img: data[index].storeAttendance![index].photo,
                      checkIn: data[index].workinghour!.intime,
                      checkOut: data[index].workinghour!.outtime,
                      attendenceDate: data[index].dateid
                  );
                },
              ),
            ],
          );
        },
      ),
    ):
    role=="SOM"?
    BlocListener<VmAttendenceCubit, VmAttendenceState>(
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
          final data = (state as GetVmAttendanceByDate).attendance;
          return Column(
            children: [
              data!.isEmpty?
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
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return AttendencelistCard(
                      img: data[index].storeAttendance![index].photo,
                      checkIn: data[index].workinghour!.intime,
                      checkOut: data[index].workinghour!.outtime,
                      attendenceDate: data[index].dateid
                  );
                },
              ),
            ],
          );
        },
      ),
    ):






    BlocListener<AttendenceCubit, AttendenceState>(
      listener: (context, state) {
        if(state is GetUserAttendanceByMonth){
          setState(() {

          });
        }
      },
      child: BlocBuilder<AttendenceCubit, AttendenceState>(
        builder: (context, state) {
          if(state is !GetUserAttendanceByMonth){
            return Center(child: CircularProgressIndicator(),);
          }
          final data = (state as GetUserAttendanceByMonth).attendance;
          return Column(
            children: [
              data!.isEmpty?
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
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return AttendencelistCard(
                    img: data[index].morningAtd!.photo,
                    checkIn: data[index].workinghour!.intime,
                    checkOut: data[index].signoffAtd!.outTime,
                    attendenceDate: data[index].dateid,
                    status: data[index].role,
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
