import 'package:flutter/material.dart';
import 'package:goodmorning/modules/task1/Collection.dart'; // Importing the Collection page
import 'package:goodmorning/modules/task1/custom_drawer.dart'; // Importing the Custom Drawer
import 'package:goodmorning/modules/task1/myprofile.dart'; // Importing the MyProfile page

// Creating a Stateful Widget for HomeScreen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key}); // Constructor with a key

  @override
  _HomeScreenState createState() =>
      _HomeScreenState(); // Creating state instance
}

// State class for HomeScreen
class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex =
      0; // Variable to track the selected index of BottomNavigationBar

  // List of colors for gradient background
  final List<Color> _gradientColors = [
    const Color.fromARGB(255, 66, 3, 176), // Dark blue color
    const Color.fromARGB(46, 17, 2, 77), // Lighter blue color
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daraz'), // AppBar title
        centerTitle: true, // Centering the title
        backgroundColor: Colors.blue, // Setting AppBar color
        leading: IconButton(
          icon: const Icon(Icons.home), // Home icon on the left
          onPressed: () {
            // Navigate to home (functionality not implemented)
          },
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/myphoto.jpg'), // Profile image
              radius: 15,
            ),
            onPressed: () {
              // Navigating to MyProfile page when clicking the profile image
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Myprofile(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: const CustomDrawer(), // Adding a drawer menu
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _gradientColors, // Applying gradient colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0), // Adding top padding
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Aligning children to start
            children: [
              // Row containing category cards
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround, // Even spacing
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCategoryCard(
                      context, 'Shoes', 'assets/images/shoes.jpg'),
                  _buildCategoryCard(
                      context, 'Watches', 'assets/images/watches.jpg'),
                  _buildCategoryCard(context, 'Bags', 'assets/images/bag.jpg'),
                  _buildCategoryCard(
                      context, 'Mobiles', 'assets/images/mobiles.jpg'),
                  _buildCategoryCard(
                      context, 'Laptops', 'assets/images/laptops.jpg'),
                  _buildCategoryCard(
                      context, 'Clothes', 'assets/images/clothes.jpg'),
                ],
              ),
              const SizedBox(height: 20), // Adding spacing

              // Centered containers with images and text
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // First row with two containers
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildCustomContainer(), // First container
                        const SizedBox(width: 16), // Spacing between containers
                        _buildCustomContainer(), // Second container
                      ],
                    ),
                    const SizedBox(height: 16), // Spacing between rows

                    // Second row with two containers
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildCustomContainer(), // Third container
                        const SizedBox(width: 16), // Spacing between containers
                        _buildCustomContainer(), // Fourth container
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:
                _gradientColors, // Applying gradient colors to BottomNavigationBar
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent, // Transparent background
          elevation: 10, // Adding shadow effect
          currentIndex: _currentIndex, // Tracking the selected index
          selectedItemColor: Colors.yellowAccent, // Highlighted icon color
          unselectedItemColor: Colors.white, // Default icon color
          selectedFontSize: 16, // Selected label size
          unselectedFontSize: 14, // Unselected label size
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Updating selected index on tap
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      ),
    );
  }

  // Function to create a category card
  static Widget _buildCategoryCard(
      BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Navigate to CollectionPage when tapping the category
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CollectionPage()),
        );
      },
      child: Container(
        width: 110,
        height: 110,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue.shade100, // Background color
          borderRadius: BorderRadius.circular(10), // Rounded corners
          boxShadow: const [
            BoxShadow(
              color: Colors.black26, // Shadow color
              blurRadius: 4,
              offset: Offset(0, 2), // Shadow position
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath, // Displaying category image
              width: 70,
              height: 50,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8), // Spacing between image and text
            Text(
              title, // Displaying category name
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build a container with image and text
  Widget _buildCustomContainer() {
    return Container(
      width: 200,
      height: 205,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 2, 41, 73),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/example1.jpg',
              width: 180, height: 160, fit: BoxFit.cover),
          const SizedBox(height: 8),
          const Text('Alpha Go  Price:2300 BDT',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 243, 33, 152))),
        ],
      ),
    );
  }
}
