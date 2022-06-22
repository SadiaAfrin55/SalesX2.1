
import 'package:flutter/material.dart';
class SecListPage extends StatefulWidget {
  const SecListPage({Key? key}) : super(key: key);

  @override
  _SecListPageState createState() => _SecListPageState();
}

class _SecListPageState extends State<SecListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text('SEC’s List',
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
              toolbarHeight: 60,
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
