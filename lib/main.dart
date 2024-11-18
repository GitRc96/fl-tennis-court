import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tennis_court_app/firebase_options.dart';

import 'features/home/presentation/screen/home/home_page.dart';
import 'features/auth/presentation/screens/login/login_page.dart';
import 'features/auth/presentation/screens/welcome/welcome_page.dart';
import 'features/reserve/presentation/screens/reserve_page.dart';


 Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(options: 
   DefaultFirebaseOptions.currentPlatform);
   runApp(const TennisCourt());
 }
 
class TennisCourt extends StatefulWidget {
  const TennisCourt({super.key});

  @override
  State<TennisCourt> createState() => _TennisCourtState();
}

class _TennisCourtState extends State<TennisCourt> {

  String _rootPage = '/'; 

  void  getRootPage() async =>
    FirebaseAuth.instance.currentUser == null
      ? setState(() {
       _rootPage = '/'; 
      }) 
      : setState(() {
       _rootPage = '/home'; 
      }) ;

  @override
  void initState() {
    super.initState();
    getRootPage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tennis Court',
      debugShowCheckedModeBanner: false,
      // initialRoute: _rootPage,
      initialRoute: '/reserve',
      routes: {
        '/': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/reserve': (context) => const ReservePage()
      },
    );
  }
}

