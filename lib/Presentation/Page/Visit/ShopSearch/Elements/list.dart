import 'dart:ui';
import 'package:flutter/material.dart';

import '../../../../../Data/Model/Store/Store.dart';


Widget buildHintsList(List<Store> stores) {
  //SearchFoodBloc searchBloc;
  return Container(
    child: Column(
      children: [
         ListView.builder(
            itemCount: stores.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 90,
                          width: 100,
                          child: Text(stores[index].storename.toString()),),
                      // SizedBox(height: 30),

                    ],
                  ),
                ),
              );
            }),
      ],
    ),
  );
}
