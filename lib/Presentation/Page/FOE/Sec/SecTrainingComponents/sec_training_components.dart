
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesx_new_project/Bloc/List/list_cubit.dart';
import 'package:salesx_new_project/Service/LocalDataBase/localdata.dart';

import '../../../../Widgets/Card/Attendence/attendencelist_card.dart';
import '../../../../Widgets/Card/Attendence/sec_training_card.dart';

class SecTrainingComponents extends StatefulWidget {
  final String? date;
  const SecTrainingComponents({Key? key,this.date}) : super(key: key);

  @override
  _SecTrainingComponentsState createState() => _SecTrainingComponentsState();
}

class _SecTrainingComponentsState extends State<SecTrainingComponents> {
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
    return BlocBuilder<ListCubit, ListState>(
      builder: (context, state) {
        if(state is !SecTrainingAtd){
          return Center(child: CircularProgressIndicator(),);
        }
        final data = (state as SecTrainingAtd).trainingResponse;
        return Column(
          children: [
            data!.attendance!.isEmpty?
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
                return SecTrainingCard(
                  img: data.attendance![index].trainingAtd!.photo,
                  checkIn: data.attendance![index].trainingAtd!.time,
                  status: data.attendance![index].trainingAtd!.remarks,

                );
              },
            ),
          ],
        );
      },
    );
  }
}
