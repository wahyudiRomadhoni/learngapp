import 'package:flutter/material.dart';
import 'my_classes_screen.dart';
import '../widgets/meeting_detail_sheet.dart';
import 'quiz_screen.dart';
import 'assignment_detail_screen.dart';

class ClassDetailScreen extends StatelessWidget {
  final String courseName;
  final String courseCode;

  const ClassDetailScreen({
    super.key,
    required this.courseName,
    this.courseCode = 'D4SM-42-03 [ADY]', // Default or passed
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courseName, // Allow multiline if needed
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                courseCode,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
              ),
            ],
          ),
          backgroundColor: const Color(0xFFC62828),
          foregroundColor: Colors.white,
          bottom: const TabBar(
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Materi'),
              Tab(text: 'Tugas Dan Kuis'),
            ],
          ),
        ),
        body: Container(
          color: Colors.grey[100], // Background color
          child: TabBarView(
            children: [
              // Materi Tab
              ListView(
                padding: const EdgeInsets.all(16.0),
                children: const [
                  MeetingCard(
                    meetingNumber: 1,
                    title: 'Pengantar User Interface Design',
                    subtitle: '3 URLs, 2 Files, 3 Interactive Content',
                    isCompleted: false, // Grey check
                  ),
                  MeetingCard(
                    meetingNumber: 2,
                    title: 'Konsep User Interface Design',
                    subtitle: '2 URLs, 1 Kuis, 3 Files, 1 Tugas',
                    isCompleted: true, // Green check
                  ),
                  MeetingCard(
                    meetingNumber: 3,
                    title: 'Interaksi pada User Interface Design',
                    subtitle: '3 URLs, 2 Files, 3 Interactive Content',
                    isCompleted: true,
                  ),
                  MeetingCard(
                    meetingNumber: 4,
                    title: 'Ethnographic Observation',
                    subtitle: '3 URLs, 2 Files, 3 Interactive Content',
                    isCompleted: true,
                  ),
                  MeetingCard(
                    meetingNumber: 5,
                    title: 'UID Testing',
                    subtitle: '3 URLs, 2 Files, 3 Interactive Content',
                    isCompleted: true,
                  ),
                   MeetingCard(
                    meetingNumber: 6,
                    title: 'Assessment 1',
                    subtitle: '3 URLs, 2 Files, 3 Interactive Content',
                    isCompleted: true,
                  ),
                ],
              ),
              // Tugas Dan Kuis Tab
              ListView(
                padding: const EdgeInsets.all(16.0),
                children: const [
                  AssignmentCard(
                    type: 'QUIZ',
                    title: 'Quiz Review 01',
                    deadline: '26 Februari 2021 23:59 WIB',
                    isCompleted: true,
                    icon: Icons.quiz_outlined,
                  ),
                  AssignmentCard(
                    type: 'Tugas',
                    title: 'Tugas 01 - UID Android Mobile Game',
                    deadline: '26 Februari 2021 23:59 WIB',
                    isCompleted: false, // Grey check in design looks like 'submitted but not graded' or 'inactive'? user said "sama persis", design has grey check.
                    icon: Icons.assignment_outlined,
                  ),
                  AssignmentCard(
                    type: 'Pertemuan 3',
                    title: 'Kuis - Assessment 2',
                    deadline: '26 Februari 2021 23:59 WIB',
                    isCompleted: true,
                    icon: Icons.quiz_outlined,
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color(0xFFC62828), // Red when selected
          unselectedItemColor: Colors.grey, // Grey when unselected
          backgroundColor: Colors.white, // White background
          elevation: 10, // Add shadow for better visibility on white
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
          currentIndex: 1, // Highlight 'Kelas Saya'
          onTap: (index) {
            if (index == 1) {
              // Already on 'Kelas Saya' context (conceptually detail is part of it, 
              // but user might want to go back to list). 
              // Since detail is pushed, maybe popping is better or replacing.
              // Let's replace to go to the main list.
               Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyClassesScreen()),
              );
            } else if (index == 0) {
              // Go Home
              Navigator.popUntil(context, (route) => route.isFirst);
            }
          },
        ),
      ),
    );
  }
}

class MeetingCard extends StatelessWidget {
  final int meetingNumber;
  final String title;
  final String subtitle;
  final bool isCompleted;

  const MeetingCard({
    super.key,
    required this.meetingNumber,
    required this.title,
    required this.subtitle,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true, // Allow full height
          backgroundColor: Colors.transparent,
          builder: (context) => DraggableScrollableSheet(
            initialChildSize: 0.9,
            minChildSize: 0.5,
            maxChildSize: 0.95,
            builder: (_, controller) => MeetingDetailSheet(title: title),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Pertemuan $meetingNumber',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(
                  Icons.check_circle,
                  color: isCompleted ? Colors.green : Colors.grey[400],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              '${meetingNumber.toString().padLeft(2, '0')} - $title',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AssignmentCard extends StatelessWidget {
  final String type;
  final String title;
  final String deadline;
  final bool isCompleted;
  final IconData icon;

  const AssignmentCard({
    super.key,
    required this.type,
    required this.title,
    required this.deadline,
    required this.isCompleted,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Simple logic to check if this is the quiz to open
        if (title == 'Quiz Review 01') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const QuizScreen(),
            ),
          );
        } else if (title.contains('Tugas 01')) {
           Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AssignmentDetailScreen(),
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  type,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(
                Icons.check_circle,
                color: isCompleted ? Colors.green : Colors.grey[400],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.black87,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Tenggat Waktu : $deadline',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
      ),
    );
  }
}
