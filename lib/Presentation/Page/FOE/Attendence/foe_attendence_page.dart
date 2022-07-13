import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salesx_new_project/Presentation/Page/Visit/Bloc/visit_cubit.dart';
import 'package:salesx_new_project/Presentation/Page/Visit/visit_network.dart';
import 'package:salesx_new_project/Presentation/Widgets/TextFields/filledTextField.dart';
import 'package:salesx_new_project/Presentation/Widgets/TextFields/normalTextField.dart';

import '../../../../Constants/Strings/app_strings.dart';


class FoeAttendencePage extends StatefulWidget {
  const FoeAttendencePage({Key? key}) : super(key: key);

  @override
  _FoeAttendencePageState createState() => _FoeAttendencePageState();
}

class _FoeAttendencePageState extends State<FoeAttendencePage> {
  TextEditingController search = TextEditingController();
  FetchUserList _userList = FetchUserList();

  @override
  void initState() {
    BlocProvider.of<VisitCubit>(context).loadStoreInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Attendance',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          leading: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 27,
              ),
            ),
          ),
          toolbarHeight: 60,
          elevation: 0.5,
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Search Shop", style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.5)
                ),),
                const SizedBox(height: 18,),

                BlocBuilder<VisitCubit, VisitState>(
                  builder: (context, state) {
                    if(state is !GetShopdata){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    var data = (state as GetShopdata).stores;

                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 19.0,
                          mainAxisSpacing: 17.0,
                          childAspectRatio: 4 / 3
                      ),
                      itemCount: data!.stores!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, FOE_ATTENDANCE_PAGE,
                                  arguments: {
                                    'shopId': data.stores![index].id,
                                  });
                            },
                            child: Container(
                              height: 75,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: const Color(0xFFEEEFEF))
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(data.stores![index].storename!,
                                        textAlign: TextAlign.center,
                                        style:  TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black.withOpacity(0.6)
                                        ),),
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset('assets/icons/path-square.svg'),
                                      const SizedBox(width: 4,),
                                      Text(data.stores![index].storedmscode!,style:TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black.withOpacity(0.4)
                                      ),),
                                    ],
                                  )
                                ],
                              ),
                            )
                        );
                      },
                    );
                  },
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
