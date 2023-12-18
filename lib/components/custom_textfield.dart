import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.labelText,
    required this.hintText,
    required this.controller,
    super.key,
  });

  final String labelText;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$labelText:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  gapPadding: 0,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
