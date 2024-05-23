import 'dart:convert';

class Item {
  List<int> items = [];
  int sizeList = 2;

 // Data for demo...
  String data = "[[1,2, 3], [4, 5, 6], [7, 8, 9]]";
  String data2 = "[[1,2], [3,4]]";


  int getSizeGrid() => sizeList;

  List<int> getList(String inputText) {
    if (inputText.isNotEmpty) {
      final value = List<List<dynamic>>.from(jsonDecode(inputText)).toList();
      sizeList = value.length;
      items = getNewList(value);
    }
    return items;
  }


  List<int> updateList(String inputText) {
    if (inputText.isNotEmpty) {
      final value = List<List<dynamic>>.from(jsonDecode(inputText)).toList();
      final finalValue = transpose(value).reversed.toList();
      sizeList = finalValue.length;
      items = getNewList(finalValue);
    }
    return items;
  }

  List<List<T>> transpose<T>(List<List<T>> source) {
    if (source.isEmpty) return source;
    var length = source.first.length;
    // validación para tamaño de cada matriz
    for (var i = 1; i < source.length; i++) {
      if (source[i].length != length) {
        throw ArgumentError.value(
            source, "source", "All lists must have same length");
      }
    }
    return [
      for (var i = 0; i < length; i++)
        [for (var j = 0; j < source.length; j++) source[j][i]]
    ];
  }

  List<int> getNewList(List<dynamic> valueFinal) {
    List<int> newList = [];
    for (var element in valueFinal) {
      element.forEach((value) {
        newList.add(value);
      });
    }

    return newList;
  }
}
