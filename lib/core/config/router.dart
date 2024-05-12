import 'package:go_router/go_router.dart';

import '../../features/splash/splash_page.dart';
import '../../features/home/home_page.dart';
import '../../features/notes/pages/note_add_page.dart';
import '../../features/notes/pages/note_edit_page.dart';
import '../models/note.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/note_add',
      builder: (context, state) => const NoteAddPage(),
    ),
    GoRoute(
      path: '/note_edit',
      builder: (context, state) => NoteEditPage(
        note: state.extra as Note,
      ),
    ),
  ],
);
