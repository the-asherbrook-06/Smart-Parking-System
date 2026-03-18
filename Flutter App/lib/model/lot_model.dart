// Models
import 'package:parkio/model/grid_model.dart';

class Lot {
  final String id;
  final String name;
  final Grid grid;

  Lot({required this.id, required this.name, required this.grid});

  Lot copyWith({String? id, String? name, Grid? grid}) {
    return Lot(id: id ?? this.id, name: name ?? this.name, grid: grid ?? this.grid);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "grid": grid.toJson()};
  }

  factory Lot.fromJson(Map<String, dynamic> json) {
    return Lot(id: json["id"], name: json["name"], grid: Grid.fromJson(json["grid"]));
  }
}
