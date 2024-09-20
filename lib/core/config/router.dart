import 'package:go_router/go_router.dart';
export 'package:go_router/go_router.dart';

import '../../features/cafes/pages/cafe_add_page.dart';
import '../../features/cafes/pages/cafe_detail_page.dart';
import '../../features/cafes/pages/cafe_edit_page.dart';
import '../../features/cafes/pages/cafes_page.dart';
import '../../features/home/pages/contact_page.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/home/pages/settings_page.dart';
import '../../features/news/pages/news_add_page.dart';
import '../../features/news/pages/news_detail_page.dart';
import '../../features/news/pages/news_edit_page.dart';
import '../../features/news/pages/news_page.dart';
import '../../features/recipes/pages/add_recipe_page.dart';
import '../../features/recipes/pages/edit_recipe_page.dart';
import '../../features/recipes/pages/recipe_detail_page.dart';
import '../../features/recipes/pages/recipes_page.dart';
import '../../features/splash/onboard_page.dart';
import '../../features/splash/splash_page.dart';
import '../../features/varieties/pages/varieties_page.dart';
import '../../features/varieties/pages/variety_detail_page.dart';
import '../models/cafe.dart';
import '../models/news.dart';
import '../models/recipe.dart';
import '../models/variety.dart';

class Routes {
  static String onboard = '/onboard';
  static String home = '/home';
  static String settings = '/settings';
  static String contact = '/contact';
  static String recipes = '/recipes';
  static String addRecipe = '/addRecipe';
  static String editRecipe = '/editRecipe';
  static String recipeDetail = '/recipeDetail';
  static String varieties = '/varieties';
  static String varietyDetail = '/varietyDetail';
  static String cafes = '/cafes';
  static String cafeDetail = '/cafeDetail';
  static String cafeAdd = '/cafeAdd';
  static String cafeEdit = '/cafeEdit';
  static String news = '/news';
  static String newsDetail = '/newsDetail';
  static String newsAdd = '/newsAdd';
  static String newsEdit = '/newsEdit';
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
      path: Routes.editRecipe,
      builder: (context, state) => EditRecipePage(
        recipe: state.extra as Recipe,
      ),
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
    GoRoute(
      path: Routes.cafes,
      builder: (context, state) => const CafesPage(),
    ),
    GoRoute(
      path: Routes.cafeAdd,
      builder: (context, state) => const CafeAddPage(),
    ),
    GoRoute(
      path: Routes.cafeDetail,
      builder: (context, state) => CafeDetailPage(
        cafe: state.extra as Cafe,
      ),
    ),
    GoRoute(
      path: Routes.cafeEdit,
      builder: (context, state) => CafeEditPage(
        cafe: state.extra as Cafe,
      ),
    ),
    GoRoute(
      path: Routes.news,
      builder: (context, state) => const NewsPage(),
    ),
    GoRoute(
      path: Routes.newsAdd,
      builder: (context, state) => const NewsAddPage(),
    ),
    GoRoute(
      path: Routes.newsEdit,
      builder: (context, state) => NewsEditPage(
        news: state.extra as News,
      ),
    ),
    GoRoute(
      path: Routes.newsDetail,
      builder: (context, state) => NewsDetailPage(
        news: state.extra as News,
      ),
    ),
  ],
);
