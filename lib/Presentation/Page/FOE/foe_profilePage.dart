
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            children: const [
              HeaderComponents(),
              FoeChartComponents(),
              FoeMoreComponents(),
            ],
          ),
        ),
      ),
    );
  }
}
