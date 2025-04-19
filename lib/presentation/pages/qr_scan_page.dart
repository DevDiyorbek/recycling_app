import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:recycling_app/presentation/widgets/page_template.dart';
import '../widgets/qr_code_corner.dart';
import 'scan_result_page.dart';

class QRScanPage extends StatefulWidget {
  const QRScanPage({super.key});

  @override
  State<QRScanPage> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> with WidgetsBindingObserver {
  late MobileScannerController controller;
  bool hasPermission = false;
  bool isScanning = false;

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController();
    WidgetsBinding.instance.addObserver(this);
    _checkPermission();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Reinitialize controller and check permissions when resuming
      setState(() {
        isScanning = false;
        controller = MobileScannerController();
      });
      _checkPermission();
    }
  }

  Future<void> _checkPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      status = await Permission.camera.request();
    }
    if (status.isGranted && mounted) {
      setState(() {
        hasPermission = true;
      });
    }
  }

  void _startScan() {
    setState(() {
      isScanning = true;
    });
  }

  void _onDetect(BarcodeCapture capture) {
    final barcode = capture.barcodes.first.rawValue ?? "No result";
    if (isScanning) {
      setState(() {
        isScanning = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ScanResultPage(result: barcode),
        ),
      );
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: "Scan Your Item",
      body: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(85),
              ),
              child: hasPermission
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(85),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    MobileScanner(
                      controller: controller,
                      onDetect: _onDetect,
                    ),
                    CustomPaint(
                      painter: ScannerBoxPainter(),
                      size: const Size(200, 100),
                    ),
                  ],
                ),
              )
                  : ClipRRect(
                borderRadius: BorderRadius.circular(85),
                child: Container(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: isScanning ? null : _startScan,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              "SCAN",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}