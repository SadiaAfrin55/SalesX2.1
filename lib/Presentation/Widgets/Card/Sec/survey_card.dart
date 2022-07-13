import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salesx_new_project/Service/LocalDataBase/localdata.dart';
class SurveyCard extends StatefulWidget {
  final String? name;
  final String? secName;
  final String? time;
  const SurveyCard({
    this.name,
    this.secName,
    this.time,
    Key? key}) : super(key: key);

  @override
  State<SurveyCard> createState() => _SurveyCardState();
}

class _SurveyCardState extends State<SurveyCard> {
  String? name;

  //storage instance
  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      name = tokenx.get('name');
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 96,
      decoration: BoxDecoration(
          color:const Color(0xFFFCFCFC),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color:const Color(0xFFEEEFEF),width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor:const Color(0xFFCCE6FD),
                  child: Center(child: SvgPicture.asset('assets/icons/survey.svg',height: 28,color: Color(0xFF0180F5),),),
                ),
                const SizedBox(width: 8,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${widget.name}',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF232C2E)
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     SvgPicture.asset('assets/icons/user.svg',color: const Color(0xFFF2994A)),
                        //     const SizedBox(width: 5),
                        //     Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         const Text('Taken By:',
                        //           style: TextStyle(
                        //               fontSize: 11,
                        //               fontWeight: FontWeight.w500,
                        //               color: Color(0xFF8E9191)
                        //           ),
                        //         ),
                        //
                        //         Wrap(
                        //           children: [
                        //             Text(name??" ",
                        //               style: const TextStyle(
                        //                   fontSize: 11,
                        //                   fontWeight: FontWeight.w500,
                        //                   color: Color(0xFF8E9191)
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //         // Expanded(
                        //         //
                        //         //   child: Text(name??" ",
                        //         //     style: const TextStyle(
                        //         //         fontSize: 11,
                        //         //         fontWeight: FontWeight.w500,
                        //         //         color: Color(0xFF8E9191)
                        //         //     ),
                        //         //   ),
                        //         // ),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(horizontal: 10),
                        //   height: 12,
                        //   width: 1,
                        //   color: Color(0xFFD9D9D9),
                        // ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/time_icon.svg',color: Color(0xFFF2994A),),
                            SizedBox(width: 5),
                            Text('${widget.time}',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF8E9191)
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}