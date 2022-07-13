import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SecSaleCard extends StatelessWidget {
  final String? name;
  final String? productName;
  final String? price;
  final String? linemanagername;
  final String? date;

  const SecSaleCard({
    this.name,
    this.productName,
    this.price,
    this.linemanagername,
    this.date,
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
                Image.asset('assets/icons/phone.png'),
                const SizedBox(width: 16,),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/user.svg',color: const Color(0xFFF2994A)),
                            const SizedBox(width: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text('Taken By :'+'$linemanagername',
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
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          height: 12,
                          width: 1,
                          color: Color(0xFFD9D9D9),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/time_icon.svg',color: Color(0xFFF2994A),),
                            SizedBox(width: 5),
                            Text('$date',
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
                    SizedBox(height: 4),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/taka.svg',color: Colors.lightBlue,),
                        SizedBox(width: 5),
                        Text('$price',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0180F5)
                          ),
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