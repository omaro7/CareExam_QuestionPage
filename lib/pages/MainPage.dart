import 'package:careexam/pages/VersionListPage.dart';
import 'package:flutter/material.dart';
import 'package:careexam/class/Globals.dart' as globals;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:careexam/class/Init.dart';
import 'package:lottie/lottie.dart';
import '../model/QuestionS.dart';

class MainPage extends StatefulWidget {
  const MainPage({required Key key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  late Future<List<QuestionS>> questionList;
  late List<QuestionS> mVersionList;

  @override
  void initState() {

    //Logger logger = Logger();
    //logger.d(globals.mQuestionList.length);
    questionList = Init.instance.fetchPost();
    setQuestionList();
    super.initState();
  }

  setQuestionList() async {
    globals.mQuestionList = await questionList;

    Set<QuestionS> tmpVersionList = globals.mQuestionList.cast<QuestionS>().toSet();
    mVersionList = tmpVersionList.toList();

    Logger logger = Logger();
    logger.d(mVersionList.length);


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: SingleChildScrollView(
      child:Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
      alignment: Alignment.center,
      children: [
      //01.배경 lottie
      Lottie.asset(
        "assets/lottie/bg_full_screen_night.json",            //배경 https://assets4.lottiefiles.com/packages/lf20_OXZeQi.json",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
        repeat: true,
        animate: true,
      ),
     Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 60, 0, 0),
              child: Text(
                "야! 너두 자격증 딸 수 있어!",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontFamily: "spoqahansansneo",
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 24,
                  color: Color(0xffffffff),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 40, 10, 0),
              child:
              Lottie.asset(
                "assets/lottie/wheelchair.json",
                height: 80,
                width: 80,
                fit: BoxFit.cover,
                repeat: true,
                animate: true,
              ),
            ),
            GridView(
              padding: EdgeInsets.fromLTRB(16, 30, 16, 16),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 2,
              ),
              children: [
                Card(
                  margin: EdgeInsets.all(0),
                  color: Color(0xffffffff),
                  shadowColor: Color(0xff000000),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.all(0),
                        child: Lottie.asset(
                          "assets/lottie/walking_coffee_time.json",
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                          repeat: true,
                          animate: true,
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                        child: Text(
                          "요양보호사 기본정보",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 20,
                            color: Color(0xff000000),
                            height:1.2
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(0),
                  color: Color(0xffffffff),
                  shadowColor: Color(0xff000000),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.all(0),
                        child: Lottie.asset(
                          "assets/lottie/walking_avocado.json",
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                          repeat: true,
                          animate: true,
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                        child: Text(
                          "요양보호사 시험장소",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                              color: Color(0xff000000),
                              height:1.2
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(0),
                  color: Color(0xffffffff),
                  shadowColor: Color(0xff000000),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      print("요양보호사 기출문제 tapped");
                      showToast("요양보호사 기출문제 tapped");
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const VersionListPage()),
                      );
                    },
                    child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.all(0),
                        child: Lottie.asset(
                          "assets/lottie/walking_broccoli.json",
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                          repeat: true,
                          animate: true,
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                        child: Text(
                          "요양보호사 기출문제",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                              color: Color(0xff000000),
                              height:1.2
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ),
                Card(
                  margin: EdgeInsets.all(0),
                  color: Color(0xffffffff),
                  shadowColor: Color(0xff000000),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      print("tapped");
                    },
                    child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,

                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.all(0),
                        child: Lottie.asset(
                          "assets/lottie/walking_pothos.json",
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                          repeat: true,
                          animate: true,
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                        child: Text(
                          "요양보호사 저장문제",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                              color: Color(0xff000000),
                              height:1.2
                          ),
                        ),
                      ),
                    ],
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(0),
                  color: Color(0xffffffff),
                  shadowColor: Color(0xff000000),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.all(0),
                        child: Lottie.asset(
                          "assets/lottie/walking_taco.json",
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                          repeat: true,
                          animate: true,
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                        child: Text(
                          "요양보호사 다시보기",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                              color: Color(0xff000000),
                              height:1.2
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(0),
                  color: Color(0xffffffff),
                  shadowColor: Color(0xff000000),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.all(0),
                        child: Lottie.asset(
                          "assets/lottie/walking_french_fries.json",
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                          repeat: true,
                          animate: true,
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                        child: Text(
                          "요양보호사 그림문제",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                              color: Color(0xff000000),
                              height:1.2
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              color: Color(0xffffffff),
              shadowColor: Color(0xff000000),
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
                side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Lottie.asset(
                    "assets/lottie/walking_orange.json",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                    repeat: true,
                    animate: true,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Text(
                      "기출문제 전체풀기(랜덤)",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment(0.8, 0.0),
              child: Lottie.asset(
                "assets/lottie/toad.json",
                height: 80,
                width: 80,
                fit: BoxFit.cover,
                repeat: true,
                animate: true,
              ),
            ),
          ],
        ),
      ]),
      ),
    ),
    );
  }
}

/**
 * int leftDice = 1;
 * leftDice = Random().nextInt(6) + 1; // 1부터 6까지 랜덤 숫자
 * showToast('왼쪽: $leftDice, 오른쪽:$rightDice');
 */
void showToast(String message){
  Fluttertoast.showToast(
    msg:message,
    backgroundColor: Colors.white,
    textColor: Colors.amber[800],
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP
  );
}