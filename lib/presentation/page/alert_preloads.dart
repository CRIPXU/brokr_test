import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AlertPreloads extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 8,
          backgroundColor: Colors.deepPurple.shade100,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.deepPurple),
        ),
      ),
    );
  }
}

