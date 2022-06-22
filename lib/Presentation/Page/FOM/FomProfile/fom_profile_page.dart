
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            children: const [
              HeaderComponents(),
              OmChartComponents(),
              FomMoreComponents(),
            ],
          ),
        ),
      ),
    );
  }
}
