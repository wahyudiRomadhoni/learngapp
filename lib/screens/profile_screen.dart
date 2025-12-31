import 'package:flutter/material.dart';
import 'login_screen.dart'; // For logout navigation

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedTabIndex = 0; // 0: About Me, 1: Kelas, 2: Edit Profile

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            // Removed Positioned Card from here to fix hit testing
            Stack(
              alignment: Alignment.center,
              children: [
                // Red Background
                Container(
                  height: 280,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFC62828),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50, left: 16),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Profile Image
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                          image: const DecorationImage(
                            image: AssetImage('assets/profile_wahyudi.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Name
                      const Text(
                        'WAHYUDI ROMADHONI',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            // Floating Card (Tabs) - Moved here for interactivity
            Transform.translate(
              offset: const Offset(0, -40),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTabItem('About Me', 0),
                    _buildTabItem('Kelas', 1),
                    _buildTabItem('Edit Profile', 2),
                  ],
                ),
              ),
            ),

            // Spacer adjusted
            // Since Transform.translate moves the card visually up 40px but leaves the layout space, 
            // the content below naturally starts 40px lower than the visual bottom of the card.
            // This acts as a 40px visual spacer. 
            // The previous 60px spacer + stack overlap was roughly 20px gap.
            // So we technically don't need extra spacer, or maybe a small one.
            // Let's us SizedBox(height: 0) to be safe (just using the transform gap).

            // Dynamic Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: _buildContent(),
            ),
             const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    bool isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
           border: isSelected ? const Border(bottom: BorderSide(color: Colors.grey, width: 3)) : null,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (_selectedTabIndex) {
      case 0:
        return _buildAboutMeContent();
      case 1:
        return _buildKelasContent();
      case 2:
        return _buildEditProfileContent();
      default:
        return _buildAboutMeContent();
    }
  }

  // --- Tab 1: About Me ---
  Widget _buildAboutMeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Informasi User',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildInfoItem('Email address', 'wahyudi.r@student.uim.ac.id'),
        _buildInfoItem('Program Studi', 'Teknik Informatika'),
        _buildInfoItem('Fakultas', 'Teknik'),
        const SizedBox(height: 24),
        const Text(
          'Aktivitas Login',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildInfoItem('First access to site', 'Monday, 7 September 2020, 9:27 AM (288 days 12 hours)'),
        _buildInfoItem('Last access to site', 'Tuesday, 22 June 2021, 9:44 PM (now)'),
        const SizedBox(height: 40),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (Route<dynamic> route) => false
              );
            },
            icon: const Icon(Icons.logout, color: Colors.white),
            label: const Text('Log Out', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC62828),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
      ],
    );
  }

  // --- Tab 2: Kelas ---
  Widget _buildKelasContent() {
    // Mock Data for Classes
    final List<Map<String, String>> classes = [
      {
        'name': 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC',
        'code': 'D4SM-41-GAB1 [ARS]',
        'date': 'Tanggal Mulai Monday, 8 February 2021',
      },
      {
        'name': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
        'code': 'D4SM-42-03 [ADY]',
        'date': 'Tanggal Mulai Monday, 8 February 2021',
      },
      {
        'name': 'KEWARGANEGARAAN',
        'code': 'D4SM-41-GAB1 [BBO]. JUMAT 2',
        'date': 'Tanggal Mulai Monday, 8 February 2021',
      },
      {
        'name': 'OLAH RAGA D3TT-44-02 [EYR]',
        'code': '',
        'date': 'Tanggal Mulai Monday, 8 February 2021',
      },
      {
        'name': 'PEMROGRAMAN MULTIMEDIA INTERAKTIF',
        'code': 'D4SM-43-04 [TPR]',
        'date': 'Tanggal Mulai Monday, 8 February 2021',
      },
       {
        'name': 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA',
        'code': 'D4SM-41-GAB1 [APJ]',
        'date': 'Tanggal Mulai Monday, 8 February 2021',
      },
        {
        'name': 'SISTEM OPERASI D4SM-44-02 [DDS]',
        'code': '',
        'date': 'Tanggal Mulai Monday, 8 February 2021',
      },
    ];

    return Column(
      children: classes.map((cls) => Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF81B3D9), // Light Blue
                borderRadius: BorderRadius.circular(20),
              ),
              // Icon is not clearly visible in low res screenshot, generic rounded rect color
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cls['name']!,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  if (cls['code']!.isNotEmpty) ...[
                     const SizedBox(height: 2),
                    Text(
                      cls['code']!,
                       style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ],
                  const SizedBox(height: 4),
                  Text(
                    cls['date']!,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      )).toList(),
    );
  }

  // --- Tab 3: Edit Profile ---
  Widget _buildEditProfileContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField('Nama Pertama'),
        const SizedBox(height: 16),
        _buildTextField('Nama Terakhir'),
        const SizedBox(height: 16),
        _buildTextField('E-mail Address'),
        const SizedBox(height: 16),
        _buildTextField('Negara'),
        const SizedBox(height: 16),
        _buildTextField('Deskripsi', maxLines: 5),
        const SizedBox(height: 30),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {
               // Dummy Save Action
               ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(content: Text('Profil Disimpan!')),
               );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[100],
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Simpan'),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
