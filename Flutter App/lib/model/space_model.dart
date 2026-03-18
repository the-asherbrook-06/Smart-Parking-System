// Models
import 'package:parkio/model/lot_model.dart';

class Space {
  final String id;
  final String name;
  final List<Lot> lots;

  Space({
    required this.id,
    required this.name,
    required this.lots,
  });

  Space copyWith({
    String? id,
    String? name,
    List<Lot>? lots,
  }) {
    return Space(
      id: id ?? this.id,
      name: name ?? this.name,
      lots: lots ?? this.lots,
    );
  }
}