import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:careexam/class/Globals.dart' as globals;
import 'package:careexam/class/Init.dart';
import '../model/QuestionS.dart';
import 'package:careexam/pages/QuestionPage.dart';

enum SWITCH_TYPE{
  ANSWER,
  RANDOM,
  EXAM
}

bool _isAnswerEnabled = false;
bool _isRandomEnabled = false;
bool _isExamEnabled = false;


class VersionListPage extends StatefulWidget {
  const VersionListPage() : super(key: null);
  @override
  _VersionListState createState() => _VersionListState();
}

class _VersionListState extends State<VersionListPage> {

  late Future<List<QuestionS>> mVersionList;

  @override
  void initState() {
    //setVersionList();

    super.initState();
  }

  /*
  setVersionList() async {
    //Set<QuestionS> tmpVersionList = globals.mQuestionList.cast<QuestionS>().toSet();
    //mVersionList = tmpVersionList.toList() as Future<List<QuestionS>>;

    Set<QuestionS> tmpVersionList = globals.mQuestionList.cast<QuestionS>().toSet();
    mVersionList = tmpVersionList.toList();

    Logger logger = Logger();
    logger.d(mVersionList.toString());
    logger.d(mVersionList.length);
  }
  */

  Future<List<QuestionS>> getVersionList() async{
    Set<QuestionS> tmpVersionList = globals.mQuestionList.cast<QuestionS>().toSet();
    Logger logger = Logger();
    logger.d(tmpVersionList.length);
    logger.d(tmpVersionList.first.res_be_version.toString());
    return tmpVersionList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,  //투명
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "야! 너두 자격증 딸 수 있어!",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon:Icon(Icons.arrow_back, size: 24, color:Colors.white),
          onPressed:(){
            Navigator.of(context).pop();
          }
        ),
      ),
      extendBodyBehindAppBar: true,   //body 위에 appbar
      body: Stack(
        alignment: Alignment.topLeft,
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
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.fromLTRB(16, 90, 16, 16),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0, 6, 16, 0),
                padding: EdgeInsets.all(0),
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
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
                  padding: EdgeInsets.all(0),
                  child:
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "요양보호사 자격증 취득하기",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Text(
                          "누구나 쉽게 요양보호사 자격증을 취득할 수 있다",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
                  padding: EdgeInsets.all(0),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          "정답노출모드",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xffffffff),
                          ),
                        ),
                        Switch(
                          value: _isAnswerEnabled,
                          onChanged: (value) {
                            setState((){
                              checkSwitch(SWITCH_TYPE.ANSWER, value);
                            });
                          },
                          activeColor: Color(0xff82e83a),
                          activeTrackColor: Color(0xffffffff),
                          inactiveThumbColor: Color(0xff9e9e9e),
                          inactiveTrackColor: Color(0xffe0e0e0),
                        ),
                        const Text(
                          "랜덤항목",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xffffffff),
                          ),
                        ),
                        Switch(
                          value: _isRandomEnabled,
                          onChanged: (value) {
                            setState((){
                              checkSwitch(SWITCH_TYPE.RANDOM, value);
                            });
                          },
                          activeColor: Color(0xff82e83a),
                          activeTrackColor: Color(0xffffffff),
                          inactiveThumbColor: Color(0xff9e9e9e),
                          inactiveTrackColor: Color(0xffe0e0e0),
                        ),
                        const Text(
                          "시험모드",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xffffffff),
                          ),
                        ),
                        Switch(
                            value: _isExamEnabled,
                            onChanged: (value) {
                              setState((){
                                checkSwitch(SWITCH_TYPE.EXAM, value);
                              });
                            },
                            activeColor: Color(0xff82e83a),
                            activeTrackColor: Color(0xffffffff),
                            inactiveThumbColor: Color(0xff9e9e9e),
                            inactiveTrackColor: Color(0xffe0e0e0),
                          ),
                      ],
                    ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(16, 300, 16, 16),
            padding: EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6000000000000001,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child:
              Container(
                padding: EdgeInsets.all(0),
                height: MediaQuery.of(context).size.height * 0.5900000000000001,
                child:FutureBuilder<List<QuestionS>>(
                  future: getVersionList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print(snapshot.data?.length); // question
                      return Align(
                          alignment: Alignment.topCenter,
                          child:ListView.builder(
                            shrinkWrap: false,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index){
                              QuestionS questionS = snapshot.data![index];
                              return Container(
                                  child: InkWell(
                                    onTap: () {
                                      showToast("요양보호사 버전 ${questionS.res_be_version} tapped");
                                      Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => QuestionPage(key:UniqueKey(), version:questionS.res_be_version.toString(), isAnswerMode: _isAnswerEnabled, isRandomMode:_isRandomEnabled, isExamMode: _isExamEnabled)),
                                      );
                                    },
                                    child:Card(
                                      child: ListTile(
                                        title: Text(questionS.res_be_version.toString()),
                                      ),
                                    ),
                                  ),
                              );
                            },
                          ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
/**
 * 스위치버튼 선택 시, 처리
 * 정답모드 선택 시, 시험모드 false
 * 시험모드 선택 시, 정답모드 false
 */
void checkSwitch(SWITCH_TYPE switchType, bool v){
  if(SWITCH_TYPE.ANSWER == switchType){ //정답모드
    _isAnswerEnabled = v;
    _isExamEnabled = !v;
  }else if(SWITCH_TYPE.RANDOM == switchType){ //랜덤모드
    _isRandomEnabled = v;
    _isExamEnabled = !v;
  }else if(SWITCH_TYPE.EXAM == switchType){ //시험모드
    _isExamEnabled = v;
    _isAnswerEnabled = !v;
    _isRandomEnabled = !v;
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