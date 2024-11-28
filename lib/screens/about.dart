import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projek_akhir/screens/home.dart';
import 'package:projek_akhir/screens/list_menu.dart';
import 'package:projek_akhir/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About', style: GoogleFonts.poppins(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 114, 174, 209),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: const Color.fromARGB(255, 114, 174, 209),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/profile.png'),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name: Robert',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 45, 45, 44), // Warna cream medium
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Username: robert123',
                              style: GoogleFonts.poppins(fontSize: 16, color: const Color.fromARGB(255, 44, 43, 42)), // Warna cream medium
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'E-mail: robertjavier@gmail.com',
                              style: GoogleFonts.poppins(fontSize: 16, color: const Color.fromARGB(255, 44, 43, 42)), // Warna cream medium
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Phone : 6723587932',
                              style: GoogleFonts.poppins(fontSize: 16, color: const Color.fromARGB(255, 44, 43, 42)), // Warna cream medium
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              'Notes',
              style: GoogleFonts.poppins(fontSize: 20.0, fontWeight: FontWeight.bold, color:  Color.fromARGB(255, 38, 86, 150)), // Warna cream medium
            ),
            const SizedBox(height: 10.0),
            ExpansionTile(
              title: Text('', style: GoogleFonts.poppins(color: const Color.fromARGB(255, 44, 43, 42))), // Warna cream medium
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '',
                    style: GoogleFonts.poppins(fontSize: 16.0, color: const Color.fromARGB(255, 30, 30, 30)), // Warna cream medium
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('', style: GoogleFonts.poppins(color: const Color.fromARGB(255, 31, 31, 31))), // Warna cream medium
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '',
                    style: GoogleFonts.poppins(fontSize: 16.0, color: const Color.fromARGB(255, 45, 45, 43)), // Warna cream medium
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _logout(context),
              style: ElevatedButton.styleFrom(
                elevation: 8,
                padding: const EdgeInsets.all(22),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor:  Color.fromARGB(255, 38, 86, 150),
              ),
              child: Center(
                child: Text(
                  'Logout',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 114, 174, 209),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list, color: Colors.black),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.png'),
              radius: 12,
            ),
            label: 'About',
          ),
        ],
        currentIndex: 2,
        selectedItemColor:  const Color.fromARGB(255, 226, 214, 53),
        unselectedItemColor: Colors.black,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MenuPage()),
            );
          }
        },
      ),
    );
  }
}
