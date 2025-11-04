import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../router/app_router.dart';
import '../widgets/reusable_button.dart';
import '../widgets/scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final quizProvider = Provider.of<QuizProvider>(context, listen: false);

    return QuizScaffold(
      title: 'Selamat Datang!',
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('assets/images/quizilus1.jpg'),
              ),
              const SizedBox(height: 40),

              const Text(
                'Masukkan Nama Anda untuk Memulai!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              TextField(
                controller: nameController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Nama Pengguna',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  hintText: 'Misalnya: Budi',
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              ReusableButton(
                text: 'Mulai Kuis!',
                onPressed: () {
                  final name = nameController.text.trim();
                  if (name.isNotEmpty) {
                    quizProvider.resetQuiz();
                    quizProvider.setPlayerName(name);
                    Navigator.of(context).pushNamed(AppRouter.quizRoute);
                  } else {
                    // Perlu Scaffold di atas QuizScaffold untuk showSnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Nama tidak boleh kosong!')),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
