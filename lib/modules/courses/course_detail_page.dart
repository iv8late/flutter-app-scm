import 'package:flutter/material.dart';
import 'package:project_base_app/modules/courses/course.dart'; // Asegúrate de tener la clase Course y SubCourse importada

class CourseDetailPage extends StatelessWidget {
  final Course item;

  const CourseDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(item.title),
              background: Image.asset(
                'assets/bg/space_wallpaper.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.status,
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    Text(item.content, style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 32),
                    const Text(
                      "Cursos incluidos:",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 16),

                    // Mostrar lista de sub-cursos usando la clase SubCourse
                    for (final sub in item.subItems)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: GestureDetector(
                          onTap: () {
                            // Aquí puedes hacer la navegación a un detalle de la lección si lo necesitas
                            Navigator.pushNamed(
                              context,
                              '/courseMenu', // Asegúrate de que esta ruta esté definida en el MaterialApp
                              arguments:
                                  sub, // Pasamos el SubCourse como argumento
                            );
                          },
                          child: ListTile(
                            title: Text(sub.title),
                            subtitle: Text(sub.content),
                            leading: const Icon(Icons.book_outlined),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
