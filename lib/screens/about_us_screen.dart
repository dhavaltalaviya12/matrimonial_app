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
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'About Us',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
              Center(
                child: Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile_photo.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Name
              Center(
                child: const Text(
                  "Dhaval Talaviya",
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Meet Our Team Button
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Meet Our Team",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              // Card with Team Info
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side:
                      const BorderSide(color: Colors.lightBlueAccent, width: 2),
                ),
                elevation: 7,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildInfoRow(
                          "Developed By:", "Dhaval Talaviya (23010101263)"),
                      SizedBox(
                        height: 10,
                      ),
                      _buildInfoRow("Mentored By:",
                          "Prof. Mehul Bhundiya (Computer Engineering Department), School of Computer Science"),
                      SizedBox(
                        height: 10,
                      ),
                      _buildInfoRow(
                          "Explored By:", "ASWDC, School of Computer Science"),
                      SizedBox(
                        height: 10,
                      ),
                      _buildInfoRow("Eulogized By:",
                          "Darshan University, Rajkot, Gujarat - INDIA"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // About ASWDC Section
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "About ASWDC",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side:
                      const BorderSide(color: Colors.lightBlueAccent, width: 2),
                ),
                elevation: 7,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Image.asset(
                                  'assets/images/darshanlogo-removebg-preview.png',
                                  height: 120,
                                  width: 120)),
                          const SizedBox(width: 16),
                          Expanded(
                              child: Image.asset('assets/images/aswdc.png',
                                  height: 120, width: 120)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "ASWDC is Application, Software and Website Development Center @ Darshan University, run by Students and Staff of School of Computer Science.",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "The sole purpose of ASWDC is to bridge the gap between university curriculum & industry demands. Students learn cutting-edge technologies, develop real-world applications & experience a professional environment at ASWDC under the guidance of industry experts & faculty members.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Contact Us Section
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Contact Us",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              _buildContactCard(),
              const SizedBox(height: 16),
              _buildShareAndMoreCard(),
              const SizedBox(height: 20),
              // Footer
              const Text("© 2025 Darshan University",
                  style: TextStyle(fontFamily: 'Roboto')),
              const Text("All Rights Reserved - Privacy Policy",
                  style: TextStyle(fontFamily: 'Roboto')),
              const Text("Made With 💝 in INDIA",
                  style: TextStyle(fontFamily: 'Roboto')),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create a row with info
  Widget _buildInfoRow(String title, String content) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.deepOrange),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(content),
        ),
      ],
    );
  }

  // Contact Card
  Widget _buildContactCard() {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.lightBlueAccent, width: 2),
      ),
      child: Column(
        children: [
          _buildContactRow(Icons.email_outlined, "aswdc@darshan.ac.in"),
          _buildContactRow(Icons.phone_outlined, "+91-9727747317"),
          _buildContactRow(Icons.blur_circular_outlined, "www.darshan.ac.in"),
        ],
      ),
    );
  }

  // Row for each contact detail
  Widget _buildContactRow(IconData icon, String content) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon, color: Colors.lightBlueAccent),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(content),
        ),
      ],
    );
  }

  // Share and More Apps Card
  Widget _buildShareAndMoreCard() {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.lightBlueAccent, width: 2),
      ),
      child: Column(
        children: [
          _buildOptionRow(Icons.share_outlined, "Share App"),
          _buildOptionRow(Icons.apps, "More Apps"),
          _buildOptionRow(Icons.star_border, "Rate Us"),
          _buildOptionRow(Icons.thumb_up_alt_outlined, "Like Us on Facebook"),
          _buildOptionRow(Icons.update, "Check for Update"),
        ],
      ),
    );
  }

  // Row for each option in share and more apps
  Widget _buildOptionRow(IconData icon, String label) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon, color: Colors.lightBlueAccent),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(label),
        ),
      ],
    );
  }
}
