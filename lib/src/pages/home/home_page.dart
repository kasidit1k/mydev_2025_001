import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // ฟังก์ชันสำหรับเปลี่ยนหน้าเมื่อกด BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print('index = $_selectedIndex');

      //ใช้ Navigator เพื่อเปิดหน้า
      switch (index) {
        case 0:
          Navigator.pushNamed(context, 'home');
          break;
        case 1:
          break;
        case 2:
          Navigator.pushNamed(context, 'info');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey[900]),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://scontent-bkk1-2.xx.fbcdn.net/v/t1.15752-9/476496923_1300732134477703_6830153537542658018_n.png?_nc_cat=103&ccb=1-7&_nc_sid=9f807c&_nc_ohc=cJ6OAZQEYhcQ7kNvgHl_epV&_nc_oc=Adge1rCfvExg6BP1KRZykETdr_SVmC9jARlY9lJO5nooO5U41D2_ZwvbFFRfMngB5PE&_nc_zt=23&_nc_ht=scontent-bkk1-2.xx&oh=03_Q7cD1gE4O7K8IaEyV8gjR24s-hEpDsdMw-Dy-3L83l32jdMKqw&oe=67E79C9C',
                ),
              ),
              accountName: Text('Kasidit'),
              accountEmail: Text('kasiditza2546@gmail.com'),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, 'info');
              },
              leading: Icon(Icons.info, color: Colors.blueGrey),
              title: Text('My Info'),
            ),
            Spacer(),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, 'Logout');
              },
              leading: Icon(Icons.login_outlined, color: Colors.red),
              title: Text('Logout'),
            ),
          ],
        ),
      ),
      appBar: AppBar(backgroundColor: Colors.green, title: Text('Home')),
      body: Column(
        children: [
          Image.network(
            'https://thestandard.co/wp-content/uploads/2024/08/Apple-Short-Film.jpg?x53385',
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 30),
          SizedBox(height: 20),
          Text(
            'DEV of FLUTTER',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex, // ใช้ตัวแปร state
      onTap: _onItemTapped, // เรียกฟังก์ชันเปลี่ยนหน้า
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.teal.shade700,
    );
  }
}
