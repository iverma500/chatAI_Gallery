import 'dart:convert';
import 'package:flutter/material.dart';
import '../classes/Photo.dart';
import 'package:http/http.dart' as http;
import 'package:app/pages/galleryPage.dart';

class chatPage extends StatefulWidget{
  const chatPage({super.key});

  @override
  State<chatPage> createState() => _MiAppState();
}

class _MiAppState extends State<chatPage> {
  TextEditingController inputText = TextEditingController();
  String apiKey = '';
  String url = 'https://api.openai.com/v1/images/generations';
  String? image;

  void getAIImage() async{
    //API Call
    if(inputText.text.isNotEmpty){
      var data = {
        "prompt" : inputText.text,
        "n" : 1,
        "size" : "256x256",
      };

      var response = await http.post(
        Uri.parse(url),
        headers: {"Authorization":"Bearer $apiKey","Content-Type" : "application/json"},
        body: jsonEncode(data)
      );
      setState(() {
        var jsonResponse = jsonDecode(response.body);

        image = jsonResponse['data'][0]['url'];
        print(image);
      });
    } else {
      print("Enter something");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Dall-E'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            image != null ? Image.network(image!,width: 256, height: 256,) : const Text("Enter text to generate an image"),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: inputText,
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  if(image != null) {
                    //image generated
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => galleryPage(image!)
                    )
                    );
                  } else {
                    //if image was not generated
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Error'),
                          content: const Text('You must generate an image first'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'))
                          ],
                        )
                    );
                  }
                },
                child: const Text("Send to gallery")
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          getAIImage();
        },
        tooltip: "Generate image",
        child: const Icon(Icons.send),
      ),
    ); //patrón de diseño
  }

  List<Widget> getImages(List<Photo>? data){
    List<Widget> getData = [];
    //create a card with the generated photo
    setState(() {
      for(var item in data!){
        getData.add(
            Card(
              child: Column(
                children: [
                  Expanded(child: Image.network(item.url, fit: BoxFit.fill,),)
                ],
              ),
            )
        );
      }
    });

    return getData;
  }
}
