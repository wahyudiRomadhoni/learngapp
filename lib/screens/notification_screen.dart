import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFC62828), // Themed Red Background
        title: const Text(
          'Notifikasi',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildNotificationItem(
            icon: Icons.assignment_outlined,
            text: 'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
            time: '3 Hari 9 Jam Yang Lalu',
          ),
          const Divider(),
          const SizedBox(height: 16),
          _buildNotificationItem(
            icon: Icons.quiz_outlined,
            text: 'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
            time: '3 Hari 9 Jam Yang Lalu',
          ),
          const Divider(),
          const SizedBox(height: 16),
           _buildNotificationItem(
            icon: Icons.assignment_outlined,
            text: 'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
            time: '3 Hari 9 Jam Yang Lalu',
          ),
          const Divider(),
          const SizedBox(height: 16),
           _buildNotificationItem(
            icon: Icons.quiz_outlined,
            text: 'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
            time: '3 Hari 9 Jam Yang Lalu',
          ),
          const Divider(),
          const SizedBox(height: 16),
           _buildNotificationItem(
            icon: Icons.assignment_outlined,
            text: 'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
            time: '3 Hari 9 Jam Yang Lalu',
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({required IconData icon, required String text, required String time}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 28, color: Colors.black87),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
