import 'dart:math';

import 'package:flutter/material.dart';

class InventoryModelCard extends StatelessWidget {

  final String? name;
  final String? price;
  final String? category;
  const InventoryModelCard({Key? key, this.name, this.price,this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 159,
              height: 118,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xFFF7F8F8)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const SizedBox(height: 22,),
                  Text('$name',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('$price',
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF0180F5)
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text('$category',
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF8E9191)
                    ),
                  ),


                ],
              ),
            ),
            // Positioned(
            //     top: -40,
            //     child: Image.asset('assets/icons/tv.png',height: 64,)),

          ],
        ),

      ],
    );

  }
}
