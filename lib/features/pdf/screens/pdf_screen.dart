import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  Future<void> generatorPdf() async {
    // final logo =
    final image = await imageFromAssetBundle('assets/logo.jpg');
    // var image = await rootBundle.loadString('assets/logo.jpg');
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
              children: [
                pw.Container(height: 100, width: 1500, child: pw.Image(image)),
                pw.SizedBox(height: 10),
                pw.Center(
                  child: pw.Text(
                    'Bibek Billing',
                    style: pw.TextStyle(
                      fontSize: 32,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
                pw.SizedBox(height: 10),
                pw.Row(
                  children: [
                    pw.Column(
                      crossAxisAlignment: .start,
                      children: [
                        pw.Text('Bibek Parajuli'),
                        pw.SizedBox(height: 5),
                        pw.Text('Sinamangal,ktm'),
                        pw.SizedBox(height: 5),
                        pw.Text('9803551831'),
                      ],
                    ),
                    pw.Spacer(),
                    pw.Column(
                      crossAxisAlignment: .start,
                      children: [
                        pw.Text('Total Price'),
                        pw.Container(
                          // Length
                          width: 60,
                          height: 2, // Thickness
                          color: PdfColors.red,
                        ),
                        pw.SizedBox(height: 5),
                        pw.Row(
                          children: [
                            pw.Text('Books:'),
                            pw.SizedBox(width: 3),
                            pw.Text('\$99'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                pw.Text(
                  "Thank You For Visit",
                  style: pw.TextStyle(fontSize: 22),
                ),
              ],
            ),
          ); // Center
        },
      ),
    );
    await Printing.layoutPdf(onLayout: (format) async => pdf.save());
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/pdf.pdf';
    final file = File(path);
    await file.writeAsBytes(await pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pdf Genertor')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                generatorPdf();
              });
            },
            child: Text('Pdf Generator'),
          ),
        ],
      ),
    );
  }
}
