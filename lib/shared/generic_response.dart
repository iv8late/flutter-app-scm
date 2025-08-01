class GenericResponse<T> {
  final bool error;
  final T? data;
  final String msg;

  GenericResponse({required this.error, required this.data, required this.msg});
}
