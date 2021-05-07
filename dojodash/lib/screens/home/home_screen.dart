import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:dojodash/screens/action_buttons.dart';
import 'package:flutter/material.dart';
import 'package:yeet/yeet.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'overview_dashboard.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  final String title = 'Dojo Dashboard';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) => pw.Placeholder(),
      ),
    );

    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title), actions: getActionButtons(context)),
        body: FutureBuilder<Response>(
            future: Dio().get('http://localhost:5000/dashboard'),
            builder: (_, data) {
              if (data.hasData) {
                return OverviewDashboard(Key('dashb'), data.data!.data);
              }
              return Center(child: Text('Loading the Data...'));
            }));
  }
}
