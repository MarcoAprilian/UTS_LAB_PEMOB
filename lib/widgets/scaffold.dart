import 'package:flutter/material.dart';
import 'gradient_background.dart';

class QuizScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final bool showBackButton;

  const QuizScaffold({
    super.key,
    required this.child,
    required this.title,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Row(
                children: [
                  if (showBackButton)
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'CustomFont',
                      ),
                      textAlign: showBackButton ? TextAlign.center : TextAlign.start,
                    ),
                  ),
                  if (showBackButton)
                    const SizedBox(width: 48),
                ],
              ),
            ),
            const Divider(color: Colors.white54, height: 1),
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
