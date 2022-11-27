import 'package:flutter/material.dart';
import 'package:qrscanner/widgets/scans_list.dart';

class DireccionesPage extends StatelessWidget {
  const DireccionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScanList(icon: Icons.send);
  }
}
