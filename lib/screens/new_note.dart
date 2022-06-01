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
  Map<String, dynamic> _sections = {
    "data": [],
  };
  List<String> choices = [];

  String? comboBoxValue;

  DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();
    _clearController.addListener(() {
      if (_clearController.text.length == 1 && mounted) setState(() {});
    });
  }

  void updateNotes(String prefix, String choice) {
    bool prefixExists = false;

    ///1. Looping through sections map
    if (_sections['data'].length == 0) {
      print("Sections empty");
      _sections['data'].add({
        'prefix': prefix,
        'choice': choice,
      });
    } else {
      for (int i = 0; i < _sections['data'].length; i++) {
        if (_sections['data'][i]['prefix'] == prefix) {
          prefixExists = true;
          _sections['data'][i]['choice'] =
              _sections['data'][i]['choice'] + ", " + choice;
        } else {
          prefixExists = prefixExists ? true : false;
        }
      }
      if (!prefixExists) {
        _sections['data'].add({
          'prefix': prefix,
          'choice': choice,
        });
      }
    }

    print(_sections);

    ///2. Assigning map values to noteController
    note = "";
    for (int i = 0; i < _sections['data'].length; i++) {
      note = note +
          _sections['data'][i]['prefix'] +
          " " +
          _sections['data'][i]['choice'] +
          "\n";
    }
    print(note);
    setState(() {
      noteController.clear();
      noteController.text = note;
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
                                                        setState(
                                                          () {
                                                            /* noteController
                                                              .text = noteController
                                                                  .text +
                                                              e +
                                                              " " +
                                                              selectedList['sections']
                                                                          [
                                                                          index]
                                                                      ['data']
                                                                  ['postFix'] +
                                                              " \n";*/
                                                            /*_notes['data'].add({
                                                            selectedList['sections']
                                                                            [
                                                                            index]
                                                                        ['data']
                                                                    ['postFix']
                                                                .toString(): e
                                                          });*/
                                                            updateNotes(
                                                                selectedList['sections'][index]
                                                                            [
                                                                            'data']
                                                                        [
                                                                        'postFix']
                                                                    .toString(),
                                                                e);
                                                          },
                                                        );
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
                    controller: noteController,
                    minLines: 10,
                    maxLines: 200,
                  ),
                ),
                Center(
                  child: Chip.selected(
                    semanticLabel: "Copy To Clipboard",
                    image: const CircleAvatar(
                      radius: 12.0,
                      child: Icon(
                        FluentIcons.copy,
                        size: 14.0,
                      ),
                    ),
                    text: const Text('Copy To Clipboard'),
                    onPressed: () {
                      FlutterClipboard.copy(noteController.text);
                      showTopSnackBar(
                          context,
                          const CustomSnackBar.success(
                              message: "Note copied to clipboard"));
                    },
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
