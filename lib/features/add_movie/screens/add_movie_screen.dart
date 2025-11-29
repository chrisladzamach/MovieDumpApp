import 'package:flutter/material.dart';
import 'package:moviedump/core/constants/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_add_criteria_button.dart';
import '../controller/add_movie_controller.dart';
import '../widgets/criteria_item.dart';

class AddMovieScreen extends StatefulWidget {
  const AddMovieScreen({super.key});

  @override
  State<AddMovieScreen> createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  late final AddMovieController controller;
  bool showAddCriteriaField = false;

  final titleController = TextEditingController();
  final noteController = TextEditingController();
  final addCriteriaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    controller = AddMovieController();
  }

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          "Añadir película",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: AppColors.buttonColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                autofocus: true,
                textCapitalization: TextCapitalization.sentences,
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: "Nombre de la película",
                  errorStyle: TextStyle(color: AppColors.errorValidation),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Este campo es obligatorio';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),
              const Text(
                "Criterios de evaluación",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              ...List.generate(controller.criteria.length, (i) {
                final c = controller.criteria[i];
                return CriteriaItem(
                  name: c.name,
                  score: c.score,
                  onScoreChanged: (value) {
                    setState(() {
                      controller.updateScore(i, value);
                    });
                  },
                );
              }),

              const SizedBox(height: 20),

              if (!showAddCriteriaField)
                Row(
                  children: [
                    CustomAddCriteriaButton(
                      text: "Añadir criterio",
                      onPressed: () {
                        setState(() {
                          showAddCriteriaField = true;
                        });
                      },
                    ),
                    SizedBox(width: 12),
                  ],
                ),

              if (showAddCriteriaField) ...[
                const SizedBox(height: 12),

                TextField(
                  controller: addCriteriaController,
                  decoration: const InputDecoration(
                    labelText: "Nuevo criterio",
                    hintText: "Ej: Fotografía, Guion, etc.",
                  ),
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: CustomAddCriteriaButton(
                        text: "Añadir",
                        onPressed: () {
                          final text = addCriteriaController.text.trim();
                          if (text.isEmpty) return;

                          setState(() {
                            controller.addCriteria(text);
                            addCriteriaController.clear();
                            showAddCriteriaField = false;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomAddCriteriaButton(
                        text: "Cancelar",
                        onPressed: () {
                          setState(() {
                            addCriteriaController.clear();
                            showAddCriteriaField = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],

              const SizedBox(height: 20),
              TextField(
                controller: noteController,
                decoration: const InputDecoration(labelText: "Observaciones"),
                maxLines: 3,
              ),

              const SizedBox(height: 20),
              CustomButton(
                text: "Guardar película",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.saveMovie(
                      titleController.text.trim(),
                      noteController.text,
                    );
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
