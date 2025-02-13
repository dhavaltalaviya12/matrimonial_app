import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/string_const.dart';
import '../utils/user_model.dart';
import 'package:intl/intl.dart';

class AddEditUserScreen extends StatefulWidget {
  int? id;
  AddEditUserScreen({super.key, this.id});

  @override
  State<AddEditUserScreen> createState() => _AddEditUserScreenState();
}

class _AddEditUserScreenState extends State<AddEditUserScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  List<String> citiesList = [
    'Rajkot',
    'Surat',
    'Ahmedabad',
    'Vadodara',
    'Gandhinagar',
    'Jamnagar',
  ];

  bool favoriteController = false;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  String? _selectCity = 'Select City';
  int age = 18;
  String genderController = 'Male';
  List<List> hobbiesController = [
    ['Reading', false],
    ['Traveling', false],
    ['Dancing', false],
    ['Cooking', false],
  ];
  bool isHide = true;
  bool isHid = true;

  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      Map<String, dynamic> user = UserModel.userList[widget.id!];
      favoriteController = user[ISFAVORITE];
      fullNameController.text = user[NAME];
      emailController.text = user[EMAIL];
      passwordController.text = user[PASSWORD];
      confirmPasswordController.text = user[PASSWORD];
      mobileController.text = user[MOBILE];
      dateController.text = user[DOB];
      if (citiesList.contains(user[CITY])) {
        _selectCity = user[CITY];
      } else {
        _selectCity = null;
      }
      genderController = user[GENDER];
      hobbiesController = user[HOBBIES];
    } else {
      _selectCity = null;
    }
  }

  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), // Custom height
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(25), // Rounded corners at the bottom
            bottomRight: Radius.circular(25),
          ),
          child: AppBar(
            title: Row(
              children: [
                Icon(
                  widget.id != null ? Icons.edit : Icons.person,
                  size: 25,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    widget.id != null ? 'Edit User' : 'Add User',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.blue,
            elevation: 5, // Adds a subtle shadow effect
            shadowColor: Colors.black38,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20,left: 5,right: 5,bottom: 5),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: fullNameController,
                  textCapitalization: TextCapitalization.words,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: '😇 Full Name',
                    hintText: 'Enter Full Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      String capitalizedValue =
                          value[0].toUpperCase() + value.substring(1);
                      if (capitalizedValue != value) {
                        fullNameController.value = TextEditingValue(
                          text: capitalizedValue,
                          selection: TextSelection.collapsed(
                              offset: capitalizedValue.length),
                        );
                      }
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter valid name (3-50 characters, alphabets only)';
                    }
                    var regex = RegExp(r"^[A-Z][a-zA-Z\s'-]{2,49}$");
                    if (!regex.hasMatch(value)) {
                      return 'Enter a valid full name \n (3-50 characters, alphabets only, first letter is capital)';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                getFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  labelText: '📧 Email Address',
                  hintText: 'Enter your Email',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r"^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"))
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a valid email address';
                    }
                    var regex =
                        RegExp(r"^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$");
                    if (!regex.hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                getFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  labelText: '🗝️ Password',
                  hintText: 'Enter your password',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(
                        r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$"))
                  ],
                  obscureText: isHide,
                  suffixIcon: IconButton(
                    icon: Icon(
                        isHide ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isHide = !isHide;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Password';
                    }
                    var regex = RegExp(
                        r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");
                    if (!regex.hasMatch(value)) {
                      return 'Set strong Password :\n Minimum 8 characters\nat least contains 1\n uppercase letter,\n lowercase letter,\n digit,\n special character';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                getFormField(
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isHid,
                  labelText: '🔐 Confirm Password',
                  hintText: 'Enter your password again',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(
                        r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$"))
                  ],
                  suffixIcon: IconButton(
                    icon:
                        Icon(isHid ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isHid = !isHid;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter confirm password';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                getPhoneField(),
                const SizedBox(height: 20),
                getdatePicker(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your date of birth';
                    }
                    DateTime dob = DateFormat('dd/MM/yyyy').parse(value);
                    DateTime today = DateTime.now();
                    int age = today.year - dob.year;
                    if (dob.add(Duration(days: age * 365)).isAfter(today)) {
                      age--;
                    }
                    if (age < 18) {
                      return 'You must be at least 18 years old to register';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                getdropdownField(
                  options: [
                    'Rajkot',
                    'Surat',
                    'Ahmedabad',
                    'Vadodara',
                    'Jamnagar',
                    'Junagadh'
                  ],
                  onChanged: (value) => setState(() => _selectCity = value),
                ),
                const SizedBox(height: 20),
                getGenderField(),
                const SizedBox(height: 20),
                getHobbiesField(),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: saveForm,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: const Text('Save',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: resetForm,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent),
                      child: const Text('Reset',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor:  Color(0xFFFFE8EF),
    );
  }

  void saveForm() {
    if (formKey.currentState!.validate()) {
      DateTime dob = DateFormat('dd/MM/yyyy').parse(dateController.text);
      age = calculateAge(dob); // Recalculate age before saving

      if (widget.id != null) {
        UserModel.updateUser(
          id: widget.id!,
          name: fullNameController.text,
          email: emailController.text,
          password: passwordController.text,
          mobile: mobileController.text,
          dob: dateController.text,
          age: age.toString(), // Use calculated age
          city: _selectCity!,
          gender: genderController,
          hobbies: hobbiesController,
          isFavorite: favoriteController,
        );
      } else {
        UserModel.addUser(
          name: fullNameController.text,
          email: emailController.text,
          password: passwordController.text,
          mobile: mobileController.text,
          dob: dateController.text,
          age: age.toString(), // Use calculated age
          city: _selectCity!,
          gender: genderController,
          hobbies: hobbiesController,
          isFavorite: favoriteController,
        );
      }
      resetForm();
      Navigator.pop(context);
    }
  }

  void resetForm() {
    formKey.currentState!.reset();
    fullNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    mobileController.clear();
    dateController.clear();
    dateController.text = '';
    genderController = 'Male';
    _selectCity = '';
    for (var hobby in hobbiesController) {
      hobby[1] = false;
    }
  }

  Widget getFormField({
    required keyboardType,
    required controller,
    required validator,
    required labelText,
    required hintText,
    obscureText = false,
    suffixIcon,
    maxLength,
    required List<FilteringTextInputFormatter> inputFormatters,
  }) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      maxLength: maxLength,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget getPhoneField() {
    return TextFormField(
      controller: mobileController,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a phone number';
        }
        // Regex for validating 10-digit phone number
        var regex = RegExp(r"^[0-9]{10}$");
        if (!regex.hasMatch(value)) {
          return 'Enter a valid 10-digit phone number';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "📱 Phone Number",
        hintText: 'Enter your phone number',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
    );
  }

  Widget getdatePicker({String? Function(String?)? validator}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: dateController,
        readOnly: true,
        validator: validator,
        decoration: InputDecoration(
          labelText: "🗓️ Date of Birth",
          hintText: "Enter Date of Birth",
          suffixIcon: Icon(Icons.calendar_month),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onTap: () async {
          DateTime today = DateTime.now();
          DateTime firstDate =
              DateTime(today.year - 80, today.month, today.day);
          DateTime lastDate = DateTime(today.year - 18, today.month, today.day);

          DateTime? pickedDate = await showDatePicker(
            context: context,
            firstDate: firstDate,
            lastDate: lastDate,
            initialDate: dateController.text.isEmpty
                ? lastDate
                : DateFormat('dd/MM/yyyy').parse(dateController.text),
          );

          if (pickedDate != null) {
            setState(() {
              dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
              age = calculateAge(pickedDate);
            });
          }
        },
      ),
    );
  }

  int calculateAge(DateTime dob) {
    DateTime today = DateTime.now();
    int age = today.year - dob.year;
    if (dob.month > today.month ||
        (dob.month == today.month && dob.day > today.day)) {
      age--; // Subtract a year if the birthday hasn't occurred yet this year
    }
    return age;
  }

  Widget getdropdownField({
    required List<String> options,
    required Function(String?)? onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String>(
        value: options.contains(_selectCity) ? _selectCity : null,
        decoration: InputDecoration(
          labelText: '🗺️ City',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
        items: options
            .map((city) => DropdownMenuItem(value: city, child: Text(city)))
            .toList(),
        hint: Text("🗺️ Select City"),
        onChanged: (value) {
          setState(() {
            _selectCity = value;
          });
        },
      ),
    );
  }

  Widget getGenderField() {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 2,
          ),
          const Text(
            '🤔 Gender:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            width: 2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RadioMenuButton(
                value: 'Male',
                groupValue: genderController,
                onChanged: (value) {
                  setState(() {
                    genderController = value!;
                  });
                },
                child: const Text(
                  '🧔‍♂️ Male',
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              RadioMenuButton(
                value: 'Female',
                groupValue: genderController,
                onChanged: (value) {
                  setState(() {
                    genderController = value!;
                  });
                },
                child: const Text(
                  '👩‍🦰 Female',
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getHobbiesField() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 2,
          ),
          const Text(
            '😈 Hobbies:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            width: 1,
          ),
          getHobbiesList(),
        ],
      ),
    );
  }

  Widget getHobbiesList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getHobbyCheckBox(0),
        getHobbyCheckBox(1),
        getHobbyCheckBox(2),
        getHobbyCheckBox(3),
      ],
    );
  }

  Widget getHobbyCheckBox(int i) {
    return CheckboxMenuButton(
      value: hobbiesController[i][1],
      onChanged: (value) {
        setState(() {
          hobbiesController[i][1] = !hobbiesController[i][1];
        });
      },
      child: Text(
        hobbiesController[i][0],
        style: const TextStyle(fontSize: 16),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  bool isUserRegistered(String value) {
    var userList = UserModel.userList;
    for (int i = 0; i < userList.length; i++) {
      if (userList[i][MOBILE] == value) {
        return true;
      }
    }
    return false;
  }
}
