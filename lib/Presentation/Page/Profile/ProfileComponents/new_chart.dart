
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Widgets/Card/ProfileCard/profile_Card.dart';

class NewChartComponents extends StatelessWidget {
  const NewChartComponents({Key? key}) : super(key: key);

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
                cardImage: SvgPicture.asset('assets/icons/sales.svg'),
                title: '0',
                subtitle: 'Sales',
              ),
              ProfileCard(
                cardImage: SvgPicture.asset('assets/icons/profileIcon/chart-success.svg'),
                title: '0%',
                subtitle: 'Target Achive',
              ),
              ProfileCard(
                cardImage: SvgPicture.asset('assets/icons/profileIcon/user-tick.svg'),
                title: '0%',
                subtitle: 'Present',
              ),
              ProfileCard(
                cardImage: SvgPicture.asset('assets/icons/profileIcon/user-minus.svg'),
                title: '21 Days',
                subtitle: 'Absent',
              ),
              ProfileCard(
                cardImage: SvgPicture.asset('assets/icons/profileIcon/house.svg'),
                title: '0',
                subtitle: 'Asign shops',
              ),
              // ProfileCard(
              //   cardImage: SvgPicture.asset('assets/icons/profileIcon/stock.svg'),
              //   title: '1000',
              //   subtitle: 'On stock',
              // ),

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
