// Packages
import 'package:flutter_riverpod/legacy.dart';

// Models
import 'package:parkio/model/space_model.dart';
import 'package:parkio/model/lot_model.dart';

final spacesProvider =
    StateNotifierProvider<SpacesNotifier, List<Space>>(
  (ref) => SpacesNotifier(),
);

class SpacesNotifier extends StateNotifier<List<Space>> {
  SpacesNotifier() : super([]);

  void createSpace(String name) {
    final space = Space(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      lots: [],
    );

    state = [...state, space];
  }

  void addLot(String spaceId, Lot lot) {
    state = [
      for (final space in state)
        if (space.id == spaceId)
          space.copyWith(lots: [...space.lots, lot])
        else
          space
    ];
  }

  void updateLot(String spaceId, Lot updatedLot) {
    state = [
      for (final space in state)
        if (space.id == spaceId)
          space.copyWith(
            lots: [
              for (final lot in space.lots)
                if (lot.id == updatedLot.id) updatedLot else lot
            ],
          )
        else
          space
    ];
  }
}