class QuestionS {
  final String? res_be_idx;
  final String? res_be_version;
  final String? res_be_class;
  final String? res_be_category;
  final String? res_class_name;
  final String? res_category_name;
  final String? res_be_num;
  final String? res_be_question;
  final String? res_be_question_path;
  final String? res_be_ask_type;
  final String? res_be_ask1;
  final String? res_be_ask2;
  final String? res_be_ask3;
  final String? res_be_ask4;
  final String? res_be_answer;
  final String? res_be_commentary;

  QuestionS({
    required this.res_be_idx,
    required this.res_be_version,
    required this.res_be_class,
    required this.res_be_category,
    required this.res_class_name,
    required this.res_category_name,
    required this.res_be_num,
    required this.res_be_question,
    required this.res_be_question_path,
    required this.res_be_ask_type,
    required this.res_be_ask1,
    required this.res_be_ask2,
    required this.res_be_ask3,
    required this.res_be_ask4,
    required this.res_be_answer,
    required this.res_be_commentary
  });

  factory QuestionS.fromJson(Map<String, dynamic> json) => QuestionS(
    res_be_idx: json['res_be_idx'] == null ? null : json['res_be_idx'] as String,
    res_be_version: json['res_be_version'] == null ? null : json['res_be_version'] as String,
    res_be_class: json['res_be_class'] == null ? null : json['res_be_class'] as String,
    res_be_category: json['res_be_category'] == null ? null : json['res_be_category'] as String,
    res_class_name: json['res_class_name'] == null ? null : json['res_class_name'] as String,
    res_category_name: json['res_category_name'] == null ? null : json['res_category_name'] as String,
    res_be_num: json['res_be_num'] == null ? null : json['res_be_num'] as String,
    res_be_question: json['res_be_question'] == null ? null : json['res_be_question'] as String,
    res_be_question_path: json['res_be_question_path']  == null ? null : json['res_be_question_path'] as String,
    res_be_ask_type: json['res_be_ask_type']  == null ? null : json['res_be_ask_type'] as String,
    res_be_ask1: json['res_be_ask1']  == null ? null : json['res_be_ask1'] as String,
    res_be_ask2: json['res_be_ask2']  == null ? null : json['res_be_ask2'] as String,
    res_be_ask3: json['res_be_ask3']  == null ? null : json['res_be_ask3'] as String,
    res_be_ask4: json['res_be_ask4']  == null ? null : json['res_be_ask4'] as String,
    res_be_answer: json['res_be_answer']  == null ? null : json['res_be_answer'] as String,
    res_be_commentary: json['res_be_commentary']  == null ? null : json['res_be_commentary'] as String,
  );

  @override
  bool operator == (Object other) =>
    identical(this, other) ||
        (other is QuestionS && res_be_version == other.res_be_version);

  @override
  int get hashCode => res_be_version.hashCode;

}