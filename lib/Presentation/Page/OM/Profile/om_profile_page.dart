
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Widgets/Card/ProfileCard/profile_Card.dart';
import '../../Profile/ProfileComponents/header_components.dart';
import 'Components/OmChartComponents.dart';
import 'Components/OmMoreComponents.dart';

class OmProfilePage extends StatefulWidget {
  const OmProfilePage({Key? key}) : super(key: key);

  @override
  _OmProfilePageState createState() => _OmProfilePageState();
}

class _OmProfilePageState extends State<OmProfilePage> {
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
                    title: '8 Days',
                    subtitle: 'Present',
                  ),
                  ProfileCard(
                    cardImage: SvgPicture.asset('assets/icons/profileIcon/user-minus.svg'),
                    title: '15%',
                    subtitle: 'Absent',
                  ),
                ],
              ),
              OmMoreComponents(),
            ],
          ),
        ),
      ),
    );
  }
}
