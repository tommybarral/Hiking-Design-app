import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './models/greet_data.dart';
import './models/hiking_data.dart';
import './screens/hiking_details_screen.dart';
import './screens/home_screen.dart';
import './screens/profile_screen.dart';
import './screens/search_screen.dart';
import './screens/stats_screen.dart';
import './screens/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GreetData()),
        ChangeNotifierProvider(create: (context) => HikingData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const WelcomeScreen(),
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          HikingDetailsScreen.routeName: (context) => const HikingDetailsScreen(),
          ProfileScreen.routeName: (context) => const ProfileScreen(),
          SearchScreen.routeName: (context) => const SearchScreen(),
          StatsScreen.routeName: (context) => const StatsScreen(),
        },
      ),
    );
  }
}