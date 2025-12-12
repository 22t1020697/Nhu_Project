import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody());
  }

  Widget myBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Xin chào mọi người!",
          style: TextStyle(color: Colors.red, fontSize: 50),
        ),
        Icon(Icons.heart_broken, size: 100, color: Colors.red),
        Text(
          "Lập trình di động - nhóm 3",
          style: TextStyle(fontSize: 30, color: Colors.blue),
        ),
      ],
    );
  }
}
