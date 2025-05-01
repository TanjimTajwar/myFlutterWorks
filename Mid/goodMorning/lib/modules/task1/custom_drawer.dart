import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 243, 156, 33),
            ),
            child: Row(
              children: [
                // CircleAvatar for Profile Picture
                CircleAvatar(
                  radius: 40, // Adjusted radius for the image
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      "Athoy.jpg",
                      fit: BoxFit.cover,
                      width: 80, // Ensure this is wide enough
                      height: 80,
                    ),
                  ),
                ),
                const SizedBox(width: 15), // Space between image and text
                // Text Section
                const Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tanjim Tajwar Arnab",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Arnab.csecu@gmail.com",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Drawer Menu Items
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
