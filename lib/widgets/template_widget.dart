import 'package:flutter/material.dart';

class TemplateCard extends StatelessWidget {
  final String title;
  final String postFix;
  final List<String> choiceExample;
  const TemplateCard(
      {Key? key,
      required this.title,
      required this.postFix,
      required this.choiceExample})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 15.0,
        child: ListTile(
          leading: const Icon(Icons.title),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(choiceExample.first + " " + postFix),
        ));
  }
}
