import 'package:flutter/material.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.signal_wifi_off,
              size: 50,
              color: Colors.red,
            ),
            SizedBox(height: 16),
            Text(
              'No hay conexión a Internet',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
