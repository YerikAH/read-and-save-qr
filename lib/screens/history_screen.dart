import 'package:qr_flutter/qr_flutter.dart';
import 'package:read_qr/db/db_admin.dart';
import 'package:read_qr/models/models.dart';
import 'package:flutter/material.dart';
import 'package:read_qr/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});
  void dialogQr(BuildContext context,String url) {
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: ( context ) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Code QR', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
          shape: RoundedRectangleBorder( borderRadius: BorderRadiusDirectional.circular(10) ),      
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0)
                ),
                child: QrImage(
                  data: url, 
                  version: QrVersions.auto,
                  size:200.0
                ),
              ),
            ],
          ),
          actions: [
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close', style: TextStyle(color:kBrandGreen, fontSize: 14.0),)
              ),
            ),
          ],
        );
      }
    );


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  "Overall history",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                const Text(
                  "General list of your registered QRs.",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                FutureBuilder(
                  future: DBAdmin().getQRList(),
                  builder: (BuildContext context, AsyncSnapshot snap) {
                    if (snap.hasData) {
                      List<QRModel> qrList = snap.data;
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: qrList.length,
                        itemBuilder: (BuildContext context, int index) {
                          bool isUrl = qrList[index].url.contains("http");

                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 14.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.09),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.calendar_month,
                                            size: 14.0,
                                            color: Colors.white54,
                                          ),
                                          Text(
                                            " ${qrList[index].datetime}",
                                            style: const TextStyle(
                                              color: Colors.white54,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        qrList[index].title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        qrList[index].observation,
                                        style: const TextStyle(
                                          color: Colors.white54,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                isUrl
                                    ? IconButton(
                                        onPressed: () {
                                          Uri uri =
                                              Uri.parse(qrList[index].url);
                                          launchUrl(uri,
                                              mode: LaunchMode
                                                  .externalApplication);
                                        },
                                        icon: const Icon(
                                          Icons.link,
                                          color: Colors.white,
                                        ),
                                      )
                                    : const SizedBox(),
                                IconButton(
                                  onPressed: () {
                                    dialogQr(context, qrList[index].url);
                                  },
                                  icon: const Icon(
                                    Icons.qr_code,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}