import 'package:go_router/go_router.dart';

import '../features/contact/contact_screen.dart';
import '../features/home/home_screen.dart';

class AppRoutes {
  static const home = '/home';
  static const contact = '/contact';

  static final router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: contact,
        builder: (context, state) => const ContactScreen(),
      ),
    ],
  );
}