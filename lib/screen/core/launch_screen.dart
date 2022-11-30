import 'package:flutter/material.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3 ), (){
      bool loggedIn = SharedPrefController().getValueFor<bool>(PrefKeys.loggedIn.name)??false;
      String route = loggedIn ? '/bottom_navigation_screen' : '/login_screen';
      Navigator.pushReplacementNamed(context,route );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              Color(0xFFFA076E8),
              Color(0xFFFA076E8)
            ]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logo.png'),
          ],
        ),
      ),
    );
  }
}
