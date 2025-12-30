import 'package:flutter/material.dart';
import '../widgets/header_section.dart';
import '../constants.dart';

/// Dashboard Screen
///
/// This screen displays the main dashboard with a header section.
/// It contains an AppBar with a greeting and user information,
/// and a body with the main header section.
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD32F2F),
        foregroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hello',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            Text(
              'Wahyudi Romadhoni',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [HeaderSection()],
          ),
        ),
      ),
    );
  }
}
