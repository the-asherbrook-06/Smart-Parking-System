// Models
import 'package:parkio/model/grid_model.dart';
import 'package:parkio/model/lot_model.dart';

class GridRepository {

  Grid getGrid(Lot lot) {
    return lot.grid;
  }

  Lot updateGrid(Lot lot, Grid newGrid) {
    return lot.copyWith(grid: newGrid);
  }

  Lot clearGrid(Lot lot) {
    return lot.copyWith(grid: const Grid(cells: []));
  }

}