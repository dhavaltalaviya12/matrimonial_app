import 'package:flutter/material.dart';
import 'package:my_matrimony_app/screens/user_list_screen.dart';
import 'about_us_screen.dart';
import 'add_edit_user_screen.dart';
import 'favourite_user_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.cyan,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 30),
              // Logo and App Name
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/img.png',
                    width: screenWidth * 0.5,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Main Content Card
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Welcome to\nShaadi.com',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Where every ❤️ discovers its ideal 🌍',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.cyan,
                        ),
                      ),
                      const SizedBox(height: 40),
                      // Grid of Options
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          children: [
                            dashBoardBtn(
                                icon: Icons.person_add,
                                btnName: 'Add Profile',
                                screen: AddEditUserScreen(),
                                alert: true),
                            dashBoardBtn(
                              icon: Icons.people,
                              btnName: 'View Profiles',
                              screen: const UserListScreen(),
                            ),
                            dashBoardBtn(
                              icon: Icons.favorite,
                              btnName: 'Favorites',
                              screen: const FavouriteUserScreen(),
                            ),
                            dashBoardBtn(
                              icon: Icons.info,
                              btnName: 'About Us',
                              screen: const AboutUsScreen(),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dashBoardBtn(
      {required String btnName,
        required IconData icon,
        required Widget screen,
        alert = false}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        padding: const EdgeInsets.all(10),
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => screen,
            ));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFFFFE8EF),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 32,
              color: Colors.blue,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            btnName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
