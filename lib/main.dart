import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fooder/routes/app_routes.dart';
import 'package:fooder/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart'; // Import easy_localization package

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized(); // Ensure localization initialization
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('sw')], // Define supported locales
      path: 'assets/lang', // Path to your JSON files
      fallbackLocale: const Locale('en'), // Fallback locale
      child: const ProviderScope(child: MyApp()), // Wrap app with localization
    ),
  );
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light);

  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp(
      title: 'Fooder',
      theme: lightTheme,
      darkTheme: darkTheme,

      themeMode: themeMode,
      locale: context.locale, // Use the current locale
      supportedLocales: context.supportedLocales, // Get supported locales from easy_localization
      localizationsDelegates: context.localizationDelegates, // Get localization delegates from easy_localization
      initialRoute: AppRoutes.authPage, // Set initial route
      onGenerateRoute: AppRoutes.generateRoute, // Use AppRoutes for route generation
      debugShowCheckedModeBanner: false,
    );
  }
}