import 'package:test_app/src/data/common_exception.dart';
import 'package:test_app/src/domain/repository/form_repository.dart';

class FormUseCase {
  final FormRepository _formRepository = FormRepository();

  Future<List<int>> getList(String inputText) async {
    try {
      if (inputText.isEmpty) throw EmptyException();
      return _formRepository.getList(inputText);
    } on Exception catch (_) {
      throw JsonException();
    }
  }

  Future<List<int>> updateListRotation(String text) async {
    try {
      if (text.isEmpty) throw EmptyException();
      return _formRepository.updateListRotation(text);
    } on Exception catch (_) {
      throw UnformattedException();
    }
  }

  Future<int> getSizeGrid() async {
    return _formRepository.getSizeGrid();
  }
}
