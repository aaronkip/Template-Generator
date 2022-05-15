import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:tempgen/helpers/firebase_helper.dart';
import 'package:tempgen/theme.dart';

import '../data/data.dart';

class TemplateCard extends StatefulWidget {
  final String docId;
  final int index;
  final String title;
  final String postFix;
  final List<dynamic> choices;
  final Map<String, dynamic> template;
  const TemplateCard(
      {Key? key,
      required this.docId,
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
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = context.watch<AppTheme>();
    return Card(
      elevation: 8.0,
      child: SizedBox(
        height: 70,
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
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RadioButton(
                checked: _isSelected,
                onChanged: (bool value) {
                  setState(() {
                    selectedIndex = value ? widget.index : 0;
                    if (selectedIndex == widget.index) {
                      selectedList = widget.template;
                    }

                    ///TODO: Add RX Component
                    _isSelected = value;
                  });
                },
              ),
              GestureDetector(
                onTap: () {
                  FirebaseHelper().deleteTemplate(widget.docId);
                },
                child: Icon(
                  FluentIcons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
