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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(
              Icons.favorite,
              size: 25,
              color: Colors.pink,
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'Favourite Users',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: getFavoriteListView(),
    );
  }

  Widget getFavoriteListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: UserModel.userList.length,
      itemBuilder: (context, idx) {
        var user = UserModel.userList[idx];
        if (user[ISFAVORITE]) {
          return GestureDetector(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailScreen(id: idx),
                ),
              );
              setState(() {});
            },
            child: getCardView(user: user, idx: idx),
          );
        }
        return const SizedBox.shrink(); // Returns empty widget if not a favorite user
      },
    );
  }

  Widget getCardView({required user, required idx}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
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
                    data: user[NAME],
                  ),
                  const SizedBox(height: 10),
                  rowOfCard(
                    icon: Icons.location_city,
                    iconColor: Colors.orangeAccent,
                    field: CITY,
                    data: user[CITY],
                  ),
                  const SizedBox(height: 10),
                  rowOfCard(
                    icon: Icons.mail,
                    iconColor: Colors.green,
                    field: EMAIL,
                    data: user[EMAIL],
                  ),
                  const SizedBox(height: 10),
                  rowOfCard(
                    icon: Icons.phone_android,
                    iconColor: Colors.black,
                    field: MOBILE,
                    data: user[MOBILE],
                  ),
                  const SizedBox(height: 10),
                  rowOfCard(
                    icon: user[GENDER] == 'male' ? Icons.male : Icons.female,
                    iconColor: user[GENDER] == 'male' ? Colors.blue : Colors.pink,
                    field: GENDER,
                    data: user[GENDER],
                  ),
                  const SizedBox(height: 10),
                  rowOfCard(
                    icon: Icons.emoji_emotions_rounded,
                    iconColor: Colors.green,
                    field: AGE,
                    data: user[AGE],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    user[ISFAVORITE] = !user[ISFAVORITE];
                    setState(() {});
                  },
                  icon: Icon(
                    user[ISFAVORITE] ? Icons.favorite : Icons.favorite_border,
                    color: user[ISFAVORITE] ? Colors.red : Colors.grey,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddEditUserScreen(id: idx),
                      ),
                    );
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDeleteConfirmationDialog(context, idx);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget rowOfCard({
    required IconData icon,
    required Color iconColor,
    required field,
    required data,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 30,
          color: iconColor,
        ),
        const SizedBox(width: 10),
        Text(
          field + ': ',
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w600, // Added boldness for emphasis
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            data ?? 'null',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  void showDeleteConfirmationDialog(BuildContext context, int idx) {
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
                  UserModel.userList.removeAt(idx); // Delete user
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
