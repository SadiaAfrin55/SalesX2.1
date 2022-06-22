
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'ProfileComponents/chart_components.dart';
import 'ProfileComponents/header_components.dart';
import 'ProfileComponents/more_components.dart';
import 'ProfileComponents/new_chart.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: const [
              HeaderComponents(),
              NewChartComponents(),
              MoreComponents(),
            ],
          ),
        ),
      ),
    );
  }
}
