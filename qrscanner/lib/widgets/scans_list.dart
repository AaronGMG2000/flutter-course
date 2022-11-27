import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner/providers/scan_list_provider.dart';
import 'package:qrscanner/utils/utils.dart';

class ScanList extends StatelessWidget {
  final IconData icon;
  const ScanList({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    return ListView.builder(
      itemBuilder: (_, int index) {
        final scan = scanListProvider.scans[index];
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (_) => scanListProvider.borrarScanPorId(scan.id!),
          background: Container(color: Colors.red),
          direction: DismissDirection.endToStart,
          child: ListTile(
            leading: Icon(icon),
            title: Text(scan.value),
            subtitle: Text('ID: ${scan.id}'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => launchURL(context, scan),
          ),
        );
      },
      itemCount: scanListProvider.scans.length,
    );
  }
}
