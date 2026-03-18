// Models
import 'package:parkio/model/space_model.dart';
import 'package:parkio/model/lot_model.dart';
import 'package:parkio/model/grid_model.dart';
import 'package:parkio/model/cell_model.dart';

class LotRepository {
  List<Lot> getLots(Space space) {
    return space.lots;
  }

  Lot createLot(Space space, String name) {
    final starterGrid = Grid(cells: List.generate(3, (_) => List.generate(3, (_) => Cell.empty())));

    final lot = Lot(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      grid: starterGrid,
    );

    space.lots.add(lot);
    return lot;
  }

  void deleteLot(Space space, String lotId) {
    space.lots.removeWhere((lot) => lot.id == lotId);
  }

  Lot? getLotById(Space space, String lotId) {
    try {
      return space.lots.firstWhere((lot) => lot.id == lotId);
    } catch (_) {
      return null;
    }
  }

  void updateLot(Space space, Lot updatedLot) {
    final index = space.lots.indexWhere((l) => l.id == updatedLot.id);

    if (index != -1) {
      space.lots[index] = updatedLot;
    }
  }
}
