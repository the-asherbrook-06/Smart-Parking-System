// Models
import 'package:parkio/model/space_model.dart';

class SpaceRepository {
  final List<Space> _spaces = [];

  List<Space> getSpaces() {
    return _spaces;
  }

  Space createSpace(String name) {
    final space = Space(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      lots: [],
    );

    _spaces.add(space);
    return space;
  }

  void deleteSpace(String id) {
    _spaces.removeWhere((space) => space.id == id);
  }

  Space? getSpaceById(String id) {
    try {
      return _spaces.firstWhere((space) => space.id == id);
    } catch (_) {
      return null;
    }
  }

  void updateSpace(Space updatedSpace) {
    final index = _spaces.indexWhere((s) => s.id == updatedSpace.id);
    if (index != -1) {
      _spaces[index] = updatedSpace;
    }
  }
}