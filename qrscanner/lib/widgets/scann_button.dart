import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner/models/scan_model.dart';
import 'package:qrscanner/providers/scan_list_provider.dart';
import 'package:qrscanner/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, [bool mounted = true]) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            "#3D8BEF", "Cancelar", false, ScanMode.QR);
        if (barcodeScanRes == '-1') return;
        if (!mounted) return;
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        ScanModel nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
        if (!mounted) return;
        launchURL(context, nuevoScan);
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}
