import 'dart:core';
import 'package:careexam/model/QuestionS.dart';

class CommonS {

  final String res_num;
  final String res_result;
  final String res_message;
  final String res_datetime;
  final String? res_total_count;
  final List<QuestionS> res_data;

  CommonS({
    required this.res_num,
    required this.res_result,
    required this.res_message,
    required this.res_datetime,
    required this.res_total_count,
    required this.res_data,
  });

  factory CommonS.fromJson(Map<String, dynamic> json) {
    var dataList = json['res_data'] as List;
    var resData = dataList.map<QuestionS>((e)=>QuestionS.fromJson(e)).toList();
    return CommonS(
      res_num: json['res_num'] as String,
      res_result: json['res_result'] as String,
      res_message: json['res_message'] as String,
      res_datetime: json['res_datetime'] as String,
      res_total_count: json['res_total_count'] as String,
      res_data : resData
    );
  }
}