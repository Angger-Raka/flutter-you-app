import 'package:flutter/material.dart';

class InterestPage extends StatefulWidget {
  const InterestPage({super.key});

  @override
  State<InterestPage> createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  List<String> _interests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xff1F4247),
                  Color(0xff0D1D23),
                ],
              ),
            ),
          ),
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              leadingWidth: 100,
              actions: [
                TextButton(
                  onPressed: () {},
                  // child: Text(
                  //   'Save',
                  //   style: TextStyle(
                  //     color: Colors.blue,
                  //     fontSize: 18,
                  //   ),
                  // ),
                  child: GradientText(
                    'Save',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromARGB(255, 185, 233, 255),
                        Colors.blue,
                        Color.fromARGB(255, 185, 233, 255),
                      ],
                    ),
                  ),
                )
              ],
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height - 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GradientText(
                        'Tell everyone about yourself',
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color.fromARGB(255, 255, 242, 175),
                            Color(0xffFFB800),
                            Color.fromARGB(255, 255, 242, 175),
                            Color(0xffFFB800),
                            Color.fromARGB(255, 255, 242, 175),
                          ],
                        ),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'What interest you?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color.fromARGB(255, 26, 55, 59),
                                Color(0xff1F4247),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Wrap(
                            children: [
                              ..._interests.map(
                                (e) => Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Chip(
                                    label: Text(
                                      e,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    backgroundColor:
                                        Color(0xff1F4247).withOpacity(0.5),
                                    deleteIcon: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    onDeleted: () {
                                      setState(() {
                                        _interests.remove(e);
                                      });
                                    },
                                  ),
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  contentPadding: const EdgeInsets.all(15),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Colors.transparent,
                                ),
                                onSubmitted: (value) {
                                  setState(() {
                                    _interests.add(value);
                                  });
                                },
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
