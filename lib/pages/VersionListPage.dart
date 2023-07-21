import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:careexam/class/Globals.dart' as globals;
import 'package:careexam/class/Init.dart';
import '../model/QuestionS.dart';

class VersionListPage extends StatefulWidget {
  const VersionListPage() : super(key: null);
  @override
  _VersionListState createState() => _VersionListState();
}

class _VersionListState extends State<VersionListPage> {

  late Future<List<QuestionS>> mVersionList;
  bool _isExamEnabled = false;

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
      backgroundColor: Color(0xffedecec),
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.fromLTRB(16, 30, 16, 16),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              color: Color(0xff3a57e8),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.zero,
              border: Border.all(color: Color(0x4d9e9e9e), width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Lottie.asset(
                  "assets/lottie/walking_coffee_time.json",
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                  repeat: true,
                  animate: true,
                ),
                Column(
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
                          fontSize: 24,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
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
                    Container(
                      width: 100,
                      height: 20,
                      child:SwitchListTile(
                        title: const Text('#1'),
                        value: _isExamEnabled,
                        onChanged: (value) {
                          setState((){
                            _isExamEnabled = value;
                          });
                        },
                        activeColor: Color(0xff82e83a),
                        activeTrackColor: Color(0xffffffff),
                        inactiveThumbColor: Color(0xff9e9e9e),
                        inactiveTrackColor: Color(0xffe0e0e0),
                      ),
                    ),
                    Text(
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
                    Container(
                      width: 100,
                      height: 20,
                      child:SwitchListTile(
                        title: const Text('#2'),
                        value: _isExamEnabled,
                        onChanged: (value) {
                          setState((){
                            _isExamEnabled = value;
                          });
                        },
                        activeColor: Color(0xff82e83a),
                        activeTrackColor: Color(0xffffffff),
                        inactiveThumbColor: Color(0xff9e9e9e),
                        inactiveTrackColor: Color(0xffe0e0e0),
                      ),
                    ),
                    Text(
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
                    Container(
                      width: 100,
                      height: 20,
                      child:SwitchListTile(
                        title: const Text('#3'),
                        value: _isExamEnabled,
                        onChanged: (value) {
                          setState((){
                            _isExamEnabled = value;
                          });
                        },
                        activeColor: Color(0xff82e83a),
                        activeTrackColor: Color(0xffffffff),
                        inactiveThumbColor: Color(0xff9e9e9e),
                        inactiveTrackColor: Color(0xffe0e0e0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(16, 200, 16, 16),
            padding: EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7000000000000001,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: SingleChildScrollView(
                child: FutureBuilder<List<QuestionS>>(
                  future: getVersionList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print(snapshot.data?.length); // question
                      return ListView.builder(
                        shrinkWrap: true,         // 미지정시, size 에러 발생함.
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index){
                          QuestionS questionS = snapshot.data![index];
                          return Container(
                              //width: 120,
                              //height: 40,
                              child:Card(
                                child: ListTile(
                                  title: Text(questionS.res_be_version.toString()),
                                ),
                              ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  },
                ),

                /*
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 16,
                      width: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(0),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0x343a57e8),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.work_outlined,
                            color: Color(0xff3a57e8),
                            size: 24,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              "Company ",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xff808080),
                      height: 16,
                      thickness: 0.1,
                      indent: 0,
                      endIndent: 0,
                    ),
                    SizedBox(
                      height: 16,
                      width: 16,
                    ),
                  ],
                ),
                 */
              ),
            ),
          ),
        ],
      ),
    );
  }
}
