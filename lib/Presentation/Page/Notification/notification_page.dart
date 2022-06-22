
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salesx_new_project/Service/LocalDataBase/localdata.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Bloc/Notification/notification_cubit.dart';
import '../../Widgets/Card/Notification/notification_card.dart';


class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      BlocProvider.of<NotificationCubit>(context).loadedAllNotification();
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
              title: const Text('NotificationPage',
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
            body: BlocBuilder<NotificationCubit, NotificationState>(
              builder: (context, state) {
                if (state is! AllNotificationget) {
                  return Center(child: Center(child: Text('problem'),),);
                }
                final data = (state as AllNotificationget).notificationResponse;
                return Column(
                  children: [
                    Column(
                      children: [
                        data.noticeBoardForm.isEmpty?
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
                        ) :
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: data.noticeBoardForm.length,
                              itemBuilder: (context, index) {
                                return NotificationCard(
                                  title: data.noticeBoardForm[index]!.description!,
                                  date: createdateIntoDat(data.noticeBoardForm[index]!.dateid,0),

                                );
                              }
                          ),
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
          )
      ),
    );
  }
  String createdateIntoDat(String? date,int? index){
    List dates = date!.split("T");
    print(dates[0]);
    return dates[index!];
  }

  String createtimeIntoDat(String? date,int? index){
    List dates = date!.split(":");
    print(dates[0]);
    return dates[index!];
  }
}
