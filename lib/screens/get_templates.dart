// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../data/data.dart';
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

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    final appTheme = context.watch<AppTheme>();
    const spacer = SizedBox(height: 10.0);
    const biggerSpacer = SizedBox(height: 40.0);
    return ScaffoldPage.scrollable(
      header:
          const Center(child: PageHeader(title: Text('Available Templates'))),
      scrollController: widget.controller,
      children: [
        StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection("templates").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              List<DocumentSnapshot>? docs = snapshot.data?.docs ?? [];
              if (kDebugMode) {
                print(docs[0].data());
              }
              return _buildList(context, snapshot.data?.docs ?? []);
              /*return SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.7,
                child:

                ListView.builder(
                  itemCount: docs.length,
                  reverse: true,
                  itemBuilder: (BuildContext context, int index) {
                    var template = docs[index].data();
                    return TemplateCard(
                      title: template['data']['title'],
                      postFix: template['data']['postFix'],
                      choiceExample: template['data']['choices'],
                    );
                  },
                ),
              );*/
            } else {
              return const Center(
                child: ProgressBar(),
              );
            }
          },
        )
      ],
    );
  }

  showDownloadDialog() {
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
  }

  void download(
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
  }

  // 1
  Widget _buildList(BuildContext context, List<DocumentSnapshot>? snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      // 2
      children: snapshot!.map((data) => _buildListItem(context, data)).toList(),
    );
  }

// 3
  Widget _buildListItem(BuildContext context, DocumentSnapshot template) {
    return TemplateCard(
      title: template['data']['title'],
      postFix: template['data']['postFix'],
      choiceExample: template['data']['choices'],
    );
  }
}
