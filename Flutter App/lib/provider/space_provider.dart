// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Repositories
import 'package:parkio/provider/repository_provider.dart';

// Models
import 'package:parkio/model/space_model.dart';
import 'package:parkio/model/lot_model.dart';

// STREAM: All Spaces
final spacesProvider = StreamProvider<List<Space>>((ref) {
  final repo = ref.read(spaceRepositoryProvider);

  return repo.watchSpaces().map((snapshot) {
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;

      return Space(
        id: data["id"],
        name: data["name"],
        lots: [],
      );
    }).toList();
  });
});

// STREAM: Lots inside a Space
final lotsProvider = StreamProvider.family<List<Lot>, String>((ref, spaceId) {
  final repo = ref.read(spaceRepositoryProvider);

  return repo.watchLots(spaceId).map((snapshot) {
    return snapshot.docs.map((doc) {
      return Lot.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  });
});