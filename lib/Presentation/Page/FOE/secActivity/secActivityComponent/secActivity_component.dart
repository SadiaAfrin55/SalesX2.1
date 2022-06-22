
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, SEC_ATTENDENCE_PAGE);
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/cardIcon/attendene.svg'),
              title: 'Attendance',
              color: const Color(0xFFFFE5E0),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, SEC_SALES_PAGE);
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/cardIcon/sales.svg',height: 16,),
              title: 'Sales',
              color: const Color(0xFFFFF6E1),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, SEC_SURVEY_PAGE);
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/cardIcon/survey.svg',height: 16,),
              title: 'Survey',
              color: const Color(0xFFE2FDED),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, SEC_TARGET_PAGE);
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/cardIcon/target.svg'),
              title: 'Target',
              color: const Color(0xFFE1F3FF),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, SEC_INVENTORY_PAGE);
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/cardIcon/inventory.svg'),
              title: 'Inventory',
              color: const Color(0xFFE8E7FD),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, SEC_LEAVE_PAGE);
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/cardIcon/leave.svg'),
              title: 'Leave',
              color: const Color(0xFFF1E1FF),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, LEAVE_HISTORY);
            },
            child: MoreOptionsCard(
              image: SvgPicture.asset('assets/icons/cardIcon/training.svg'),
              title: 'Training',
              color: const Color(0xFFFFF6E1),
            ),
          ),





        ],
      ),

    );
  }
}
