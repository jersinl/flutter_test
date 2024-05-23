abstract class IformRepository {
  Future<List<int>> getList(String inputText);
  Future<List<int>> updateListRotation(String text);
  Future<int> getSizeGrid();
}


