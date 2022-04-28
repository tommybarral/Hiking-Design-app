import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hiking_design_app/models/greet_data.dart';
import 'package:hiking_design_app/models/hiking_data.dart';
import 'package:hiking_design_app/screens/hiking_details_screen.dart';
import 'package:hiking_design_app/screens/home_screen.dart';
import 'package:hiking_design_app/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

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
        },
      ),
    );
  }
}