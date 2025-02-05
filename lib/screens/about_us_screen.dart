import 'package:flutter/material.dart';


class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(
              Icons.menu_book,
              size: 25,
              weight: 400,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            const Expanded(
              child: Text(
                'About Us',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle, // Make the container circular
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/profile_photo.jpg',
                    ),
                    fit:
                    BoxFit.cover, // Ensure the image fits within the circle
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
                child: Text(
                  "Dhaval Talaviya",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 30,
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(width: 20),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "Meet Our Team",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  color: Colors.lightBlueAccent,
                  width: 2,
                ),
              ),
              elevation: 7,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: const Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Developed By:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Text(
                              "Dhaval Talaviya(23010101263)",
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Mentored By:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Text(
                              "Prof. Mehul Bhundiya(Computer Engineering Department), School of Computer Science",
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Explored By:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Text(
                              "ASWDC , School of Computer Science",
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Eulogized By:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Text(
                              "Darshan University , Rajkot , Gujarat - INDIA",
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const SizedBox(width: 20),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "About ASWDC",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color: Colors.lightBlueAccent,
                  width: 2,
                ),
              ),
              elevation: 7,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                            child: Image.asset(
                              'assets/images/darshanlogo-removebg-preview.png',
                              height: 180,
                              width: 180,
                            )),
                        Expanded(
                            child: Image.asset(
                              'assets/images/aswdc.png',
                              height: 180,
                              width: 180,
                            ))
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Text(
                              "ASWDC is Application,Software and Website Development Center @ Darshan University run by Students and Staff of School of Computer Science.",
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Text(
                              "Sole Purpose of ASWDC is to bridge gap between university curriculum & industry demands. Students learn cutting edge technologies, develop real world application & experience professional environment @ ASWDC under guidance of industry experts & faculty members.",
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "Contact Us",
                    style: TextStyle(
                      fontSize: 18,
                      color:Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Card(
              elevation: 7,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color: Colors.lightBlueAccent,
                  width: 2,
                ),
              ),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.email_outlined,
                              color: Colors.lightBlueAccent,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "aswdc@darshan.ac.in",
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone_outlined,
                              color: Colors.lightBlueAccent,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "+91-9727747317",
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.blur_circular_outlined,
                              color: Colors.lightBlueAccent,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "www.darshan.ac.in",
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              elevation: 7,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color: Colors.lightBlueAccent,
                  width: 2,
                ),
              ),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.share_outlined,
                              color: Colors.lightBlueAccent,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "Share App",
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.apps,
                              color: Colors.lightBlueAccent,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "More Apps",
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star_border,
                              color: Colors.lightBlueAccent,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "Rate Us",
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.thumb_up_alt_outlined,
                              color: Colors.lightBlueAccent,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "Like Us on Facebook",
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.update,
                              color: Colors.lightBlueAccent,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "Check for Update",
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "© 2025 Darshan University",
              style: TextStyle(fontFamily: 'Roboto'),
            ),
            const Text("All Right Reserverd - Privacy Policy",
                style: TextStyle(fontFamily: 'Roboto')),
            const Text("Made With 💝 in INDIA",
                style: TextStyle(fontFamily: 'Roboto')),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
