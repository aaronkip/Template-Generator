import 'package:fluent_ui/fluent_ui.dart';
import 'package:tempgen/data/data.dart';

class TemplateCard extends StatefulWidget {
  final int index;
  final String title;
  final String postFix;
  final List<dynamic> choices;
  final Map<String, dynamic> template;
  const TemplateCard(
      {Key? key,
      required this.index,
      required this.title,
      required this.postFix,
      required this.choices,
      required this.template})
      : super(key: key);

  @override
  State<TemplateCard> createState() => _TemplateCardState();
}

class _TemplateCardState extends State<TemplateCard> {
  setTemplate() {
    selectedList = widget.template;
  }

  @override
  void initState() {
    if (widget.index == selectedIndex) {
      setState(() {
        setTemplate();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      child: ListTile(
        leading: const Icon(FluentIcons.title_mirrored),
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text("Extract: " +
            widget.choices.first.toString() +
            " " +
            widget.postFix +
            "..."),
        trailing: RadioButton(
          checked: widget.index == selectedIndex ? true : false,
          onChanged: (bool value) {
            setState(() {
              selectedIndex = value ? widget.index : 0;
            });
          },
        ),
      ),
    );
  }
}
