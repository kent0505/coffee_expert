import 'package:go_router/go_router.dart';
export 'package:go_router/go_router.dart';

import '../../features/home/pages/contact_page.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/home/pages/settings_page.dart';
import '../../features/recipes/pages/add_recipe_page.dart';
import '../../features/recipes/pages/recipe_detail_page.dart';
import '../../features/recipes/pages/recipes_page.dart';
import '../../features/splash/onboard_page.dart';
import '../../features/splash/splash_page.dart';
import '../../features/varieties/pages/varieties_page.dart';
import '../../features/varieties/pages/variety_detail_page.dart';
import '../models/recipe.dart';
import '../models/variety.dart';

class Routes {
  static String onboard = '/onboard';
  static String home = '/home';
  static String settings = '/settings';
  static String contact = '/contact';
  static String recipes = '/recipes';
  static String addRecipe = '/addRecipe';
  static String recipeDetail = '/recipeDetail';
  static String varieties = '/varieties';
  static String varietyDetail = '/varietyDetail';
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
    GoRoute(
      path: Routes.recipes,
      builder: (context, state) => const RecipesPage(),
    ),
    GoRoute(
      path: Routes.addRecipe,
      builder: (context, state) => const AddRecipePage(),
    ),
    GoRoute(
      path: Routes.recipeDetail,
      builder: (context, state) => RecipeDetailPage(
        recipe: state.extra as Recipe,
      ),
    ),
    GoRoute(
      path: Routes.varieties,
      builder: (context, state) => const VarietiesPage(),
    ),
    GoRoute(
      path: Routes.varietyDetail,
      builder: (context, state) => VarietyDetailPage(
        variety: state.extra as Variety,
      ),
    ),
  ],
);
