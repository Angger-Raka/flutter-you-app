import 'package:flutter/material.dart';
import 'package:you_app/components/custom_card.dart';
import 'package:you_app/components/edit_about.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff09141A),
      appBar: AppBar(
        leadingWidth: 100,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Text(
              'Back',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        centerTitle: true,
        title: const Text(
          '@johndoe',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 200,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xff162329),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: const Icon(Icons.edit_outlined),
                      onPressed: () {
                        Navigator.pushNamed(context, '/profile/edit');
                      },
                    ),
                  ),
                  const Spacer(),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        '@johndoe',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const EditAbout(),
            CustomCard(
              title: 'John Doe',
              subtitle: 'Add in your your to help others know you better',
              onEdit: () {
                // Navigator.pushNamed(context, '/profile/edit');
              },
            ),
            CustomCard(
              title: 'Interest',
              subtitle: 'Add in your interest to find a better match',
              onEdit: () {
                Navigator.pushNamed(context, '/interest');
              },
            ),
          ],
        ),
      ),
    );
  }
}
