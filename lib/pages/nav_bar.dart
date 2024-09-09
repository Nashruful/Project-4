import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:project_4/pages/home_screen.dart';
import 'package:project_4/pages/about_us.dart';
import 'package:project_4/pages/items_screen.dart';
import 'package:project_4/pages/login_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _page = 0;
  List<Widget> pages = const [HomePage(), ItemsPage(), AboutUs(), LoginPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0xffD6EFD8),
        bottomNavigationBar: Material(
          elevation: 10,
          child: CurvedNavigationBar(
            index: _page,
            items: <Widget>[
              _buildNavItem(Icons.home, 0),
              _buildNavItem(Icons.shopping_cart, 1),
              _buildNavItem(Icons.info, 2),
              _buildNavItem(Icons.person, 3),
            ],
            color: Colors.white,
            buttonBackgroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 300),
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
            letIndexChange: (index) => true,
          ),
        ),
        body: pages[_page]);
  }

  Widget _buildNavItem(IconData icon, int index) {
    final isSelected = _page == index;
    final iconColor = isSelected ? Colors.blueAccent : Colors.black87;
    final double scaleFactor = isSelected ? 1.2 : 1.0;

    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 1.0, end: scaleFactor),
      duration: const Duration(milliseconds: 300),
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.transparent,
              shape: BoxShape.circle,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ]
                  : [],
            ),
            child: Icon(icon, size: 30, color: iconColor),
          ),
        );
      },
    );
  }
}
