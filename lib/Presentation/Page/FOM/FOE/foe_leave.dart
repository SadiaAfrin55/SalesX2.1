
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salesx_new_project/Service/LocalDataBase/localdata.dart';

import '../../../../Bloc/List/list_cubit.dart';
import '../../../../Constants/Strings/app_strings.dart';
import '../../../Widgets/Card/Attendence/attendencelist_card.dart';
import '../../../Widgets/Card/ProfileCard/profile_Card.dart';
import '../../../Widgets/Card/Sales/mysale_card.dart';
import '../../../Widgets/Card/Sec/survey_card.dart';
import '../../../Widgets/Card/Sec/target_card.dart';
import '../../Attendence/Component/attendance_list-component.dart';
class FoeLeave extends StatefulWidget {
  const FoeLeave({Key? key}) : super(key: key);

  @override
  _FoeLeaveState createState() => _FoeLeaveState();
}

class _FoeLeaveState extends State<FoeLeave> {
  String? linemanagerid;
  String? role;

  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      linemanagerid = tokenx.get('linmanagerid');
      role = tokenx.get('role');
      print("limmmmmm: " + linemanagerid!);
      //BlocProvider.of<ListCubit>(context).loadSec(linemanagerid!);

      BlocProvider.of<ListCubit>(context).loadSecdata(linemanagerid!);
    });
  }

  @override
  void initState() {
    getToken();
    //BlocProvider.of<ListCubit>(context).loadFom();
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
            title: const Text('Leave',
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
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  BlocBuilder<ListCubit, ListState>(
                    builder: (context, state) {
                      if(state is !SecGet){
                        return Center(child: CircularProgressIndicator());
                      }

                      var data = (state as SecGet).secResponse;

                      return Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 20 / 19,
                                  crossAxisSpacing: 13,
                                  mainAxisSpacing: 13),
                              itemCount: data!.linemanager!.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, SEC_LEAVE_HISTORY_PAGE,
                                        arguments: {
                                          'name': data.linemanager![index].name,
                                          'secId': data.linemanager![index].id,
                                        }
                                    );
                                  },
                                  child: TargetCard(
                                    cardImage: Image.asset(
                                      'assets/icons/profile_user.png',
                                      fit: BoxFit.cover,),
                                    title: data.linemanager![index].name,
                                  ),
                                );
                              }),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 40),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
