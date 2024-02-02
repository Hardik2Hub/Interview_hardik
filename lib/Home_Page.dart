
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Controller_Page.dart';
import 'Model.dart';
import 'Song_Play_Page.dart';

class Home_Page extends StatefulWidget {
  @override
  State<Home_Page> createState() => _Home_PageState();
}
class _Home_PageState extends State<Home_Page> {

  @override
  Widget build(BuildContext context) {
    Controller_Class music_class = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text("Music App"),
      ),
      body: FutureProvider(create: (context) => music_class.getHttp(), initialData: music_class.getHttp(),child: ListView.builder(
        itemCount:music_class.music.length,
        itemBuilder: (context, index) {
          Model model = Model.fromJson(music_class.music[index]);
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Song_Play_Page(model, music_class.music,index);
                    },
                  ),
                );
              },
              leading: Image.network("${model.image}"),
              title: Text("${model.title}"),
              subtitle: Text("${model.artist}"),
            ),
          );
        },
      ),),
    );
  }
}
