import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // Header Image
                ClipPath(
                  clipper: HeaderClipper(),
                  child: SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/login_header_green.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Logo
                Positioned(
                  bottom: -40,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: const Color(0xFFC62828), // Deep Red
                      child: const Icon(
                        Icons.school, // Placeholder for University Logo
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Email 365',
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFC62828)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFC62828), width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.grey),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFC62828)),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFC62828), width: 2),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DashboardScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC62828),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (context) => const HelpBottomSheet(),
                        );
                      },
                      child: const Text(
                        'Bantuan ?',
                        style: TextStyle(
                          color: Color(0xFFC62828),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Footer Wave
            ClipPath(
              clipper: FooterWaveClipper(),
              child: Container(
                height: 150,
                width: double.infinity,
                color: const Color(0xFFC62828).withOpacity(0.8), // Adjust opacity to match design if needed, or solid
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FooterWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, 40); // Start a bit down

    var firstControlPoint = Offset(size.width / 4, 0);
    var firstEndPoint = Offset(size.width / 2.25, 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 3.25), 100);
    var secondEndPoint = Offset(size.width, 20);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class HelpBottomSheet extends StatefulWidget {
  const HelpBottomSheet({super.key});

  @override
  State<HelpBottomSheet> createState() => _HelpBottomSheetState();
}

class _HelpBottomSheetState extends State<HelpBottomSheet> {
  bool isIndonesian = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLanguageOption('ID', '🇮🇩', true),
              const SizedBox(width: 40),
              _buildLanguageOption('EN', '🇬🇧', false),
            ],
          ),
          const SizedBox(height: 30),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isIndonesian
                        ? 'Akses hanya untuk Dosen dan Mahasiswa Universitas Islam Madura.'
                        : 'Access only for Lecturers and Students of Madura Islamic University .',
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    isIndonesian
                        ? 'Login menggunakan Akun Microsoft Office 365 dengan mengikuti petunjuk berikut :'
                        : 'Login using Microsoft Office 365 Account by following these instructions:',
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    isIndonesian
                        ? 'Username (Akun Mahasiswa) ditambahkan "@123.uim.ac.id"'
                        : 'Username (Student Account) followed by "@123.uim.ac.id"',
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                  Text(
                    isIndonesian
                        ? 'Password (Akun mhs12345) pada kolom Password.'
                        : 'Password (mhs123 account) in the Password field.',
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    isIndonesian
                        ? 'Kegagalan yang terjadi pada Autentikasi disebabkan oleh Anda belum mengubah Password Anda menjadi "Strong Password". Pastikan Anda telah melakukan perubahan Password di iGracias.'
                        : 'Authentication failure is caused by not changing your Password to a "Strong Password". Please ensure you have changed your Password in iGracias.',
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    isIndonesian
                        ? 'Informasi lebih lanjut dapat menghubungi Layanan CeLOE Helpdesk di :'
                        : 'For more information, please contact CeLOE Helpdesk Service at:',
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Mail : yudiTI@uim.ac.id',
                    style: TextStyle(fontSize: 14, height: 1.5, fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    'whatsapp : +62 831-3666-3563',
                    style: TextStyle(fontSize: 14, height: 1.5, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(String code, String flag, bool isId) {
    bool isSelected = isIndonesian == isId;
    return GestureDetector(
      onTap: () {
        setState(() {
          isIndonesian = isId;
        });
      },
      child: Column(
        children: [
          Text(
            flag,
            style: const TextStyle(fontSize: 32),
          ),
          const SizedBox(height: 4),
          Text(
            code,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          if (isSelected)
            Container(
              width: 30,
              height: 3,
              color: Colors.grey[700],
            ),
        ],
      ),
    );
  }
  }


class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height); 
    // Design assumption: Diagonal up from Left to Right.
    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
