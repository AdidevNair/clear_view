import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoom_clone/firebase_options.dart';
import 'package:zoom_clone/screens/home_screen.dart';
import 'package:zoom_clone/screens/join_meeting_screen.dart';
import 'package:zoom_clone/screens/login_screen.dart';
import 'package:zoom_clone/screens/meeting_history_screen.dart';
import 'package:zoom_clone/screens/settings_screen.dart';
import 'package:zoom_clone/services/auth_methods.dart';
import 'package:zoom_clone/themes/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Conferencing App',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/join-meeting': (context) => const JoinMeetingScreen(),
        '/meeting-history': (context) => const MeetingHistoryScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
      //this persists user state, ie, on restarting the app,
      //it wont take you back to the log in screen again, if you're already logged in
      home: StreamBuilder(
        stream: AuthMethods().authChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) return const HomeScreen();

          return const LoginScreen();
        },
      ),
    );
  }
}
