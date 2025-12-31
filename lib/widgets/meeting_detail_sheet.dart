import 'package:flutter/material.dart';

class MeetingDetailSheet extends StatelessWidget {
  final String title;

  const MeetingDetailSheet({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // DraggableScrollableSheet allows resizing but showModalBottomSheet with isScrollControlled is often enough.
    // Given the design, a fixed height or dynamic based on content is good.
    // Using Container with specific height factor logic in showModal works too.
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Handle Bar
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 12, bottom: 20),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          
          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          
          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Deskripsi',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Konsep dasar User Interface Design akan dipelajari bagaimana membangun sebuah Interaction Design pada antarmuka. Interaction ini sangat penting untuk aplikasi berkomunikasi dengan pengguna. Lalu dipelajari juga poin-poin penting pada interaction design seperti visibility, feedback, limitation, consistency dan affordance. Dan terakhir materi conceptual dan perceptual design interaction akan memberikan gambaran bagaimana bentuk dari Interaction.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Tabs & Content
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const TabBar(
                    indicatorColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: 'Lampiran Materi'),
                      Tab(text: 'Tugas dan Kuis'),
                    ],
                  ),
                  Container(height: 1, color: Colors.grey[200]), // Divider line
                  Expanded(
                    child: Container(
                      color: Colors.grey[50], // Light grey background for list
                      child: TabBarView(
                        children: [
                          // Lampiran Materi List
                          ListView(
                            padding: const EdgeInsets.all(20),
                            children: const [
                              MaterialItemCard(
                                title: 'Zoom Meeting Syncronous',
                                icon: Icons.link,
                              ),
                              MaterialItemCard(
                                title: 'Elemen-elemen Antarmuka Pengguna',
                                icon: Icons.description_outlined,
                              ),
                              MaterialItemCard(
                                title: 'UID Guidelines and Principles',
                                icon: Icons.description_outlined,
                              ),
                              MaterialItemCard(
                                title: 'User Profile',
                                icon: Icons.description_outlined,
                              ),
                              MaterialItemCard(
                                title: 'Principles of User Interface DesignURL',
                                icon: Icons.link,
                              ),
                            ],
                          ),
                          // Tugas dan Kuis Placeholder
                           const Center(child: Text('Belum ada tugas atau kuis')),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MaterialItemCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const MaterialItemCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30), // Rounded pill shape
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.black87),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.check_circle, color: Colors.green, size: 24),
        ],
      ),
    );
  }
}
