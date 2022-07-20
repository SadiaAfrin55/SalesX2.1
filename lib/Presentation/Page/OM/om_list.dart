import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salesx_new_project/Service/LocalDataBase/localdata.dart';

import '../../../../Bloc/List/list_cubit.dart';
import '../../../../Constants/Strings/app_strings.dart';
import '../../Widgets/Card/Sec/target_card.dart';


class FomList extends StatefulWidget {
  const FomList({Key? key}) : super(key: key);

  @override
  _FomListState createState() => _FomListState();
}

class _FomListState extends State<FomList> {

  String? role;
  String? userId;
  String? shopId;
  bool checkAtten = false;
  String? linemanageridx;
  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      role = tokenx.get('role');
      shopId = tokenx.get('storeId');
      userId = tokenx.get('userId');
      print("shopId: "+shopId!);
      linemanageridx = tokenx.get('linemanagerid');
      role = tokenx.get('role');
      print("limmmmmm: " + role!);
      // BlocProvider.of<ListCubit>(context).loadSec(linemanageridx!);
      if(role == "SEC"){
        BlocProvider.of<ListCubit>(context).loadSecdata(linemanageridx!);
      }
      BlocProvider.of<ListCubit>(context).loadSecdata(linemanageridx!);
    });
  }

  @override
  void initState() {
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
            title: const Text("FOM's List",
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
                                    Navigator.pushNamed(context, SEC_LIST_DETAILES_PAGE,
                                        arguments: {
                                          'name': data.linemanager![index].name,
                                          'personalemail': data.linemanager![index].email,
                                          'officeemail': data.linemanager![index].officemail,
                                          'phone': data.linemanager![index].mobileno,
                                          'area': data.linemanager![index].area,
                                          'teritory': data.linemanager![index].teritory,
                                          'rigion': data.linemanager![index].employeeId,
                                        });
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
