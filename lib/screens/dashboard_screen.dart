import 'package:flutter/material.dart';
import './add_edit_user_screen.dart';
import './user_list_screen.dart';
import './about_us_screen.dart';
import './favourite_user_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ' Matrimonial 👨‍👩‍👧‍👦',
          style: TextStyle(
            fontSize:25,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SizedBox(
        width: 500,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              dashBoardBtn(
                btnName: 'Add User',
                icon: Icons.person_add,
                iconColor: Colors.blue,
                screen:  AddEditUserScreen(),
              ),
              dashBoardBtn(
                btnName: 'User List',
                icon: Icons.list_alt,
                iconColor: Colors.purple,
                screen: const UserListScreen(),
              ),
              dashBoardBtn(
                btnName: 'Favourite',
                icon: Icons.favorite,
                iconColor: Colors.red,
                screen: const FavouriteUserScreen(),
              ),
              dashBoardBtn(
                btnName: 'About Us',
                icon: Icons.menu_book,
                iconColor: Colors.orange,
                screen: const AboutUsScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dashBoardBtn({
    required String btnName,
    required IconData icon,
    required Color iconColor,
    required Widget screen,
  }) {
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
        children: [
          Icon(
            icon,
            size: 50,
            color: iconColor,
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            btnName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}