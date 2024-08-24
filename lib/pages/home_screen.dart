import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_4/components/custom_drawer.dart';
import 'package:project_4/components/items.dart';
import 'package:project_4/components/permission_geolocator.dart';
import 'package:project_4/components/shimmer_and_animation.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late bool isLoadingg = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  String xLocation = '';
  String yLocation = '';

  @override
  void initState() {
    super.initState();
    determinePosition();
    getLocation();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoadingg = true;
      });
      _controller.forward();
    });
  }

  getLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    xLocation = position.latitude.toString();
    yLocation = position.longitude.toString();
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          backgroundColor: const Color(0xffD6EFD8),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Badge(child: FaIcon(FontAwesomeIcons.bell)))
          ],
        ),
        backgroundColor: const Color(0xfff8f8f8),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 295,
                      constraints: const BoxConstraints(maxHeight: 34),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 2,
                                color: Colors.black26,
                                offset: Offset(0, 4))
                          ]),
                      child: const TextField(
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.search,
                              size: 24,
                            ),
                            hintText: "Search",
                            border: InputBorder.none,
                            filled: true,
                            isDense: true,
                            fillColor: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const FaIcon(
                      FontAwesomeIcons.sliders,
                      color: Color(0xff5A5A5A),
                    )
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    const Icon(Icons.arrow_drop_down_rounded),
                    Text(
                      "My location $xLocation,$yLocation",
                      style: TextStyle(color: Colors.black54),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Categories",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedItemWidget(
                        imagePath: "assets/Ellipse 1.png", label: "Vegetables"),
                    AnimatedItemWidget(
                        imagePath: "assets/Ellipse 2.png", label: "Fruits"),
                    AnimatedItemWidget(
                        imagePath: "assets/Ellipse 3.png", label: "Meat"),
                    AnimatedItemWidget(
                        imagePath: "assets/Ellipse 4.png", label: "Fish"),
                    AnimatedItemWidget(
                        imagePath: "assets/Ellipse 5.png", label: "Beverages"),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                isLoadingg
                    ? ScaleTransition(
                        scale: _animation,
                        child: Container(
                          height: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "assets/Rectangle 1.png",
                                  width: 360,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 14),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Up to 20% OFF",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Seasonal Grocery Shopping \nFresh and Flavorful Items \nto Buy Now",
                                        style: TextStyle(
                                            fontSize: 12.5,
                                            color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        height: 36,
                                        width: 76,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: Colors.white),
                                        child: Center(
                                          child: TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                "Buy Now",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : Shimmer(
                        duration: const Duration(seconds: 1),
                        color: Colors.grey.shade300,
                        child: Container(
                          width: 360,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x33000000),
                                blurRadius: 20,
                                offset: Offset(0, -1),
                                spreadRadius: 1,
                              )
                            ],
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xffFFFFFF),
                                Color.fromARGB(255, 182, 182, 182)
                              ],
                            ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Popular Product",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "See all",
                          style: TextStyle(fontSize: 12, color: Colors.blue),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProductCard(
                      imagePath: "assets/Tomato 1.png",
                      title: "Tomato",
                      quantity: "1 KG",
                      price: "SAR 4.60",
                      isLoading: !isLoadingg,
                    ),
                    ProductCard(
                      imagePath: "assets/GABBAGE 1.png",
                      title: "Gabbage",
                      quantity: "1 KG",
                      price: "SAR 5.50",
                      isLoading: !isLoadingg,
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProductCard(
                      imagePath: "assets/Red Tomato 1.png",
                      title: "Green Tomato",
                      quantity: "1 KG",
                      price: "SAR 7.20",
                      isLoading: !isLoadingg,
                    ),
                    ProductCard(
                      imagePath: "assets/Stew Beef Meat.png",
                      title: "Fresh Red Meat",
                      quantity: "1 KG",
                      price: "SAR 25.19",
                      isLoading: !isLoadingg,
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
