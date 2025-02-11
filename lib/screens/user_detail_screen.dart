import 'package:flutter/material.dart';
import '../utils/string_const.dart';
import '../utils/user_model.dart';
import 'add_edit_user_screen.dart';

class UserDetailScreen extends StatefulWidget {
  final int id;
  UserDetailScreen({super.key, required this.id});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> user = UserModel.getUser(id: widget.id);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(
              Icons.person,
              size: 25,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'User Details',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: user[GENDER] == 'male'
                            ? Colors.blueAccent
                            : Colors.pinkAccent,
                        child: Icon(
                          user[GENDER] == 'male' ? Icons.male : Icons.female,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        user[NAME],
                        style: const TextStyle(
                          fontSize: 25,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 15),
                      rowOfCard(
                        icon: Icons.person,
                        iconColor: Colors.blue,
                        field: NAME,
                        data: user[NAME],
                      ),
                      const SizedBox(height: 12),
                      rowOfCard(
                        icon: Icons.location_city,
                        iconColor: Colors.orangeAccent,
                        field: CITY,
                        data: user[CITY],
                      ),
                      const SizedBox(height: 12),
                      rowOfCard(
                        icon: Icons.mail,
                        iconColor: Colors.red,
                        field: EMAIL,
                        data: user[EMAIL],
                      ),
                      const SizedBox(height: 12),
                      rowOfCard(
                        icon: Icons.phone_android,
                        iconColor: Colors.black,
                        field: MOBILE,
                        data: user[MOBILE],
                      ),
                      const SizedBox(height: 12),
                      rowOfCard(
                        icon: user[GENDER] == 'male' ? Icons.male : Icons.female,
                        iconColor: user[GENDER] == 'male' ? Colors.blue : Colors.pink,
                        field: GENDER,
                        data: user[GENDER],
                      ),
                      const SizedBox(height: 12),
                      rowOfCard(
                        icon: Icons.emoji_emotions_rounded,
                        iconColor: Colors.green,
                        field: AGE,
                        data: user[AGE],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.emoji_objects_outlined,
                            size: 25,
                            color: Colors.brown,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Hobbies: ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 5),
                          getHobbies(hobbies: user[HOBBIES],),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddEditUserScreen(id: widget.id),
                        ),
                      );
                      setState(() {});
                    },
                    icon: const Icon(Icons.edit, color: Colors.white),
                    label: const Text(
                      'Edit',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                    ),
                    onPressed: () {
                      showDeleteConfirmationDialog(context, widget.id);
                    },
                    icon: const Icon(Icons.delete, color: Colors.white),
                    label: const Text(
                      'Delete',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
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

  Widget getHobbies({required List<dynamic> hobbies}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        checkHobby(hobbies[0]),
        checkHobby(hobbies[1]),
        checkHobby(hobbies[2]),
        checkHobby(hobbies[3]),
      ],
    );
  }

  Widget checkHobby(dynamic hobby) {
    if (hobby[1]) {
      return Text(
        hobby[0],
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      );
    }
    return const SizedBox(
      height: 0,
    );
  }
}
