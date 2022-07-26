
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Widgets/Card/ProfileCard/profile_Card.dart';
import '../Profile/ProfileComponents/chart_components.dart';
import '../Profile/ProfileComponents/header_components.dart';
import '../Profile/ProfileComponents/more_components.dart';
import 'FoeProfileComponents/foe_chartComponents.dart';
import 'FoeProfileComponents/foe_profileComponents.dart';

class FoeProfilePage extends StatefulWidget {
  const FoeProfilePage({Key? key}) : super(key: key);

  @override
  _FoeProfilePageState createState() => _FoeProfilePageState();
}

class _FoeProfilePageState extends State<FoeProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children:  [
              HeaderComponents(),
              //FoeChartComponents(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProfileCard(
                    cardImage: SvgPicture.asset('assets/icons/profileIcon/user-tick.svg'),
                    title: '10 Days',
                    subtitle: 'Present',
                  ),
                  ProfileCard(
                    cardImage: SvgPicture.asset('assets/icons/profileIcon/user-minus.svg'),
                    title: '20%',
                    subtitle: 'Absent',
                  ),
                ],
              ),
              FoeMoreComponents(),
            ],
          ),
        ),
      ),
    );
  }
}
