import 'dart:core';
import 'dart:convert';
import 'package:careexam/model/QuestionS.dart';
import 'package:careexam/class/Globals.dart' as globals;
import 'package:http/http.dart' as http;

//Init.instance.initialize()
//Init.instance.fetchPost()

class Init {
  Init._();
  static final instance = Init._();

  Future<List<QuestionS>> fetchPost() async {
    var url = Uri.parse('http://app.goms.co.kr/exam/app_request/care_all_question_list_request.php');
    var response = await http.get(url);
    if (response.statusCode == 200) {

      Map<String, dynamic> result = jsonDecode(response.body);

      List<QuestionS> questionList = List<dynamic>.from(result['res_data'])
          .map((i) => QuestionS.fromJson(i))
          .toList();

      globals.mQuestionList = questionList;

      return questionList;
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(const Duration(seconds: 5));
  }
}