
import 'dart:io';
import 'dart:math' as Math;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';

import '../../../../../../Constants/Strings/app_strings.dart';
import '../../../../Profile/ProfileComponents/moreOption_components.dart';
import '../../../../SM/FOE/foe_training_history.dart';

class FomFoeActivityComponent extends StatefulWidget {
  const   FomFoeActivityComponent({Key? key}) : super(key: key);

  @override
  State<FomFoeActivityComponent> createState() => _FomFoeActivityComponentState();
}

class _FomFoeActivityComponentState extends State<FomFoeActivityComponent> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, FOM_FOE_ATTENDANCE);
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/cardIcon/Attendance.svg',height: 16,),
              title: 'Attendance',
              color: const Color(0xFFFFE5E0),
            ),
          ),

          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, FOM_FOE_TARGET);
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/profileIcon/Target.svg'),
              title: 'Target',
              color: const Color(0xFFE1F3FF),
            ),
          ),

          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, FOM_FOE_LEAVE);
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/cardIcon/Leave.svg',height: 16,),
              title: 'Leave',
              color: const Color(0xFFF1E1FF),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FoeTrainingCard()),
              );
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/profileIcon/Tr Attendance.svg'),
              title: 'Training',
              color: const Color(0xFFFFEFE0),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, SEC_ACTIVITY_PAGE);
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/cardIcon/activity.svg'),
              title: "SEC's Activity",
              color: const Color(0xFFE2FDED),
            ),
          ),

        ],
      ),

    );
  }
}
