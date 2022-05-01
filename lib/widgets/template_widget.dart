import 'package:fluent_ui/fluent_ui.dart';

class TemplateCard extends StatelessWidget {
  final String title;
  final String postFix;
  final List<dynamic> choiceExample;
  const TemplateCard(
      {Key? key,
      required this.title,
      required this.postFix,
      required this.choiceExample})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      child: ListTile(
        leading: const Icon(FluentIcons.title_mirrored),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text("Extract: " +
            choiceExample.first.toString() +
            " " +
            postFix +
            "..."),
        trailing: RadioButton(
          checked: false,
          onChanged: (bool value) {},
        ),
      ),
    );
  }
}
