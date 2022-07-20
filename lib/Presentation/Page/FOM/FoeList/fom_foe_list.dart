
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Bloc/List/list_cubit.dart';
import '../../../../Constants/Strings/app_strings.dart';
import '../../../../Service/LocalDataBase/localdata.dart';
import '../../../Widgets/Card/Sec/target_card.dart';
class FomFoeListPage extends StatefulWidget {
  const FomFoeListPage({Key? key}) : super(key: key);

  @override
  _FomFoeListPageState createState() => _FomFoeListPageState();
}

class _FomFoeListPageState extends State<FomFoeListPage> {
  String? linemanagerid;
  String? role;

  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      linemanagerid = tokenx.get('linmanagerid');
      role = tokenx.get('role');
      //print("limmmmmm: " + linemanagerid!);
      BlocProvider.of<ListCubit>(context).loadSecdata(linemanagerid!);
      //BlocProvider.of<ListCubit>(context).loadSec();
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
    return role=="FOM"?
    Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text('FOE’s List',
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
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.only(top: 20),
              child: SingleChildScrollView(
                child: Column(

                  children: [
                    //IconButton(onPressed: (){print(linemanagerid!);}, icon: Icon(Icons.add_location_rounded)),
                    BlocBuilder<ListCubit, ListState>(
                      builder: (context, state) {
                        if(state is !SecGet){
                          return Center(child: Text("Loading"),);
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
                                itemCount: data!.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, SEC_LIST_DETAILES_PAGE,
                                          arguments: {
                                            'name': data.linemanager![index].name??"",
                                            'personalemail': data.linemanager![index].email??"n/a",
                                            'officeemail': data.linemanager![index].officemail??"n/a",
                                            'phone': data.linemanager![index].mobileno??"0",
                                            'area': data.linemanager![index].area??"n/a",
                                            'teritory': data.linemanager![index].teritory??"n/a",
                                            'rigion': data.linemanager![index].employeeId??"n/a",
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
                    const SizedBox(height: 30,)
                  ],
                ),
              ),
            ),
          )
      ),
    )
        :Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text('OM’s List',
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
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.only(top: 20),
              child: SingleChildScrollView(
                child: Column(

                  children: [
                    //IconButton(onPressed: (){print(linemanagerid!);}, icon: Icon(Icons.add_location_rounded)),
                    BlocBuilder<ListCubit, ListState>(
                      builder: (context, state) {
                        if(state is !SecGet){
                          return Center(child: Text("Loading"),);
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
                                itemCount: data!.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, SEC_LIST_DETAILES_PAGE,
                                          arguments: {
                                            'name': data.linemanager![index].name??"",
                                            'personalemail': data.linemanager![index].email??"n/a",
                                            'officeemail': data.linemanager![index].officemail??"n/a",
                                            'phone': data.linemanager![index].mobileno??"0",
                                            'area': data.linemanager![index].area??"n/a",
                                            'teritory': data.linemanager![index].teritory??"n/a",
                                            'rigion': data.linemanager![index].employeeId??"n/a",
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
                    const SizedBox(height: 30,)
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
