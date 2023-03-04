import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:read_qr/screens/screens.dart';
import 'package:read_qr/theme/colors.dart';
import 'package:read_qr/widgets/common_button_widget.dart';

class ScannerScreen extends StatefulWidget {
  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {

  Barcode? result;
  QRViewController? controller;
  String urlData = "";
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

    @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if(result != null && result!.code != null){
          print("${result!.code}");
          urlData = result!.code!;
        }
      });
    });

    controller.pauseCamera();
    controller.resumeCamera();
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 300.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: kBrandGreen,
          borderRadius: 5,
          borderLength: 30,
          borderWidth: 5,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: _buildQrView(context)
            ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    urlData.isEmpty ? "Por favor escanea un código QR.": urlData,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14.0
                    ),
                  ),
                  const SizedBox(height:18.0),
                  CommonButtonWidget(
                    // onPressed: urlData.isEmpty ?  () => Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen(url: urlData,))) : null,
                    onPressed: urlData.isEmpty ?null: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>  RegisterScreen(url: urlData))),
                    text: "Registrar",
                  )
                ],
              ),
            )
            )
        ],
      )
    );
  }
}