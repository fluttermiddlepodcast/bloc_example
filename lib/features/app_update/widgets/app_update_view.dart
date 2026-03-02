import 'package:flutter/material.dart';

class AppUpdateView extends StatelessWidget {
  final String message;
  final bool isForceUpdate;
  final VoidCallback onUpdate;
  final VoidCallback onSkip;

  const AppUpdateView({
    required this.message,
    required this.isForceUpdate,
    required this.onUpdate,
    required this.onSkip,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.update_rounded,
            size: 128,
          ),
          SizedBox(height: 20),
          Text(
            'Доступна новая версия',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: Size(
                double.infinity,
                50,
              ),
            ),
            child: Text('Обновить'),
          ),
          if (!isForceUpdate) ...[
            SizedBox(height: 10),
            TextButton(
              onPressed: onSkip,
              child: Text('Позже'),
            ),
          ],
        ],
      ),
    );
  }
}
