import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart'; // Asegúrate de importar esto
import 'package:project_base_app/config/theme/app_theme.dart';
import 'package:project_base_app/modules/courses/classes/course.dart';
import 'package:project_base_app/shared/widgets/code_snippet_box.dart'; // Tema personalizado

class CodeLesson extends StatelessWidget {
  final LessonScm lesson;
  final LessonContentScm content;

  const CodeLesson({super.key, required this.content, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkPink, // Color de fondo que ya tienes
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CodeEditor(
                initialCode: '''
@NgModule({
  declarations: [AppComponent],
  imports: [
    BrowserModule,
    MatButtonModule // Asegúrate de tener este módulo
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
                ''',
                syntaxType: Syntax.JAVASCRIPT,
                fontSize: 16.0,
                syntaxTheme: SyntaxTheme.ayuDark(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
