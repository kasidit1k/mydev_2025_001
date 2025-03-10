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
                backgroundImage: NetworkImage(
                  'https://scontent-bkk1-2.xx.fbcdn.net/v/t1.15752-9/476496923_1300732134477703_6830153537542658018_n.png?_nc_cat=103&ccb=1-7&_nc_sid=9f807c&_nc_ohc=cJ6OAZQEYhcQ7kNvgHl_epV&_nc_oc=Adge1rCfvExg6BP1KRZykETdr_SVmC9jARlY9lJO5nooO5U41D2_ZwvbFFRfMngB5PE&_nc_zt=23&_nc_ht=scontent-bkk1-2.xx&oh=03_Q7cD1gE4O7K8IaEyV8gjR24s-hEpDsdMw-Dy-3L83l32jdMKqw&oe=67E79C9C',
                ),
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
