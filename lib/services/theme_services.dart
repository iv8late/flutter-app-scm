import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_base_app/modules/courses/classes/course.dart';
import 'package:project_base_app/shared/generic_response.dart';

Future<GenericResponse<List<ThemeScm>>> fetchCourse() async {
  try {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:5171/api/Course/GetThemes'),
    );

    if (response.statusCode == 200) {
      // Ahora, decodificamos la respuesta JSON
      final Map<String, dynamic> decodedResponse = json.decode(response.body);

      // Aseguramos que la clave 'data' exista y sea una lista
      final List<dynamic> data = decodedResponse['data'];

      // Convertimos la lista de mapas en una lista de objetos ThemeScm
      List<ThemeScm> themes =
          data.map((item) => ThemeScm.fromJson(item)).toList();

      return GenericResponse<List<ThemeScm>>(
        error: false,
        msg: 'Carga exitosa',
        data: themes,
      );
    } else {
      return GenericResponse<List<ThemeScm>>(
        data: null,
        error: true,
        msg: 'Fallo al cargar los temas',
      );
    }
  } catch (e) {
    return GenericResponse<List<ThemeScm>>(
      data: null,
      error: true,
      msg: 'Ocurrió un error: $e',
    );
  }
}
