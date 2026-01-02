import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'home_page.dart';
import 'login_page.dart';

// TODO: Replace with your actual Supabase credentials
const String supabaseUrl = 'https://sqvwymmzfajrugzlxiso.supabase.co';
const String supabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNxdnd5bW16ZmFqcnVnemx4aXNvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjcyNDQ4MTEsImV4cCI6MjA4MjgyMDgxMX0.KyjyWN19IL0GqpeHAAhmrAP3ymfb_3U4Jty1_ba3i4s';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Supabase Auth',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6B4EFF), // Modern purple/indigo seed
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6B4EFF),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: supabase.auth.currentSession != null
          ? const HomePage()
          : const LoginPage(),
    );
  }
}
