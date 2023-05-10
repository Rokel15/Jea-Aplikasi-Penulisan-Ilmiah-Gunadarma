import 'package:flutter/material.dart';
import 'ArticleModel.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ShowArticle extends StatelessWidget {

  ArticleModel articleModel;
  ShowArticle({
    required this.articleModel,
  });

  @override
  Widget build(BuildContext context) {
    return SfPdfViewer.asset(
      articleModel.pdfUrl
    );
  }
}
