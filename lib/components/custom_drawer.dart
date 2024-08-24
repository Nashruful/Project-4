import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff508D4E),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(
                    FontAwesomeIcons.user,
                    size: 40,
                    color: Color(0xff508D4E),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Aziiz',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'azooz.n40@hotmail.com',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(icon: FontAwesomeIcons.house, text: 'Home'),
                _buildDrawerItem(
                    icon: FontAwesomeIcons.cartShopping, text: 'Shop'),
                _buildDrawerItem(
                    icon: FontAwesomeIcons.heart, text: 'Favorites'),
                _buildDrawerItem(
                    icon: FontAwesomeIcons.solidBell, text: 'Notifications'),
                _buildDrawerItem(icon: FontAwesomeIcons.gear, text: 'Settings'),
                _buildDrawerItem(
                    icon: FontAwesomeIcons.circleQuestion,
                    text: 'Help & Support'),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(
                FontAwesomeIcons.rightFromBracket,
                color: Color(0xff508D4E),
              ),
              title: const Text(
                'Logout',
                style: TextStyle(fontSize: 16, color: Color(0xff508D4E)),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({required IconData icon, required String text}) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xff508D4E)),
      title: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Color(0xff508D4E)),
      ),
      onTap: () {},
    );
  }
}
