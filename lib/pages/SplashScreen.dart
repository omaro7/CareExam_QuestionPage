import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({required Key key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

    //iOS에서 앱이 실행된 후, 상태바(Status Bar) 표시되지 않는 버그
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    initialization();
  }

  void initialization() async {
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Container(
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            //01.배경 lottie
            Lottie.asset(
              "assets/lottie/bg_02_pink.json",            //배경 https://assets4.lottiefiles.com/packages/lf20_OXZeQi.json",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
              repeat: true,
              animate: true,
            ),
            //02.하단 0.9 위치에 곰돌이 로딩 lottie
            Align(
              alignment: Alignment(0.0, 0.9),
              child: Lottie.asset(
                "assets/lottie/loading_bear.json",      //곰돌이 https://assets5.lottiefiles.com/private_files/lf30_lfmwjU.json",
                height: 100,
                width: 100,
                fit: BoxFit.cover,
                repeat: true,
                animate: true,
              ),
            ),
            //03.중앙 글자
            Align(
              alignment: Alignment(0.0, -0.1),
              child: Text(
                "요양보호사 자격증 취득하기",
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 24,
                  color: Color(0xffffffff),
                ),
              ),
            ),
            //04.휠체어 lottie
            Align(
              alignment: Alignment(-0.2, -0.7),
              child: Lottie.asset(
                "assets/lottie/wheelchair.json",    //휠체어 "https://desky-support.nyc3.digitaloceanspaces.com/flutter_viz/uploads/4399/wheelchair.json","assets/lottie/wheelchair.json",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
                repeat: true,
                animate: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}