// Match Exercise
  import 'package:flutter/material.dart';
import 'package:project_base_app/config/theme/app_theme.dart';
import 'package:project_base_app/shared/json_classes/exercise_json.dart';

Widget buildMatchExercise(Exercise ex, bool isSpanish) {
    final Map<String, String?> selectedMatches = {};
    final leftItems = ex.left ?? [];
    final rightItems = ex.right ?? [];
    final pairItems = ex.pairs ?? [];

    return StatefulBuilder(
      builder: (context, setInnerState) {
        final allSelected = selectedMatches.length == leftItems.length;
        final allCorrect = selectedMatches.entries.every((entry) {
          return pairItems.any(
            (pair) => pair.left == entry.key && pair.right == entry.value,
          );
        });

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isSpanish ? ex.instruction.es  : ex.instruction.en ,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              ...leftItems.map((leftItem) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          leftItem.text,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis, // 🔹 evita desbordes
                          maxLines:
                              2, // 🔹 permite que baje de línea si es necesario
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 5,
                        child: DropdownButtonFormField<String>(
                          isExpanded:
                              true, // 🔹 MUY importante para que use todo el ancho disponible
                          dropdownColor: AppTheme.darkBlue,
                          value: selectedMatches[leftItem.id],
                          hint: Text(
                            isSpanish
                                ? 'Seleccionar descripción'
                                : 'Select description',
                            style: const TextStyle(color: Colors.white70),
                            overflow: TextOverflow.ellipsis, // 🔹
                          ),
                          style: const TextStyle(color: Colors.white),
                          items:
                              rightItems
                                  .map(
                                    (r) => DropdownMenuItem(
                                      value: r.id,
                                      child: Text(
                                        r.text,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                        overflow: TextOverflow.ellipsis, // 🔹
                                      ),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (value) {
                            setInnerState(() {
                              selectedMatches[leftItem.id] = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed:
                    allSelected
                        ? () {
                          final color = allCorrect ? Colors.green : Colors.red;
                          final message =
                              allCorrect
                                  ? (isSpanish ? '¡Correcto!' : 'Correct!')
                                  : (isSpanish
                                      ? 'Algunas respuestas son incorrectas.'
                                      : 'Some answers are incorrect.');

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(message),
                              backgroundColor: color,
                            ),
                          );
                        }
                        : null,
                child: Text(
                  isSpanish ? 'Verificar respuestas' : 'Check Answers',
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }