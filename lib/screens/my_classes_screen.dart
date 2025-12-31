import 'package:flutter/material.dart';
import '../widgets/class_progress_card.dart';
import 'dashboard_screen.dart'; // For navigation back to Home

class MyClassesScreen extends StatelessWidget {
  const MyClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kelas Saya',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
             Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DashboardScreen()),
            );
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
             ClassProgressCard(
              courseName: 'Pemrograman Mobile',
              progressText: '10/14 Pertemuan',
              progressValue: 0.71,
              icon: Icons.smartphone,
            ),
             ClassProgressCard(
              courseName: 'Desain Antarmuka',
              progressText: '12/14 Pertemuan',
              progressValue: 0.85,
              icon: Icons.design_services,
              iconColor: Colors.blue,
            ),
             ClassProgressCard(
              courseName: 'Basis Data Lanjut',
              progressText: '8/14 Pertemuan',
              progressValue: 0.57,
              icon: Icons.storage,
              iconColor: Colors.green,
            ),
             ClassProgressCard(
              courseName: 'Keamanan Jaringan',
              progressText: '6/14 Pertemuan',
              progressValue: 0.42,
              icon: Icons.security,
              iconColor: Colors.orange,
            ),
             ClassProgressCard(
              courseName: 'Cloud Computing',
              progressText: '13/14 Pertemuan',
              progressValue: 0.92,
              icon: Icons.cloud,
              iconColor: Colors.purple,
            ),
             ClassProgressCard(
              courseName: 'Kecerdasan Buatan',
              progressText: '9/14 Pertemuan',
              progressValue: 0.64,
              icon: Icons.psychology,
              iconColor: Colors.teal,
            ),
             ClassProgressCard(
              courseName: 'Bahasa Inggris Bisnis', // Added matching image usually
              progressText: '8/14 Pertemuan',
              progressValue: 0.5,
              icon: Icons.language,
              iconColor: Colors.indigo,
            ),
             ClassProgressCard(
              courseName: 'Multimedia Interaktif',
              progressText: '12/14 Pertemuan',
              progressValue: 0.8,
              icon: Icons.movie_creation,
              iconColor: Colors.blueAccent,
            ),
             ClassProgressCard(
              courseName: 'Olah Raga',
              progressText: '14/14 Pertemuan',
              progressValue: 1.0,
              icon: Icons.sports_soccer,
              iconColor: Colors.purpleAccent,
            ),
             SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFFC62828), // Red when selected
        unselectedItemColor: Colors.grey, // Grey when unselected
        backgroundColor: Colors.white, // White background
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined), 
            activeIcon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined), 
            activeIcon: Icon(Icons.school),
            label: 'Kelas Saya'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined), 
            activeIcon: Icon(Icons.notifications),
            label: 'Notifikasi'
          ),
        ],
        currentIndex: 1, // 'Kelas Saya' is selected
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DashboardScreen()),
            );
          }
        },
      ),
    );
  }
}
