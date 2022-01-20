import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class TopicPDFView extends StatefulWidget {
  static const routeName = 'topic-pdf';
  final String topicName;
  final String fileUrl;
  const TopicPDFView({
    Key? key,
    required this.topicName,
    required this.fileUrl,
  }) : super(key: key);

  @override
  State<TopicPDFView> createState() => _TopicPDFViewState();
}

class _TopicPDFViewState extends State<TopicPDFView> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            widget.topicName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: FutureBuilder(
          builder: (ctx, _) => SfPdfViewer.network(
            widget.fileUrl,
            key: _pdfViewerKey,
            canShowPaginationDialog: false,
          ),
        ));
  }
}
