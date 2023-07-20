import 'package:careexam/pages/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:careexam/pages/SplashScreen.dart';
import 'package:careexam/class/Init.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //Init.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      //future: Future.delayed(const Duration(seconds: 5)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: SplashScreen(key: UniqueKey()));
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: MainPage(key: UniqueKey())
            ,
            initialRoute: '/',
            /*
            getPages: [
              GetPage(
                name: '/',
                page: () => MainPage(key: UniqueKey(), title:"Main", tabIndex:0),
              ),
              GetPage(
                name: '/one',
                page: () => Page1(),
              ),
              GetPage(
                name: '/two',
                page: () => Page2(),
              ),
              GetPage(
                name: '/three',
                page: () => Page3(),
              ),
              GetPage(
                name: '/four',
                page: () => Page4(),
              ),
            ],
             */
          );
        }
      },
    );
  }
}