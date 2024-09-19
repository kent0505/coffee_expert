import 'package:go_router/go_router.dart';
export 'package:go_router/go_router.dart';

import '../../features/home/pages/contact_page.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/home/pages/settings_page.dart';
import '../../features/splash/onboard_page.dart';
import '../../features/splash/splash_page.dart';

class Routes {
  static String onboard = '/onboard';
  static String home = '/home';
  static String settings = '/settings';
  static String contact = '/contact';
}

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: Routes.onboard,
      builder: (context, state) => const OnboardPage(),
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: Routes.settings,
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: Routes.contact,
      builder: (context, state) => const ContactPage(),
    ),
  ],
);
