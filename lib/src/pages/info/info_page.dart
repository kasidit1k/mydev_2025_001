import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Darker app background color
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        // Added container with darker background
        decoration: BoxDecoration(
          color: Colors.blueGrey[200], // Darker background color
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Added this line for centering
            children: [
              const CircleAvatar(
                radius: 65,
                backgroundImage: AssetImage('assets/images/profile_not_bg.png'),
              ),
              const SizedBox(height: 14),
              const Text(
                'Kasidit',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Student',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 100, 90, 90),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(thickness: 5),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Container(
                  // Added container around the Column
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: const [
                      ProfileInfoTile(
                        icon: Icons.account_circle,
                        label: 'Nickname',
                        value: 'Kim',
                      ),
                      Divider(),
                      ProfileInfoTile(
                        icon: Icons.phone,
                        label: 'Phone',
                        value: '0987654321',
                      ),
                      Divider(),
                      ProfileInfoTile(
                        icon: Icons.email,
                        label: 'Email',
                        value: '654295001@parichat.skru.ac.th',
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
}

class ProfileInfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ProfileInfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueGrey[700]),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(value, style: const TextStyle(fontSize: 16)),
    );
  }
}
