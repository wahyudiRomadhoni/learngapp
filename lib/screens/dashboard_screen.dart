import 'package:flutter/material.dart';
import '../widgets/header_section.dart';
import '../screens/announcement_screen.dart';
import '../widgets/class_progress_card.dart';
import '../screens/my_classes_screen.dart';
import '../screens/profile_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Don't show back button
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            const Text(
              'Wahyudi Romadhoni',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'MAHASISWA',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfileScreen()),
                    );
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/profile_wahyudi.png',
                        fit: BoxFit.cover,
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: const Color(0xFFD32F2F),
        foregroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'TUGAS YANG AKAN DATANG',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderSection(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Pengumuman Terakhir',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AnnouncementScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'lihat semua',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Maintenance Information
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                border: Border.all(color: Colors.amber.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.amber),
                      SizedBox(width: 8),
                      Text(
                        'Informasi Maintenance',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Aplikasi sedang dalam perbaikan berkala untuk meningkatkan performa dan kenyamanan pengguna. Mohon maaf atas ketidaknyamanan yang ditimbulkan.',
                    style: TextStyle(color: Colors.brown),
                  ),
                ],
              ),
            ),

            // Progres Kelas Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Progres Kelas',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const ClassProgressCard(
              courseName: 'Pemrograman Mobile',
              progressText: '10/14 Pertemuan',
              progressValue: 0.71,
              icon: Icons.smartphone,
            ),
            const ClassProgressCard(
              courseName: 'Desain Antarmuka',
              progressText: '12/14 Pertemuan',
              progressValue: 0.85,
              icon: Icons.design_services,
              iconColor: Colors.blue,
            ),
            const ClassProgressCard(
              courseName: 'Basis Data Lanjut',
              progressText: '8/14 Pertemuan',
              progressValue: 0.57,
              icon: Icons.storage,
              iconColor: Colors.green,
            ),
            const ClassProgressCard(
              courseName: 'Keamanan Jaringan',
              progressText: '6/14 Pertemuan',
              progressValue: 0.42,
              icon: Icons.security,
              iconColor: Colors.orange,
            ),
            const ClassProgressCard(
              courseName: 'Cloud Computing',
              progressText: '13/14 Pertemuan',
              progressValue: 0.92,
              icon: Icons.cloud,
              iconColor: Colors.purple,
            ),
            const ClassProgressCard(
              courseName: 'Kecerdasan Buatan',
              progressText: '9/14 Pertemuan',
              progressValue: 0.64,
              icon: Icons.psychology,
              iconColor: Colors.teal,
            ),
            const SizedBox(height: 20),
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
        currentIndex: 0, // 'Home' is selected
        onTap: (index) {
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyClassesScreen()),
            );
          }
        },
      ),
    );
  }
}
