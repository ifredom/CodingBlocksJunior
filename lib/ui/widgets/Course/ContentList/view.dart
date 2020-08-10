import 'package:add_thumbnail/thumbnail_list_vew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/models/content.dart';
import 'package:coding_blocks_junior/ui/widgets/Base/Thumbnail.dart';
import 'package:coding_blocks_junior/ui/widgets/Course/ContentList/viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ContentListView extends StatelessWidget {
  Stream<QuerySnapshot> contentStream;

  ContentListView({this.contentStream});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () =>
            ContentListViewModel(contentStream: contentStream),
        builder: (context, model, child) => ListView.builder(
            shrinkWrap: true,
            itemCount: model.contents.length,
            itemBuilder: (context, index) {
              return ContentListItemView(content: model.contents[index], index: index,);
            }));
  }
}

class ContentListItemView extends StatelessWidget {
  Content content;
  int index;

  ContentListItemView({@required this.content, this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 22),
      child: SizedBox(
        height: 100,
        child: Row(children: [
          SizedBox(
            width: 150,
            child:
                content.url != null ? MediaListView(urls: [content.url]) : null,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Lecture ' + (index + 1).toString()),
                SizedBox(
                  height: 5,
                ),
                Text(
                  content.title,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
                Expanded(
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Date: 18th Aug, 2020',
                        style: TextStyle(fontSize: 11, color: Colors.black87),
                      )),
                )
              ]),
            ),
          )
        ]),
      ),
    );
  }
}