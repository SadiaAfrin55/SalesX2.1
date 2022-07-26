
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salesx_new_project/Presentation/Page/SM/SmProfile/Component/sm_profile_components.dart';
import 'package:salesx_new_project/Service/LocalDataBase/localdata.dart';

import '../../../../../Bloc/Attendence/VmAttendence/vm_attendence_cubit.dart';
import '../../../../Widgets/Card/ProfileCard/profile_Card.dart';
import '../../../OM/Profile/Components/OmChartComponents.dart';
import '../../../Profile/ProfileComponents/header_components.dart';

class SMProfilePage extends StatefulWidget {
  const SMProfilePage({Key? key}) : super(key: key);

  @override
  _SMProfilePageState createState() => _SMProfilePageState();
}

class _SMProfilePageState extends State<SMProfilePage> {

  String? userId;

  //storage instance
  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      userId = tokenx.get('userId');
      BlocProvider.of<VmAttendenceCubit>(context).profiledata(userId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children:  [
              HeaderComponents(),
              //OmChartComponents(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProfileCard(
                    cardImage: SvgPicture.asset('assets/icons/profileIcon/user-tick.svg'),
                    title: '1 Days',
                    subtitle: 'Present',
                  ),
                  ProfileCard(
                    cardImage: SvgPicture.asset('assets/icons/profileIcon/user-minus.svg'),
                    title: '50%',
                    subtitle: 'Absent',
                  ),
                ],
              ),
              SmMoreComponents(),
            ],
          ),
        ),
      ),
    );
  }
}
