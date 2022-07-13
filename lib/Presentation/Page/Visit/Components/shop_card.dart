
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ShopCard extends StatelessWidget {
  final String? name;
  final String? shopname;
  const ShopCard({Key? key,this.name,this.shopname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      height: 82,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFEEEFEF))
        //border: Border.all(color: Colors.black)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$name',style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
              color: const Color(0xFF232C2E)
          ),),
          const SizedBox(height: 6,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/path-square.svg'),
              const SizedBox(width: 6,),
              Text('$shopname',style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF232C2E)
              ),),
            ],
          ),
        ],
      ),
    );
  }
}
