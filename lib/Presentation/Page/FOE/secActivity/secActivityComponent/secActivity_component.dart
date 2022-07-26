
import 'dart:io';
import 'dart:math' as Math;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import '../../../../../Constants/Strings/app_strings.dart';
import '../../../Profile/ProfileComponents/moreOption_components.dart';
import '../../../SM/OM/om_attendance.dart';
import '../../../SM/OM/om_training.dart';


class SecActivityComponents extends StatefulWidget {
  const SecActivityComponents({Key? key}) : super(key: key);

  @override
  State<SecActivityComponents> createState() => _SecActivityComponentsState();
}

class _SecActivityComponentsState extends State<SecActivityComponents> {

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
              //Navigator.pushNamed(context, SEC_ATTENDENCE_PAGE);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OmAttendenceSurvey()),
              );
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/cardIcon/Attendance.svg',height: 16,),
              title: 'Attendance',
              color: const Color(0xFFFFE5E0),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, SEC_SALES_PAGE);
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/cardIcon/My survey.svg',height: 16,),
              title: 'Sales',
              color: const Color(0xFFFFF6E1),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, SEC_SURVEY_PAGE);
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/cardIcon/Survey.svg',height: 16,),
              title: 'Survey',
              color: const Color(0xFFE2FDED),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, SEC_TARGET_PAGE);
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/profileIcon/Target.svg'),
              title: 'Target',
              color: const Color(0xFFE1F3FF),
            ),
          ),
          // GestureDetector(
          //   onTap: (){
          //     Navigator.pushNamed(context, SEC_INVENTORY_PAGE);
          //   },
          //   child: MoreOptionsCard(
          //     image: SvgPicture.asset('assets/icons/cardIcon/inventory.svg',height: 16,),
          //     title: 'Inventory',
          //     color: const Color(0xFFE8E7FD),
          //   ),
          // ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, SEC_LEAVE_PAGE);
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/cardIcon/Leave.svg',height: 16,),
              title: 'Leave',
              color: const Color(0xFFF1E1FF),
            ),
          ),
          GestureDetector(
            onTap: (){
              //Navigator.pushNamed(context, SEC_TRAINING_PAGE);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OmTrainingActivity()),
              );
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/profileIcon/Tr Attendance.svg'),
              title: 'Training',
              color: const Color(0xFFFFF6E1),
            ),
          ),





        ],
      ),

    );
  }
}
