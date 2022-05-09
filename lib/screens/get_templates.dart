// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../theme.dart';
import '../widgets/template_widget.dart';

class GetTemplates extends StatefulWidget {
  const GetTemplates({Key? key, this.controller}) : super(key: key);

  final ScrollController? controller;

  @override
  State<GetTemplates> createState() => _GetTemplatesState();
}

class _GetTemplatesState extends State<GetTemplates> {
  List<String> supportedFormats = ["JSON", "Text", "Markdown"];
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String uid;

  @override
  void initState() {
    uid = auth.currentUser!.uid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = context.watch<AppTheme>();
    assert(debugCheckHasMediaQuery(context));
    final appTheme = context.watch<AppTheme>();
    const spacer = SizedBox(height: 10.0);
    const biggerSpacer = SizedBox(height: 40.0);
    return ScaffoldPage.scrollable(
      header:
          const Center(child: PageHeader(title: Text('Available Templates'))),
      scrollController: widget.controller,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('templates').snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasData) {
                List<dynamic>? docs = snapshot.data?.docs;
                return ListView.builder(
                  itemCount: docs?.length,
                  reverse: false,
                  itemBuilder: (BuildContext context, int index) {
                    var template = docs![index].data();
                    if (kDebugMode) {
                      print(template);
                    }
                    if (template['uid'] == uid) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TemplateCard(
                          index: index,
                          template: template,
                          title: template['name'],
                          postFix: template['sections'][0]['data']['postFix'],
                          choices: template['sections'][0]['data']['choices'],
                        ),
                      );
                    } else {
                      return const Center();
                    }
                  },
                );
              } else {
                return const Center(
                  child: ProgressBar(),
                );
              }
            },
          ),
        )
      ],
    );
  }

  /*showDownloadDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return ContentDialog(
          title: const Text('Confirm Download'),
          content: const Text('Download the template as JSON file?'),
          actions: [
            FilledButton(
              child: const Text('Yes'),
              onPressed: () {
                download(sectionList.toString().codeUnits,
                    downloadName: "template.txt");
                Navigator.pop(context);
              },
            ),
            Button(
              child: const Text('No'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }*/

  /*void download(
    List<int> bytes, {
    required String downloadName,
  }) {
    // Encode our file in base64
    final _base64 = base64Encode(bytes);
    // Create the link with the file
    final anchor = AnchorElement(
        href:
            'data:text/plain;charset=utf-8,${utf8.encode(sectionList.toString())}')
      ..target = 'blank';
    // add the name
    if (downloadName != null) {
      anchor.download = downloadName;
    }
    // trigger download
    document.body?.append(anchor);
    anchor.click();
    anchor.remove();
    return;
  }*/
}
