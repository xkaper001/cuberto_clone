import 'package:flutter/material.dart';

import 'utils/routes.dart';
import 'utils/style.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Ayan\'s Portfolio',
      theme: AppStyles.theme,
      routerConfig: AppRoutes.router,
    );
  }
}
