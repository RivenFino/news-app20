import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get collection of ()
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');
  // CREATE: add a new note
  Future<void> addNote(String note) {
    return notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }
}