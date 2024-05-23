import 'package:flutter/material.dart';
import 'package:test_app/src/domain/use_cases/form_use_case.dart';

class FormPageViewModel extends ChangeNotifier {
  List<int> _items = [];
  int sizeList = 2;
  String _inputText = "";

  List<int> get items => _items;

  String get inputText => _inputText;

  FormUseCase useCase = FormUseCase();

  void rotateList() async {
    try {
      if (_inputText.isNotEmpty) {
        final response = await useCase.updateListRotation(inputText);
        _items = response;
        sizeList = await useCase.getSizeGrid();
      }
    } catch (error) {
      print("error $error");
    }
    notifyListeners();
  }

  void getList(String inputText) async {
    try {
      if (inputText.isNotEmpty) {
        _inputText = inputText;
        final response = await useCase.getList(inputText);
        _items = response;
        sizeList = await useCase.getSizeGrid();
      }
    } catch (error) {
      print("error $error");
    }
    notifyListeners();
  }
}
