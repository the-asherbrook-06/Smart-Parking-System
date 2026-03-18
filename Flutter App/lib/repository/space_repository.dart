// Packages
import 'package:cloud_firestore/cloud_firestore.dart';

// Models
import 'package:parkio/model/lot_model.dart';

class SpaceRepository {
  final _db = FirebaseFirestore.instance;

  // Create Space
  Future<void> createSpace(String name) async {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    await _db.collection("spaces").doc(id).set({"id": id, "name": name});
  }

  // Add Lot
  Future<void> addLot(String spaceId, Lot lot) async {
    await _db.collection("spaces").doc(spaceId).collection("lots").doc(lot.id).set(lot.toJson());
  }

  // Update Lot
  Future<void> updateLot(String spaceId, Lot lot) async {
    await _db.collection("spaces").doc(spaceId).collection("lots").doc(lot.id).update(lot.toJson());
  }

  // Listen to Spaces
  Stream<QuerySnapshot> watchSpaces() {
    return _db.collection("spaces").snapshots();
  }

  // Listen to Lots inside a Space
  Stream<QuerySnapshot> watchLots(String spaceId) {
    return _db.collection("spaces").doc(spaceId).collection("lots").snapshots();
  }
}
