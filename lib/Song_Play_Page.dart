import 'package:flutter/material.dart';

import 'package:music_palyer/Controller_Page.dart';
import 'package:provider/provider.dart';
import 'Model.dart';

class Song_Play_Page extends StatefulWidget {
  Model model_class;
  List mus;
  int index;

  Song_Play_Page(this.model_class, this.mus, this.index);

  @override
  State<Song_Play_Page> createState() => _Song_Play_PageState();
}

class _Song_Play_PageState extends State<Song_Play_Page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Controller_Class.get_cur_index(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Controller_Class(),
      child: Consumer<Controller_Class>(
        builder: (context, music_class, child) {
          music_class.change_dur();
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black38,
                title: Text("Music"),
              ),
              body: Container(
                color: Colors.black38,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: Image.network(
                            "${widget.mus[Controller_Class.cur_music]['image']}"),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                            "${widget.mus[Controller_Class.cur_music]['title']}"),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                            "${widget.mus[Controller_Class.cur_music]['artist']}"),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(""),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Text(""),
                        ),
                      ],
                    ),
                    Slider(
                      onChangeEnd: (value) {
                        music_class.seek_song(value);
                      },
                      min: 0,
                      max: widget.model_class.duration!.toDouble(),
                      value: music_class.dur,
                      onChanged: (value) {},
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${music_class.dur.ceil()}"),
                          Text("${widget.mus[Controller_Class.cur_music]['duration']}"),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            music_class.previous_song(
                                Controller_Class.cur_music,
                                widget.mus,
                                widget.model_class);
                          },
                          icon: Icon(Icons.skip_previous),
                        ),
                        music_class.is_play == true
                            ? IconButton(
                                onPressed: () {
                                  music_class.pause_music();
                                },
                                icon: Icon(Icons.pause))
                            : IconButton(
                                onPressed: () {
                                  music_class.play_music(widget.model_class);
                                },
                                icon: Icon(Icons.play_arrow)),
                        IconButton(
                          onPressed: () {
                            music_class.next_song(Controller_Class.cur_music,
                                widget.mus, widget.model_class);
                          },
                          icon: Icon(Icons.skip_next),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: FloatingActionButton(
                          onPressed: () {
                            music_class.download_song(widget
                                .mus[Controller_Class.cur_music]['source']);
                          },
                          child: Icon(Icons.downloading)),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
