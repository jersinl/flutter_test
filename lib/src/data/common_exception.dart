sealed class CommonException implements Exception {
  String message;
  CommonException(this.message);
}

class JsonException extends CommonException {
  JsonException() : super('Error al convertir a json');
}

class EmptyException extends CommonException {
  EmptyException() : super('Debe ingresar una matriz');
}

class UnformattedException extends CommonException {
  UnformattedException() : super('Formato no soportado');
}
