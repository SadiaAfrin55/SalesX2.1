
import 'package:flutter/material.dart';
class FomFoeListPage extends StatefulWidget {
  const FomFoeListPage({Key? key}) : super(key: key);

  @override
  _FomFoeListPageState createState() => _FomFoeListPageState();
}

class _FomFoeListPageState extends State<FomFoeListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text('FOE’s List',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              leading: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back, color: Colors.black, size: 27,),
                ),
              ),
              toolbarHeight: 84,
              elevation: 0.5,
            ),
            body: Container(
              child: Column(
                children: [],
              ),
            ),
          )
      ),
    );
  }
}
