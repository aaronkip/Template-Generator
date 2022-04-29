// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:html';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../data/data.dart';
import '../theme.dart';

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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(supportedFormats.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: RadioButton(
                      checked: supportedFormats[index] == "JSON" ? true : false,
                      onChanged: (value) {},
                      content: Text(supportedFormats[index]),
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
        const SizedBox(height: 50.0),
        Center(
          child: Chip.selected(
            image: const CircleAvatar(
              radius: 12.0,
              child: Icon(
                FluentIcons.download,
                size: 14.0,
              ),
            ),
            text: const Text('Download'),
            onPressed: () {
              showDownloadDialog();
            },
          ),
        ),
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
}
