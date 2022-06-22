
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            children: const [
              HeaderComponents(),
              OmChartComponents(),
              OmMoreComponents(),
            ],
          ),
        ),
      ),
    );
  }
}
