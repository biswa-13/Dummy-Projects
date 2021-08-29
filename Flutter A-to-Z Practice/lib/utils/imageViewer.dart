import 'package:flutter/material.dart';

class ImageViewer extends StatefulWidget {
  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
            child: GestureDetector(
              child: Column(
                children: <Widget>[
                   Image.asset("assets/images/brs_thumbnail.jpg"),
                   Center(
                     child: Row(
                       children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.only(left:120.0),
                           child: IconButton( icon: Icon(Icons.sentiment_satisfied), color: Colors.greenAccent, onPressed: () => userFeedback(1),),
                         ),
                         Center(child: IconButton(icon: Icon(Icons.sentiment_dissatisfied), color: Colors.orangeAccent, onPressed: () => userFeedback(0)))
                       ],
                     ),
                   )
                ],
              ),
              onTap: (){Navigator.of(context).pop();},
            )
      ),
    );
  }

  userFeedback(choice){
    print("userFeedback() is called -->"+choice.toString());
    Navigator.of(context).pop(choice.toString());
  }
  
}