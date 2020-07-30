import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          width: double.infinity,
          height: 130,
          color: Colors.black12,
        ),
      ),
    );
  }
}
