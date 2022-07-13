
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../Bloc/List/list_cubit.dart';
import '../../../../../../Constants/Strings/app_strings.dart';
import '../../../../../../Service/LocalDataBase/localdata.dart';
import '../../../../../Widgets/Card/Sec/target_card.dart';

class FomTarget extends StatefulWidget {
  const FomTarget({Key? key}) : super(key: key);

  @override
  _FomTargetState createState() => _FomTargetState();
}

class _FomTargetState extends State<FomTarget> {

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
            title: const Text('Target',
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
                        return CircularProgressIndicator();
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
                                    Navigator.pushNamed(context, SEC_TARGET_HISTORY_PAGE,
                                        arguments: {
                                          'cusname': data.linemanager![index].name,
                                          'sale': data.linemanager![index].sales.toString(),
                                          'target': data.linemanager![index].target.toString(),
                                          'targetAchive': data.linemanager![index].targetAchive.toString(),
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
