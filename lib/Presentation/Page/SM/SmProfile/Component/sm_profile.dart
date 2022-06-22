
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salesx_new_project/Presentation/Page/SM/SmProfile/Component/sm_profile_components.dart';

import '../../../OM/Profile/Components/OmChartComponents.dart';
import '../../../Profile/ProfileComponents/header_components.dart';

class SMProfilePage extends StatefulWidget {
  const SMProfilePage({Key? key}) : super(key: key);

  @override
  _SMProfilePageState createState() => _SMProfilePageState();
}

class _SMProfilePageState extends State<SMProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: const [
              HeaderComponents(),
              OmChartComponents(),
              SmMoreComponents(),
            ],
          ),
        ),
      ),
    );
  }
}
