import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const IQTestApp());
}

class IQTestApp extends StatelessWidget {
  const IQTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IQ Test Quiz',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF5F6FA),
      ),
      home: const QuizHomeScreen(),
    );
  }
}

class QuizHomeScreen extends StatefulWidget {
  const QuizHomeScreen({super.key});

  @override
  State<QuizHomeScreen> createState() => _QuizHomeScreenState();
}

class _QuizHomeScreenState extends State<QuizHomeScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  int? selectedAnswerIndex;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '৩, ৬, ১২, ২৪, ... এর পরবর্তী সংখ্যাটি কত?',
      'options': ['৩০', '৩৬', '৪৮', '৫৪'],
      'answer': 2,
    },
    {
      'question': 'যদি CAT = 24
