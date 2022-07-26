
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Widgets/Card/ProfileCard/profile_Card.dart';
import '../../OM/Profile/Components/OmChartComponents.dart';
import '../../Profile/ProfileComponents/header_components.dart';
import 'Components/fom_profile_components.dart';

class FOMProfilePage extends StatefulWidget {
  const FOMProfilePage({Key? key}) : super(key: key);

  @override
  _FOMProfilePageState createState() => _FOMProfilePageState();
}

class _FOMProfilePageState extends State<FOMProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children:  [
              HeaderComponents(),
              //OmChartComponents(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProfileCard(
                    cardImage: SvgPicture.asset('assets/icons/profileIcon/user-tick.svg'),
                    title: '6 Days',
                    subtitle: 'Present',
                  ),
                  ProfileCard(
                    cardImage: SvgPicture.asset('assets/icons/profileIcon/user-minus.svg'),
                    title: '35%',
                    subtitle: 'Absent',
                  ),
                ],
              ),
              FomMoreComponents(),
            ],
          ),
        ),
      ),
    );
  }
}
