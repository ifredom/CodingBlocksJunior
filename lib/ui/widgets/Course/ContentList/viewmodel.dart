import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/models/content.dart';
import 'package:stacked/stacked.dart';

class ContentListViewModel extends StreamViewModel<QuerySnapshot> {
  Stream<QuerySnapshot> contentStream;
  List<Content> contents = [];


  ContentListViewModel({this.contentStream});

  @override
  Stream<QuerySnapshot> get stream => contentStream;


  @override
  void onData(QuerySnapshot data) {
    contents = data.documents.map((DocumentSnapshot snapshot) => Content.fromSnapshot(snapshot)).toList();
    notifyListeners();
  }

}