
import 'package:flutter/material.dart';
class DetailsInfo extends StatelessWidget {
  final String? name;
  final String? mobile;
  final String? age;
  final String? email;
  final String? interesin;
  final String? minbudget;
  final String? maxbudget;
  final String? currentPhone;
  const DetailsInfo({
    this.name,
    this.mobile,
    this.age,
    this.email,
    this.interesin,
    this.minbudget,
    this.maxbudget,
    this.currentPhone,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Name :',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text('$name',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: Divider(thickness: 1),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Mobile : ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text('$mobile',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 14.0),
                child: Divider(thickness: 1),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Age :',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text('$age',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 14.0),
                child: Divider(thickness: 1),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Email :',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text('$email',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 14.0),
                child: Divider(thickness: 1),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Interested in :',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text('$interesin',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 14.0),
                child: Divider(thickness: 1),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Minimum Budget :',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text('$minbudget',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 14.0),
                child: Divider(thickness: 1),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Maximum Budget :',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text('$maxbudget',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 14.0),
                child: Divider(thickness: 1),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Current Used Phone :',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text('$currentPhone',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 14.0),
                child: Divider(thickness: 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
