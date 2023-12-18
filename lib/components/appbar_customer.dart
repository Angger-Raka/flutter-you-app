import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 12,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Text(
            'Back',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Inter',
              fontSize: 12.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
