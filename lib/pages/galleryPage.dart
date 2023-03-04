import 'package:flutter/material.dart';

class galleryPage extends StatefulWidget{
  const galleryPage(this.aiImage,{super.key});
  final String aiImage;

  @override
  State<galleryPage> createState() => _MiAppState();
}

class _MiAppState extends State<galleryPage> {

  List imgList = [
    "images/img0.jpg",
    "images/img1.jpg",
    "images/img2.jpg",
    "images/img3.jpg",
    "images/img4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        // list view to show images
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            // showing list of images
            for (var item in imgList)
              Center(
                child: Padding(
                  //images from local
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                            onPressed: (){
                            print("clicked");
                            showGeneralDialog(
                                context: context,
                                barrierDismissible: true,
                                barrierLabel:
                                MaterialLocalizations.of(context).modalBarrierDismissLabel,
                                barrierColor: Colors.black45,
                                transitionDuration: const Duration(milliseconds: 200),
                                pageBuilder: (BuildContext buildContext, Animation animation,
                                    Animation secondaryAnimation) {
                                  return Center(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width - 10,
                                      height: MediaQuery.of(context).size.height - 80,
                                      padding: const EdgeInsets.all(20),
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            item,
                                            width: double.infinity,
                                            height: 600,
                                            fit: BoxFit.fill,
                                          ),
                                          ElevatedButton(
                                            child: const Text('Close'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Image.asset(item,width: 256.0, height: 256.0,fit: BoxFit.fill,)
                    ),
                )
              ),
            Center(
                child: Padding(
                  //Image generated
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                      onPressed: (){
                        print("clicked");
                        showGeneralDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierLabel:
                            MaterialLocalizations.of(context).modalBarrierDismissLabel,
                            barrierColor: Colors.black45,
                            transitionDuration: const Duration(milliseconds: 200),
                            pageBuilder: (BuildContext buildContext, Animation animation,
                                Animation secondaryAnimation) {
                              return Center(
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 10,
                                  height: MediaQuery.of(context).size.height - 80,
                                  padding: const EdgeInsets.all(20),
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Image.network(
                                        widget.aiImage,
                                        width: double.infinity,
                                        height: 600,
                                        fit: BoxFit.fill,
                                      ),
                                      ElevatedButton(
                                        child: const Text('Close'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Image.network(widget.aiImage)
                  ),
                )
            )
          ],
        ),
      ),
    ); //patrón de diseño
  }
}