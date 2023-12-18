import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    this.title = '',
    this.subtitle = '',
    required this.onEdit,
    super.key,
  });

  String title;
  String subtitle;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 140,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              IconButton(
                icon: const Icon(Icons.edit_outlined),
                onPressed: onEdit,
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
