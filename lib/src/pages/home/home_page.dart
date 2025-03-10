import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // เพิ่มการ import ของ CarouselSlider

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> images = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
    'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  ];
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
                backgroundImage: AssetImage('assets/images/profile_not_bg.png'),
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
      body: SingleChildScrollView(
        // เพิ่ม SingleChildScrollView ที่นี่
        child: Column(
          children: [
            Image.network(
              'https://thestandard.co/wp-content/uploads/2024/08/Apple-Short-Film.jpg?x53385',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 30),
            Text(
              'Join Today',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),

            // CarouselSlider added here
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: AssetImage('assets/images/cinema.png'),
                        scale: 10,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Movie", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: AssetImage('assets/images/newspaper.png'),
                        scale: 10,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Movie", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: AssetImage('assets/images/map.png'),
                        scale: 10,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Movie", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/cinema.png'),
                ),
                title: Text('Coming Soon'),
                subtitle: Text('See more...'),
                tileColor: Colors.grey.shade300,
                trailing: Icon(Icons.more_rounded),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            SizedBox(height: 20),
            CarouselSlider.builder(
              itemCount: images.length,
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              itemBuilder: (context, index, realIdx) {
                return Container(
                  child: Center(
                    child: Image.network(
                      images[index],
                      fit: BoxFit.cover,
                      width: 1000,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      selectedItemColor: Colors.white,
      unselectedItemColor: const Color.fromARGB(255, 246, 238, 16),
      backgroundColor: const Color.fromARGB(255, 76, 175, 80),
    );
  }
}
