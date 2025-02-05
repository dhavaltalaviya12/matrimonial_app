import './string_const.dart';

class UserModel {
  static List<Map<String, dynamic>> userList = [
    {
      NAME: 'Prof. Mehul Bhundiya',
      EMAIL: 'mehul@du.ac.in',
      PASSWORD: 'Mehul@123',
      MOBILE: '9428231065',
      DOB: '1-12-2000',
      AGE: '25',
      CITY: 'Rajkot',
      GENDER: 'male',
      HOBBIES: [
        ['Reading 📖', true],
        ['Traveling 🚞', true],
        ['Dancing 🕺', true],
        ['Cooking 🧑‍🍳', true],
      ],
      ISFAVORITE: true,
    },
    {
      NAME: 'Dhaval',
      EMAIL: 'dhaval123@gmail.com',
      PASSWORD: 'Dhvl@123',
      MOBILE: '1234567890',
      DOB: '1-12-2005',
      AGE: '20',
      CITY: 'Rajkot',
      GENDER: 'male',
      HOBBIES: [
        ['Reading 📖', true],
        ['Traveling 🚞', false],
        ['Dancing 🕺', false],
        ['Cooking 🧑‍🍳', false],
      ],
      ISFAVORITE: true,
    },
  ];

  static void addUser({
    required String name,
    required String email,
    required String password,
    required String mobile,
    required String dob,
    required String age,
    required String city,
    required String gender,
    required List<List> hobbies,
    bool isFavorite = false,
  }) {
    Map<String, dynamic> user = {};
    user[NAME] = name;
    user[EMAIL] = email;
    user[PASSWORD] = password;
    user[MOBILE] = mobile;
    user[DOB] = dob;
    user[AGE] = age;
    user[CITY] = city;
    user[GENDER] = gender;
    user[HOBBIES] = hobbies.map((hobby) => List.from(hobby)).toList();
    user[ISFAVORITE] = isFavorite;
    userList.add(user);
  }

  static List<Map<String, dynamic>> getUserList() {
    return userList;
  }

  static Map<String, dynamic> getUser({required id}) {
    return userList[id];
  }

  static void updateUser({
    required int id,
    required String name,
    required String email,
    required String password,
    required String mobile,
    required String dob,
    required String age,
    required String city,
    required String gender,
    required List<List> hobbies,
    bool isFavorite = false,
  }) {
    Map<String, dynamic> user = {};
    user[NAME] = name;
    user[EMAIL] = email;
    user[PASSWORD] = password;
    user[MOBILE] = mobile;
    user[DOB] = dob;
    user[AGE] = age;
    user[CITY] = city;
    user[GENDER] = gender;
    user[HOBBIES] = hobbies.map((hobby) => List.from(hobby)).toList();
    user[ISFAVORITE] = isFavorite;
    userList[id] = user;
  }

  static void removeUser({required id}) {
    //region removeUser
    userList.removeAt(id);
    //endregion
  }
}
