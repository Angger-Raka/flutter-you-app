import 'package:flutter/material.dart';
import 'package:you_app/components/custom_textfield.dart';

class EditAbout extends StatelessWidget {
  const EditAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.only(
        left: 28,
        right: 8,
        top: 12,
        bottom: 12,
      ),
      decoration: BoxDecoration(
        color: Color(0xff0E191F),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'About',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Save & Update',
                  style: TextStyle(
                    color: Color(0xffFFC107),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xff162329),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Add image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          CustomTextField(
            labelText: 'Name',
            hintText: 'John Doe',
            controller: TextEditingController(),
          ),
          CustomTextField(
            labelText: 'Age',
            hintText: '18',
            controller: TextEditingController(),
          ),
          CustomTextField(
            labelText: 'Age',
            hintText: '18',
            controller: TextEditingController(),
          ),
        ],
      ),
    );
  }
}
