import 'package:flutter/material.dart';
import 'package:mobile/view/authentication/screens/login_screen.dart';
import 'package:mobile/view/authentication/screens/register_screen.dart';
import 'package:mobile/view/home/screens/HomeScreen.dart';
import 'package:mobile/view/onboarding/screens/onboarding_screen.dart';
import 'package:mobile/viewmodel/authentication_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {

  try {
    await Supabase.initialize(url: "https://yhdwiezkljkhdvswuynj.supabase.co", anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InloZHdpZXprbGpraGR2c3d1eW5qIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM0MDEzODAsImV4cCI6MjA3ODk3NzM4MH0.MnAkvhb2j06fZYfAyVPheMUGcTVCXK4KHXTJ6y3wOm0");
  }catch(e){
    print(e);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationViewmodel()),
      ],
      child: MaterialApp(
        initialRoute: Supabase.instance.client.auth.currentUser == null ? '/onboarding' : '/',
        routes: {
          '/onboarding': (context) => OnboardingScreen(),
          "/login": (context) => LoginScreen(),
          "/register": (context) => RegisterScreen(),
          "/": (context) => HomeScreen(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}