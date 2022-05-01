// ignore_for_file: avoid_print

import 'package:clipboard/clipboard.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../data/data.dart';
import '../theme.dart';

class NewNotePage extends StatefulWidget {
  const NewNotePage({Key? key}) : super(key: key);

  @override
  _NewNotePageState createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  final _clearController = TextEditingController();
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController choicesEditingController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  List<String> notes = [];
  String note = "";

  String? comboBoxValue;

  DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();
    _clearController.addListener(() {
      if (_clearController.text.length == 1 && mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _clearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = context.watch<AppTheme>();
    return ScaffoldPage.scrollable(
      header: const PageHeader(title: Center(child: Text('Create New Note'))),
      children: [
        const SizedBox(height: 20),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Card(
            elevation: 15,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: selectedList.isNotEmpty
                      ? ListView.builder(
                          itemCount: selectedList['sections'].length,
                          itemBuilder: (BuildContext context, int index) {
                            List<dynamic> choices = selectedList['sections']
                                [index]['data']['choices'];
                            List<Widget> chips = [];
                            for (var i = 1; i < choices.length; i++) {
                              chips.add(
                                Chip.selected(
                                  text: Text(
                                      "${selectedList['sections'][index]['data']['choices'][i]}"),
                                  onPressed: () {},
                                ),
                              );
                            }
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${selectedList['sections'][index]['data']['title']}"
                                      ':',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(width: 10),
                                    Flexible(
                                      child: Row(
                                          children: choices
                                              .map((e) => Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Chip.selected(
                                                      onPressed: () {
                                                        setState(() {
                                                          noteController
                                                              .text = noteController
                                                                  .text +
                                                              e +
                                                              " " +
                                                              selectedList['sections']
                                                                          [
                                                                          index]
                                                                      ['data']
                                                                  ['postFix'] +
                                                              " ";
                                                        });
                                                      },
                                                      text: Text(e),
                                                    ),
                                                  ))
                                              .toList()),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                const Divider(),
                                const SizedBox(height: 10),
                                //Row(children: notes.map((e) => Text(e)).toList()),
                              ],
                            );
                          })
                      : const Center(
                          child: Text(
                            'No template selected! Select a template from the TEMPLATES page or create one.',
                          ),
                        ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: TextFormBox(
                    onTap: () {
                      FlutterClipboard.copy(noteController.text);
                      showTopSnackBar(
                          context,
                          const CustomSnackBar.success(
                              message: "Note copied to clipboard"));
                    },
                    readOnly: true,
                    controller: noteController,
                    minLines: 20,
                    maxLines: 50,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<String> splitChoices(String delimitedString) {
    List<String> parts = delimitedString.split(',');
    return parts;
  }
}
