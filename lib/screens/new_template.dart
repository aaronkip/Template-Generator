// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:tempgen/helpers/firebase_helper.dart';
import 'package:tempgen/theme.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../data/data.dart';

class NewTemplatePage extends StatefulWidget {
  const NewTemplatePage({Key? key}) : super(key: key);

  @override
  _NewTemplatePageState createState() => _NewTemplatePageState();
}

class _NewTemplatePageState extends State<NewTemplatePage> {
  final _clearController = TextEditingController();
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController choicesEditingController = TextEditingController();
  TextEditingController notePostfixController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String uid;
  String? comboBoxValue;

  DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();
    uid = auth.currentUser!.uid;
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
      header:
          const PageHeader(title: Center(child: Text('Create New Template'))),
      children: [
        const SizedBox(height: 20),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextFormBox(
                controller: nameEditingController,
                header: 'Name of Template',
                placeholder: 'Name of the template',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (text) {
                  if (text == null || text.isEmpty) return 'Name Required';
                  return null;
                },
                textInputAction: TextInputAction.next,
                prefix: const Padding(
                  padding: EdgeInsetsDirectional.only(start: 8.0),
                  child: Icon(FluentIcons.rename),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Chip.selected(
              semanticLabel: "Upload to cloud storage",
              image: const CircleAvatar(
                radius: 12.0,
                child: Icon(
                  FluentIcons.save,
                  size: 14.0,
                ),
              ),
              text: const Text('Save Template'),
              onPressed: () {
                if (sectionList['sections'].isEmpty) {
                  showTopSnackBar(
                    context,
                    Center(
                      child: Text(
                        "New template cannot be empty",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                } else {
                  if (nameEditingController.text.isNotEmpty) {
                    templateName = nameEditingController.text;
                    FirebaseHelper().addTemplate(templateName, uid);
                    print(uid);
                  } else {
                    showTopSnackBar(
                      context,
                      Center(
                        child: Text(
                          "Enter Template Name!",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }
                }
              },
            )
          ],
        ),
        const SizedBox(height: 20),
        const Center(
          child: Text(
            'ADD SECTIONS BELOW',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        TextFormBox(
          controller: titleEditingController,
          header: 'Title',
          placeholder: 'Enter title of the section',
          autovalidateMode: AutovalidateMode.always,
          validator: (text) {
            if (text == null || text.isEmpty) return 'Title Required';
            return null;
          },
          textInputAction: TextInputAction.next,
          prefix: const Padding(
            padding: EdgeInsetsDirectional.only(start: 8.0),
            child: Icon(FluentIcons.title),
          ),
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 20),
        TextFormBox(
          controller: notePostfixController,
          keyboardType: TextInputType.text,
          header:
              'PostFix(Text that will be added to the notes after the choice)',
          placeholder: 'Enter Text',
          autovalidateMode: AutovalidateMode.always,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'This should not be empty';
            }
            return null;
          },
          textInputAction: TextInputAction.next,
          prefix: const Padding(
            padding: EdgeInsetsDirectional.only(start: 8.0),
            child: Icon(FluentIcons.choice_column),
          ),
        ),
        const SizedBox(height: 20),
        TextFormBox(
          controller: choicesEditingController,
          keyboardType: TextInputType.text,
          header: 'Choices',
          placeholder: 'Enter multiple choices separated by comma (,)',
          autovalidateMode: AutovalidateMode.always,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'At least one choice required';
            }
            return null;
          },
          textInputAction: TextInputAction.next,
          prefix: const Padding(
            padding: EdgeInsetsDirectional.only(start: 8.0),
            child: Icon(FluentIcons.choice_column),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Chip.selected(
              image: const CircleAvatar(
                radius: 12.0,
                child: Icon(
                  FluentIcons.add,
                  size: 14.0,
                ),
              ),
              text: const Text('Add Section'),
              onPressed: () {
                setState(() {
                  print(titleEditingController.text +
                      " " +
                      choicesEditingController.text);
                  List<String> choices =
                      splitChoices(choicesEditingController.text);

                  sectionList['sections'].add({
                    "data": {
                      "title": titleEditingController.text,
                      "choices": choices,
                      "postFix": notePostfixController.text
                    }
                  });
                });

                titleEditingController.clear();
                notePostfixController.clear();
                choicesEditingController.clear();
              },
            ),
          ],
        ),
        const SizedBox(height: 50),
        const Center(
          child: Text(
            'Preview',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Card(
            elevation: 15,
            child: sectionList.isNotEmpty
                ? ListView.builder(
                    itemCount: sectionList['sections'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${sectionList['sections'][index]['data']['title']}"
                                ':',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  "${sectionList['sections'][index]['data']['choices']}",
                                  style: const TextStyle(
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(),
                          const SizedBox(height: 10),
                        ],
                      );
                    })
                : const Center(
                    child: Text('No Preview Available'),
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
