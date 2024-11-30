import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => const ContactScreen());
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('ContactScreen'),
      ),
    );
  }
}