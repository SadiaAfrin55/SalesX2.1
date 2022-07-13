
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Bloc/Sales/sales_cubit.dart';
import '../../../Widgets/Card/Sales/sale_details_card.dart';

class SeclistDetails extends StatefulWidget {
  final String? name;
  final String? personalemail;
  final String? officeemail;
  final String? phone;
  final String? area;
  final String? teritory;
  final String? rigion;
  const SeclistDetails({
    this.name,
    this.personalemail,
    this.officeemail,
    this.phone,
    this.area,
    this.teritory,
    this.rigion,
    Key? key}) : super(key: key);

  @override
  _SeclistDetailsState createState() => _SeclistDetailsState();
}

class _SeclistDetailsState extends State<SeclistDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title:  Text(widget.name!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              leading: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close_outlined, color: Colors.black, size: 27,),
                ),
              ),
              toolbarHeight: 60,
              elevation: 0.5,
            ),
            body: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.asset('assets/icons/profile_user.png')),
                    const SizedBox(height: 15),
                    Center(
                      child: Text(widget.area!,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF232C2E)
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),
                    const Divider(thickness: 1),
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(bottom: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Personal email',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(widget.personalemail!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 14.0),
                                child: const Divider(thickness: 1),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Office email',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(widget.officeemail!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 14.0),
                                child: const Divider(thickness: 1),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Phone',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(widget.phone!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 14.0),
                                child: const Divider(thickness: 1),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Area',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(widget.area!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 14.0),
                                child: const Divider(thickness: 1),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Territory',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(widget.teritory!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 14.0),
                                child: const Divider(thickness: 1),
                              ),
                            ],
                          ),
                          // Column(
                          //   children: [
                          //     Row(
                          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         const Text('Region',
                          //           style: TextStyle(
                          //             fontSize: 14,
                          //             fontWeight: FontWeight.w500,
                          //           ),
                          //         ),
                          //         Text(widget.area!,
                          //           style: const TextStyle(
                          //             fontSize: 14,
                          //             fontWeight: FontWeight.w500,
                          //           ),
                          //         ),
                          //
                          //       ],
                          //     ),
                          //     Container(
                          //       margin: const EdgeInsets.only(top: 14.0),
                          //       child: const Divider(thickness: 1),
                          //     ),
                          //   ],
                          // ),

                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
