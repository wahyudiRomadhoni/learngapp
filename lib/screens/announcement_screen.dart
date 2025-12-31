import 'package:flutter/material.dart';
import '../widgets/announcement_card.dart';

class AnnouncementScreen extends StatelessWidget {
  const AnnouncementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengumuman'),
        backgroundColor: const Color(0xFFD32F2F),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Moved Announcement Cards
              const AnnouncementCard(
                title: 'PENGUMUMAN PERKULIAHAN',
                date: 'Senin, 28 Okt',
                author: 'Dosen Pengampu',
                content:
                    'Sehubungan dengan adanya kegiatan seminar nasional, maka perkuliahan Mobile Programming pada hari Senin ditiadakan dan akan diganti pada hari lain.',
              ),
              const AnnouncementCard(
                title: 'JADWAL PENGGANTI',
                date: 'Kamis, 31 Okt',
                author: 'Dosen Pengampu',
                content:
                    'Perkuliahan pengganti akan dilaksanakan pada hari Kamis pukul 13.00 WIB di ruang Lab Komputer 2. Harap hadir tepat waktu.',
              ),
              const AnnouncementCard(
                title: 'TUGAS BESAR - DEADLINE',
                date: 'Jumat, 1 Nov',
                author: 'Tim Dosen',
                content:
                    'Pengumpulan Tugas Besar Tahap 1 paling lambat hari Jumat pukul 23.59 WIB melalui iGracias. Jangan lupa lampirkan laporan dalam format PDF.',
                deadline: '1 Nov 2025, 23:59',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
