import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_4/components/custom_drawer.dart';
import 'package:project_4/components/items.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage>
    with SingleTickerProviderStateMixin {
  late bool isLoadingg = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(_handleTabSelection);
    Future.delayed(const Duration(seconds: 2), () {
      isLoadingg = true;
      setState(() {});
    });
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD6EFD8),
      appBar: AppBar(
        backgroundColor: Color(0xffD6EFD8),
        toolbarHeight: 28,
      ),
      drawer: const CustomDrawer(),
      body: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
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
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search, size: 24),
                        hintText: "Search",
                        border: InputBorder.none,
                        filled: true,
                        isDense: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const FaIcon(
                    FontAwesomeIcons.sliders,
                    color: Color(0xff5A5A5A),
                  ),
                ],
              ),
            ),
            TabBar(
              dividerColor: Colors.transparent,
              controller: _tabController,
              unselectedLabelStyle: const TextStyle(color: Color(0xff6a6868)),
              indicator: const BoxDecoration(
                color: Colors.transparent,
              ),
              labelPadding: EdgeInsets.zero,
              tabs: List.generate(5, (index) => _buildTab(index)),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    children: [
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
                        height: 6,
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
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ProductCard(
                            imagePath: "assets/Cauliflower 1.png",
                            title: "Cauliflower",
                            quantity: "1 KG",
                            price: "SAR 4.60",
                            isLoading: !isLoadingg,
                          ),
                          ProductCard(
                            imagePath: "assets/broccoli 1.png",
                            title: "broccoli",
                            quantity: "1 KG",
                            price: "SAR 5.50",
                            isLoading: !isLoadingg,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 6,
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
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ProductCard(
                            imagePath: "assets/Tomato 1.png",
                            title: "Gabbage",
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
                        height: 6,
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
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ProductCard(
                            imagePath: "assets/Tomato 1.png",
                            title: "Gabbage",
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
                        height: 6,
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
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ProductCard(
                            imagePath: "assets/Tomato 1.png",
                            title: "Gabbage",
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
                        height: 6,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(int index) {
    final bool isSelected = _tabController.index == index;

    return Container(
      height: 33,
      width: 64,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xff80AF81) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          ["Vegetables", "Fruits", "Meat", "Fish", "Beverages"][index],
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
