import 'package:test_app/src/data/item.dart';
import 'package:test_app/src/domain/repository/iform_repository.dart';

class FormRepository implements IformRepository {
  final item = Item();

  @override
  Future<List<int>> getList(String inputText) async {
    var items = item.getList(inputText);
    return items.toList();
  }

  @override
  Future<List<int>> updateListRotation(String text) async {
    var items = item.updateList(text);
    return items.toList();
  }

  @override
  Future<int> getSizeGrid() async {
    var size = item.getSizeGrid();
    return size;
  }
}
