import 'package:flutter/material.dart';
import 'package:my_matrimony_app/screens/user_detail_screen.dart';
import '../utils/string_const.dart';
import '../utils/user_model.dart';
import 'add_edit_user_screen.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<dynamic> filteredUsers = [];
  TextEditingController searchController = TextEditingController();
  String _selectedSortOption = 'Name'; // Default sort option

  @override
  void initState() {
    super.initState();
    filteredUsers = UserModel.userList;
  }

  void _filterUsers(String query) {
    setState(() {
      filteredUsers = UserModel.userList
          .where((user) =>
              user[NAME].toLowerCase().contains(query.toLowerCase()) ||
              user[CITY].toLowerCase().contains(query.toLowerCase()) ||
              user[EMAIL].toLowerCase().contains(query.toLowerCase()) ||
              user[MOBILE].contains(query) ||
              user[AGE].contains(query))
          .toList();
    });
  }

  void _sortUsers(String sortOption) {
    setState(() {
      _selectedSortOption = sortOption;
      switch (sortOption) {
        case 'Name':
          filteredUsers.sort((a, b) => a[NAME].compareTo(b[NAME]));
          break;
        case 'Email':
          filteredUsers.sort((a, b) => a[EMAIL].compareTo(b[EMAIL]));
          break;
        case 'City':
          filteredUsers.sort((a, b) => a[CITY].compareTo(b[CITY]));
          break;
        case 'Phone':
          filteredUsers.sort((a, b) => a[MOBILE].compareTo(b[MOBILE]));
          break;
        case 'Age':
          filteredUsers
              .sort((a, b) => int.parse(a[AGE]).compareTo(int.parse(b[AGE])));
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(25), // Rounded corners at the bottom
            bottomRight: Radius.circular(25),
          ),
          child: AppBar(
            title: Row(
              children: [
                const Icon(
                  Icons.list_alt,
                  size: 30,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'User List',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.sort, color: Colors.white),
                  onSelected: (String value) {
                    _sortUsers(value); // Sort users based on selected option
                  },
                  itemBuilder: (BuildContext context) {
                    return ['Name', 'Email', 'City', 'Phone', 'Age']
                        .map((String option) {
                      return PopupMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList();
                  },
                ),
              ],
            ),
            backgroundColor: Colors.blueAccent, // Updated color
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: 'Search by name, city, age, email, phone...',
                prefixIcon: const Icon(Icons.search, color: Colors.redAccent),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.redAccent),
                ), // Added fill color for search bar
              ),
              onChanged: _filterUsers,
            ),
          ),
          Expanded(
            child: getUserListView(),
          ),
        ],
      ),
      backgroundColor: Color(0xFFFFE8EF),
    );
  }

  Widget getUserListView() {
    if (filteredUsers.isEmpty) {
      return const Center(
        child: Text(
          "No users found",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: filteredUsers.length,
      itemBuilder: (context, idx) {
        var user = filteredUsers[idx];
        return GestureDetector(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserDetailScreen(
                  id: UserModel.userList.indexOf(user),
                ),
              ),
            );
            setState(() {});
          },
          child: getCardView(user: user, idx: idx),
        );
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
      color: Colors.white,
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
                    icon: user[GENDER] == 'Male' ? Icons.male : Icons.female,
                    iconColor:
                        user[GENDER] == 'Male' ? Colors.blue : Colors.pink,
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
