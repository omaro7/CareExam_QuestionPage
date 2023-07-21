import 'package:flutter/material.dart';
import 'package:careexam/class/Globals.dart' as globals;
import 'package:logger/logger.dart';
import 'package:careexam/class/Init.dart';
import 'package:lottie/lottie.dart';
import '../model/QuestionS.dart';

class QuestionPage extends StatefulWidget {
  final String version;
  final bool isAnswerMode, isRandomMode, isExamMode;
  const QuestionPage({required Key key, required this.version, required this.isAnswerMode, required this.isRandomMode, required this.isExamMode}) : super(key: key);
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {

  late Future<List<QuestionS>> questionList;

  @override
  void initState() {

    Logger logger = Logger();
    logger.d("version : ${widget.version}, isAnswerMode : ${widget.isAnswerMode}, isRandomMode : ${widget.isRandomMode}, isExamMode : ${widget.isExamMode}");
    questionList = Init.instance.fetchPost();
    setQuestionList();
    super.initState();
  }

  setQuestionList() async {
    globals.mQuestionList = await questionList;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child:Scaffold(
        body: Center(
          child: FutureBuilder<List<QuestionS>>(
            future: questionList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index){
                    QuestionS questionS = snapshot.data![index];
                    return Card(
                        child: ListTile(
                          title: Text(questionS.res_be_question.toString()),
                        )
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}