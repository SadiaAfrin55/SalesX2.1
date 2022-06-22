
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
import '../../Profile/ProfileComponents/moreOption_components.dart';

class smActivityComponents extends StatefulWidget {
  const   smActivityComponents({Key? key}) : super(key: key);

  @override
  State<smActivityComponents> createState() => _smActivityComponentsState();
}

class _smActivityComponentsState extends State<smActivityComponents> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, SM_FOM_ATTENDANCE);
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/cardIcon/attendene.svg'),
              title: 'Attendance',
              color: const Color(0xFFFFE5E0),
            ),
          ),

          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, SM_FOM_TARGET);
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/cardIcon/target.svg'),
              title: 'Target',
              color: const Color(0xFFE1F3FF),
            ),
          ),

          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, SM_FOM_LEAVE);
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/cardIcon/leave.svg'),
              title: 'Leave',
              color: const Color(0xFFF1E1FF),
            ),
          ),
          GestureDetector(
            onTap: (){
              //Navigator.pushNamed(context, LEAVE_HISTORY);
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/cardIcon/training.svg'),
              title: 'Training',
              color: const Color(0xFFFFEFE0),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, FOM_ACTIVITY_PAGE);
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/cardIcon/activity.svg'),
              title: "FOM's Activity",
              color: const Color(0xFFE2FDED),
            ),
          ),

        ],
      ),

    );
  }
}
