import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SurveyCard extends StatelessWidget {
  final String? name;
  final String? secName;
  final String? time;
  const SurveyCard({
    this.name,
    this.secName,
    this.time,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 96,
      decoration: BoxDecoration(
          color:Color(0xFFFCFCFC),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color:Color(0xFFEEEFEF),width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor:Color(0xFFCCE6FD),
                  child: Center(child: SvgPicture.asset('assets/icons/survey.svg',height: 28,color: Color(0xFF0180F5),),),
                ),
                const SizedBox(width: 8,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$name',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF232C2E)
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/user.svg',color: Color(0xFFF2994A)),
                            SizedBox(width: 5),
                            Text('$secName',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF8E9191)
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 12,
                          width: 1,
                          color: Color(0xFFD9D9D9),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/time_icon.svg',color: Color(0xFFF2994A),),
                            SizedBox(width: 5),
                            Text('$time',
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