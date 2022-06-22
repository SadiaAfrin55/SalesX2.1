
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Widgets/Card/ProfileCard/profile_Card.dart';

class FoeChartComponents extends StatelessWidget {
  const FoeChartComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: GridView(
          //physics: NeverScrollableScrollPhysics(),
          children: [

            ProfileCard(
              cardImage: SvgPicture.asset('assets/icons/profileIcon/chart-success.svg'),
              title: '70%',
              subtitle: 'Target Achive',
            ),
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
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 20 / 19,
              crossAxisSpacing: 13,
              mainAxisSpacing: 13),
        ),
      ),
    );
  }
}
