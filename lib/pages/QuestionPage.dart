import 'package:flutter/material.dart';
import 'package:careexam/class/Globals.dart' as globals;
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