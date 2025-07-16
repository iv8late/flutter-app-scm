import 'package:flutter/material.dart';
import 'package:project_base_app/config/theme/app_theme.dart';
import 'package:project_base_app/modules/courses/classes/course.dart';

class ThemeCoursesDetail extends StatelessWidget {
  final ThemeCourse item;
  final TextEditingController _searchController = TextEditingController();

  ThemeCoursesDetail({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: CustomScrollView(
        slivers: [
          // SliverAppBar con borde superior
          SliverAppBar(
            backgroundColor: AppTheme.white,
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: const EdgeInsets.all(0),
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppTheme.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: AppTheme.darkBlue,
                              offset: Offset(1, 1),
                              blurRadius: 10,
                            ),
                            Shadow(
                              color: AppTheme.darkBlue,
                              offset: Offset(1, 1),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/bg/space_wallpaper.jpeg',
                    fit: BoxFit.cover,
                  ),
                  // Filtro oscuro sobre la imagen
                  Container(color: Colors.black.withAlpha(100)),
                ],
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      item.content,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppTheme.darkBlue,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // TextField(
                    //   decoration: InputDecoration(
                    //     contentPadding: const EdgeInsets.symmetric(
                    //       horizontal: 20,
                    //       vertical: 18,
                    //     ),
                    //     hintText: 'Search a course...',
                    //     hintStyle: TextStyle(
                    //       color: AppTheme.darkBlue,
                    //       fontSize: 16,
                    //     ),
                    //     suffixIcon: Icon(
                    //       Icons.import_contacts_outlined,
                    //       color: AppTheme.darkBlue,
                    //     ),
                    //     enabledBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(color: Colors.transparent),
                    //     ),
                    //     focusedBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(color: AppTheme.blue),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 32),
                    const Text(
                      "Cursos incluidos:",
                      style: TextStyle(
                        color: AppTheme.darkBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ]),
          ),

          // Grid con los sub-cursos
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                final sub = item.courses[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/courseDetail',
                      arguments: sub,
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: AppTheme.darkBlue, width: 1),
                    ),
                    color: AppTheme.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            sub.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.darkBlue,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            sub.content,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppTheme.darkBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }, childCount: item.courses.length),
            ),
          ),
        ],
      ),
    );
  }
}
