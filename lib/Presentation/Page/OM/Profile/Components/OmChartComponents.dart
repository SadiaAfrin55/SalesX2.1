import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Widgets/Card/ProfileCard/profile_Card.dart';

class OmChartComponents extends StatelessWidget {
  const OmChartComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileCard(
                  cardImage: SvgPicture.asset('assets/icons/profileIcon/user-tick.svg'),
                  title: '2 Days',
                  subtitle: 'Present',
                ),
                ProfileCard(
                  cardImage: SvgPicture.asset('assets/icons/profileIcon/user-minus.svg'),
                  title: '85%',
                  subtitle: 'Absent',
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}