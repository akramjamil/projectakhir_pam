import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projek_akhir/screens/konversi_matauang.dart';
import 'package:projek_akhir/screens/konversi_waktu.dart';
import 'package:projek_akhir/screens/home.dart';
import 'package:projek_akhir/screens/about.dart';
import 'package:projek_akhir/screens/add_reservasi.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu', style: GoogleFonts.poppins(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 114, 174, 209), // Warna cream muda
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CurrencyConverterScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              elevation: 5,
              padding: const EdgeInsets.all(22),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              side: const BorderSide(color: Color.fromARGB(255, 38, 86, 150), width: 2), // Warna cream medium
            ),
            child: Center(
              child: Text(
                'Currency Convertion',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(255, 38, 86, 150), // Warna cream medium
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TimeConverterWidget()),
              );
            },
            style: ElevatedButton.styleFrom(
              elevation: 5,
              padding: const EdgeInsets.all(22),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              side: const BorderSide(color: Color.fromARGB(255, 38, 86, 150), width: 2), // Warna cream medium
            ),
            child: Center(
              child: Text(
                'Time Convertion',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(255, 38, 86, 150), // Warna cream medium
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddReservation()),
              );
            },
            style: ElevatedButton.styleFrom(
              elevation: 5,
              padding: const EdgeInsets.all(22),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              side: const BorderSide(color: Color.fromARGB(255, 38, 86, 150), width: 2), // Warna cream medium
            ),
            child: Center(
              child: Text(
                'Add Reservation',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(255, 38, 86, 150), // Warna cream medium
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 114, 174, 209), // Warna cream muda
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list, color: const Color.fromARGB(255, 226, 214, 53)),
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
        currentIndex: 1,
        selectedItemColor: const Color.fromARGB(255, 226, 214, 53), // Warna cream medium
        unselectedItemColor: Colors.black,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AboutPage()),
            );
          }
        },
        
      ),
    );
  }
}
