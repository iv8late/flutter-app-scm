import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:project_base_app/config/theme/app_theme.dart'; // Asegúrate de importar esto

class CodeEditor extends StatefulWidget {
  final String initialCode;
  final Syntax syntaxType;
  final double fontSize;
  final SyntaxTheme syntaxTheme;

  CodeEditor({
    required this.initialCode,
    this.syntaxType = Syntax.JAVASCRIPT,
    this.fontSize = 16.0,
    SyntaxTheme? syntaxTheme,
    super.key,
  }) : syntaxTheme = syntaxTheme ?? SyntaxTheme.ayuDark();

  @override
  _CodeEditorState createState() => _CodeEditorState();
}

class _CodeEditorState extends State<CodeEditor> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialCode);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Sintaxis de visualización en la parte superior
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 250.0, // Define una altura específica para el SyntaxView
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.black, // Color de fondo si es necesario
            ),
            child: SyntaxView(
              code: _controller.text,
              syntax: widget.syntaxType,
              syntaxTheme: widget.syntaxTheme,
              fontSize: widget.fontSize,
              withLinesCount: true,
            ),
          ),
        ),

        // Aquí hacemos el TextField desplazable con altura fija
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 150.0, // Definimos una altura fija para el inpu
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: SingleChildScrollView(
              child: TextField(
                controller: _controller,
                maxLines: null,
                minLines: 1,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Edita tu código aquí...',
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: AppTheme.teal,
                  fontFamily: 'Courier',
                  fontSize: widget.fontSize,
                ),
                onChanged: (text) {
                  setState(() {});
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
