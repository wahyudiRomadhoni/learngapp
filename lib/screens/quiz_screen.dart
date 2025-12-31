import 'package:flutter/material.dart';
import 'class_detail_screen.dart'; // For navigation

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int? selectedOptionIndex;
  final Map<int, int> _userAnswers = {};
  
  // Mock Data: 5 Questions
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Radio button dapat digunakan untuk menentukan ?',
      'options': ['Jenis Kelamin', 'Alamat', 'Hobby', 'Riwayat Pendidikan', 'Umur'],
      'correct': 0,
    },
    {
      'question': 'Manakah yang BUKAN merupakan prinsip User Interface Design?',
      'options': ['Consistency', 'Complexity', 'Feedback', 'Visibility', 'Affordance'],
      'correct': 1,
    },
    {
      'question': 'Untuk membuat jarak antar widget secara vertikal di Flutter, widget apa yang biasa digunakan?',
      'options': ['Row', 'Column', 'SizedBox', 'Container', 'Padding'],
      'correct': 2,
    },
    {
      'question': 'Widget dasar untuk menampilkan teks di Flutter adalah?',
      'options': ['Label', 'TextView', 'Text', 'String', 'Word'],
      'correct': 2,
    },
    {
      'question': 'Scaffold di Flutter berfungsi sebagai?',
      'options': ['Kerangka dasar aplikasi material', 'Tombol navigasi', 'Widget gambar', 'Animasi transisi', 'Database lokal'],
      'correct': 0,
    },
  ];

  void _nextQuestion() {
    // Save current answer
    if (selectedOptionIndex != null) {
      _userAnswers[currentQuestionIndex] = selectedOptionIndex!;
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        // Restore previous answer if exists
        selectedOptionIndex = _userAnswers[currentQuestionIndex];
      });
    } else {
      // Calculate Score
      int score = 0;
      int totalQuestions = questions.length;
      
      _userAnswers.forEach((index, answer) {
        if (questions[index]['correct'] == answer) {
          score++;
        }
      });
      
      double finalScore = (score / totalQuestions) * 100;

      // Finish Quiz
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Selesai'),
          content: Text('Kuis telah selesai!\nNilai Anda: ${finalScore.toStringAsFixed(0)} / 100'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                Navigator.pop(context); // Go back to Detail Screen
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _goToQuestion(int index) {
      // Save valid selection before moving
      if (selectedOptionIndex != null) {
         _userAnswers[currentQuestionIndex] = selectedOptionIndex!;
      }

      setState(() {
        currentQuestionIndex = index;
        selectedOptionIndex = _userAnswers[index];
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC62828), // Red header
        toolbarHeight: 80,
        title: Column(
          children: [
            const Text(
              'Quiz Review 1',
              style: TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end, // Timer on right?
              // Design shows timer on right, title centered. 
              // Standard AppBar title is left or center. 
              // We'll use a Row for custom layout if needed, but Title + Actions is easier.
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: const [
                 Icon(Icons.timer_outlined, color: Colors.white),
                 SizedBox(width: 8),
                 Text('15 : 00', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('Keluar Kuis?'),
                content: const Text('Apakah anda yakin ingin keluar dari kuis ini?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx), // Cancel
                    child: const Text('Batal'),
                  ),
                   TextButton(
                    onPressed: () {
                      Navigator.pop(ctx); // Close dialog
                      Navigator.pop(context); // Close screen
                    },
                    child: const Text('Ya, Keluar'),
                  ),
                ],
              ),
            );
          },
        ),
        automaticallyImplyLeading: false, 
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question Navigation Circles
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(questions.length, (index) {
                  bool isActive = index == currentQuestionIndex;
                  return GestureDetector(
                    onTap: () => _goToQuestion(index),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isActive ? Colors.black : Colors.transparent,
                        border: Border.all(color: Colors.black),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: isActive ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 30),

            // Soal Nomor Text
            Text(
              'Soal Nomor ${currentQuestionIndex + 1} / ${questions.length}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),

            // Question Text
            Text(
              questions[currentQuestionIndex]['question'],
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 30),

            // Options
            ...List.generate(questions[currentQuestionIndex]['options'].length, (index) {
              String optionText = questions[currentQuestionIndex]['options'][index];
              String optionLabel = String.fromCharCode(65 + index); // A, B, C...
              bool isSelected = selectedOptionIndex == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOptionIndex = index;
                    // Auto-save on selection to prevent data loss if moving via top circles without 'Next'
                    _userAnswers[currentQuestionIndex] = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFEF5350) : Colors.grey[100], // Red if selected
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: isSelected ? [
                       BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      )
                    ] : [],
                  ),
                  child: Row(
                    children: [
                      Text(
                        '$optionLabel. ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.black : Colors.black87,
                        ),
                      ),
                      Expanded(
                        child: Text(
                           optionText,
                           style: TextStyle(
                             color: isSelected ? Colors.black : Colors.black87,
                           ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 20),
            
            // Next Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: _nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200], // As per design roughly light grey or white
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(currentQuestionIndex == questions.length - 1 ? 'Selesai' : 'Soal Selanjutnya nya.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
