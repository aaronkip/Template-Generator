class Template {
  String title;
  String postFix;
  List<dynamic> choices;

  Template({required this.title, required this.postFix, required this.choices});

  factory Template.fromJSon(Map<String, dynamic> temp) {
    return Template(
        title: temp['data']['title'],
        postFix: temp['data']['postFix'],
        choices: temp['data']['choices']);
  }
}
