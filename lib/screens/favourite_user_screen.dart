import 'package:flutter/material.dart';
import './user_detail_screen.dart';
import '../utils/string_const.dart';
import '../utils/user_model.dart';
import 'add_edit_user_screen.dart';

class FavouriteUserScreen extends StatefulWidget {
  const FavouriteUserScreen({super.key});

  @override
  State<FavouriteUserScreen> createState() => _FavoriteUserScreenState();
}

class _FavoriteUserScreenState extends State<FavouriteUserScreen> {
  late List favoriteUsers;

  @override
  void initState() {
    super.initState();
    _updateFavoriteUsers();
  }

  void _updateFavoriteUsers() {
    setState(() {
      favoriteUsers =
          UserModel.userList.where((user) => user[ISFAVORITE] == true).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          child: AppBar(
            title: Row(
              children: [
                const Icon(Icons.favorite, size: 25, color: Colors.pink),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Favourite Users',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.blue,
            elevation: 0,
          ),
        ),
      ),
      body: getFavoriteListView(),
      backgroundColor: const Color(0xFFFFE8EF),
    );
  }

  Widget getFavoriteListView() {
    if (favoriteUsers.isEmpty) {
      return const Center(
        child: Text(
          "No favorite users found",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: favoriteUsers.length,
      itemBuilder: (context, idx) {
        if (idx >= favoriteUsers.length)
          return const SizedBox(); // Prevent index error

        var user = favoriteUsers[idx];

        return GestureDetector(
          onTap: () async {
            int originalIndex = UserModel.userList.indexOf(user);
            if (originalIndex == -1) return; // Prevents RangeError

            await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserDetailScreen(id: originalIndex)),
            );
            _updateFavoriteUsers();
          },
          child: getCardView(user),
        );
      },
    );
  }

  Widget getCardView(user) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  rowOfCard(
                      icon: Icons.person,
                      iconColor: Colors.blue,
                      field: NAME,
                      data: user[NAME]),
                  rowOfCard(
                      icon: Icons.location_city,
                      iconColor: Colors.orangeAccent,
                      field: CITY,
                      data: user[CITY]),
                  rowOfCard(
                      icon: Icons.mail,
                      iconColor: Colors.green,
                      field: EMAIL,
                      data: user[EMAIL]),
                  rowOfCard(
                      icon: Icons.phone_android,
                      iconColor: Colors.black,
                      field: MOBILE,
                      data: user[MOBILE]),
                  rowOfCard(
                    icon: user[GENDER] == 'Male' ? Icons.male : Icons.female,
                    iconColor:
                        user[GENDER] == 'Male' ? Colors.blue : Colors.pink,
                    field: GENDER,
                    data: user[GENDER],
                  ),
                  rowOfCard(
                      icon: Icons.emoji_emotions_rounded,
                      iconColor: Colors.green,
                      field: AGE,
                      data: user[AGE]),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      user[ISFAVORITE] = !user[ISFAVORITE];
                      _updateFavoriteUsers();
                    });
                  },
                  icon: Icon(
                    user[ISFAVORITE] ? Icons.favorite : Icons.favorite_border,
                    color: user[ISFAVORITE] ? Colors.red : Colors.grey,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    int originalIndex = UserModel.userList.indexOf(user);
                    if (originalIndex == -1) return;

                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AddEditUserScreen(id: originalIndex)),
                    );
                    _updateFavoriteUsers();
                  },
                  icon: const Icon(Icons.edit, color: Colors.blue, size: 30),
                ),
                IconButton(
                  onPressed: () {
                    showDeleteConfirmationDialog(context, user);
                  },
                  icon: const Icon(Icons.delete, color: Colors.red, size: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget rowOfCard({
    required IconData icon,
    required Color iconColor,
    required String field,
    required String? data,
  }) {
    return Row(
      children: [
        Icon(icon, size: 30, color: iconColor),
        const SizedBox(width: 10),
        Text(
          '$field: ',
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            data ?? 'null',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
      ],
    );
  }

  void showDeleteConfirmationDialog(BuildContext context, user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete User'),
          content: const Text('Are you sure you want to delete this user?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
              onPressed: () {
                setState(() {
                  if (UserModel.userList.contains(user)) {
                    UserModel.userList.remove(user);
                    _updateFavoriteUsers();
                  }
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
