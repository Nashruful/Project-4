import 'package:flutter/material.dart';
import 'package:project_4/components/custom_drawer.dart';
import 'package:project_4/components/custom_painter.dart';
import 'package:project_4/components/customer_painter_two.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xffA2CA71),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 250,
              constraints: const BoxConstraints(maxHeight: 250),
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.35,
                    child: Image.asset(
                      "assets/vegetables background.png",
                      width: 440,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Center(
                      child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 159.0),
                        child: Text(
                          "About Us",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 40,
                              color: Color(0xffB3A398),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 105, left: 10),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed purus mauris, ornare et arcu sed, placerat tincidunt orci. Sed ac justo lobortis, placerat erat id, suscipit ipsum.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffB3A398),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 150.0),
                        child: TextButton(
                            onPressed: () {},
                            child: Container(
                              height: 40,
                              width: 135,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xff387F39)),
                              child: const Center(
                                  child: Text(
                                "Show more",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                            )),
                      )
                    ],
                  ))
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Vegetables application",
              style: TextStyle(
                  color: Color(0xffBEDC74),
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomPaint(
              size: const Size(284, 40),
              painter: RPSCustomPainterTwo(),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomPaint(
              size: const Size(20, 20),
              painter: RPSCustomPainter(),
            )
          ],
        ),
      ),
    );
  }
}
