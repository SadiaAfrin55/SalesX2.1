
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

class FomActivityComponents extends StatefulWidget {
  const   FomActivityComponents({Key? key}) : super(key: key);

  @override
  State<FomActivityComponents> createState() => _FomActivityComponentsState();
}

class _FomActivityComponentsState extends State<FomActivityComponents> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, OM_FOM_ATTENDANCE);
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/cardIcon/attendene.svg'),
              title: 'Attendance',
              color: const Color(0xFFFFE5E0),
            ),
          ),

          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, OM_FOM_TARGET);
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/cardIcon/target.svg'),
              title: 'Target',
              color: const Color(0xFFE1F3FF),
            ),
          ),

          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, OM_FOM_LEAVE);
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
              Navigator.pushNamed(context, FOM_FOE_ACTIVITY_PAGE);
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/cardIcon/activity.svg'),
              title: "FOE's Activity",
              color: const Color(0xFFE2FDED),
            ),
          ),
          
        ],
      ),

    );
  }
}
