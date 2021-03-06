import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/models/instructor.dart';

class Course {
  final String title;
  final String subtitle;
  final String background;
  final String logo;
  final String slug;
  final String id;
  final List<dynamic> contents;
  final List<dynamic> instructorIds;

  Course({
    this.id,
    this.title,
    this.subtitle,
    this.logo,
    this.background,
    this.slug,
    this.contents,
    this.instructorIds
  });

  static Course fromSnapshot(DocumentSnapshot snapshot) {
    return Course(
      id: snapshot.documentID,
      title: snapshot['title'],
      subtitle: snapshot['subtitle'],
      logo: snapshot['logo']['src'],
      background: snapshot['background']['src'],
      slug: snapshot['slug'],
      contents: snapshot['contents'],
      instructorIds: snapshot['instructorIds']
    );
  }

  Stream<QuerySnapshot> get contentStream => Firestore.instance
      .collection('contents')
      .where(FieldPath.documentId, whereIn: this.contents)
      .snapshots();

  Stream<DocumentSnapshot> get courseStream => Firestore.instance
      .collection('courses')
      .document(id)
      .snapshots();


  Future<List<Instructor>> get instructorsFuture async => (await Firestore
      .instance
      .collection('Instructors')
      .where(FieldPath.documentId, whereIn: this.instructorIds)
      .getDocuments())
      .documents
      .toList()
      .map( (i) => Instructor.fromSnapshot(i))
      .toList();

}
