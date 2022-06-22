
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Widgets/Card/ProfileCard/profile_Card.dart';

class ChartComponents extends StatelessWidget {
  const ChartComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: GridView.builder(
          //physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 20 / 19,
                crossAxisSpacing: 13,
                mainAxisSpacing: 13),
            itemCount: 6,
            itemBuilder: (BuildContext ctx, index) {
              return ProfileCard(
                cardImage: SvgPicture.asset('assets/icons/sales.svg'),
                title: '1000',
                subtitle: 'Target Achive' ,
              );
            }),
      ),
    );
  }
}
