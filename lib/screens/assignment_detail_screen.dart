import 'package:flutter/material.dart';

class AssignmentDetailScreen extends StatelessWidget {
  const AssignmentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tugas 01 - UID Android Mobile Game',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFC62828),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Description Section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '1. Buatlah desain tampilan (antarmuka) pada aplikasi mobile game FPS (First Person Shooter) yang akan menjadi tugas pada mata kuliah Pemrograman Aplikasi Permainan.',
                    style: TextStyle(height: 1.5, fontSize: 13),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '2. Desain yang dibuat harus melingkupi seluruh tampilan pada aplikasi/game, dari pertama kali aplikasi dibuka sampai ditutup kembali, serta desain untuk tampilan-tampilan fungsi yang mendukung permainan seperti pop-up, alert, chat, dan lain-lain.',
                    style: TextStyle(height: 1.5, fontSize: 13),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '3. Desain bisa dibuat menggunakan aplikasi khusus desain atau secara manual dengan tetap menjunjung kerapihan dan kejelasan setiap elemen dalam desain.',
                    style: TextStyle(height: 1.5, fontSize: 13),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '4. Berikan identitas aplikasi game yang dibuat, seperti Nama Game, Genre, dan Platform. Serta berikan penjelasan pada setiap elemen pada desain, seperti gambar, teks, tombol, icon, dan lain-lain.',
                    style: TextStyle(height: 1.5, fontSize: 13),
                  ),
                   SizedBox(height: 12),
                  Text(
                    '5. File dikumpulkan dalam format .PDF dengan size maksimal 5MB.',
                    style: TextStyle(height: 1.5, fontSize: 13),
                  ),
                   SizedBox(height: 12),
                  Text(
                    '6. Tugas dikumpulkan paling lambat hari Jum\'at, 26 Februari 2021 jam 23:59 WIB (akan tertutup otomatis) dan akan dipresentasikan pada pertemuan selanjutnya via Zoom Meeting.',
                    style: TextStyle(height: 1.5, fontSize: 13),
                  ),
                ],
              ),
            ),

            // Status Tugas Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              color: const Color(0xFFEF5350), // Lighter red
              child: const Text(
                'Status Tugas',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),

            // Status Table
            _buildStatusRow('Status', 'Sudah Mengirim untuk di nilai', isEven: true),
            _buildStatusRow('Status Nilai', 'Belum Di nilai', isEven: false),
            _buildStatusRow('Batas tanggal', 'Jumat, 26 Februari 2021, 23:59 WIB', isEven: true),
            _buildStatusRow('Sisa Waktu', 'Tugas sudah di kirim 4 Hari 6 Jam Sebelum nya', isEven: false),
            _buildFileRow('File Tugas', 'Wahyudi Romadhoni_7708170114.pdf', isEven: true),

            const SizedBox(height: 40),
            
            // Tambahkan Tugas Button
            Center(
               child: Container(
                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                 decoration: BoxDecoration(
                   color: Colors.grey[200],
                   borderRadius: BorderRadius.circular(8),
                 ),
                 child: const Text(
                   'Tambahkan Tugas',
                   style: TextStyle(
                     color: Colors.black,
                     fontWeight: FontWeight.w500,
                   ),
                 ),
               ),
            ),
             const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusRow(String label, String value, {required bool isEven}) {
    return Container(
      color: isEven ? const Color(0xFFF5F5F5) : Colors.white, // Alternating colors
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFileRow(String label, String fileName, {required bool isEven}) {
    return Container(
      color: isEven ? const Color(0xFFF5F5F5) : Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                const Icon(Icons.description_outlined, size: 20, color: Colors.black54),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    fileName,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      decoration: TextDecoration.underline, // Usually files are clickable
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
