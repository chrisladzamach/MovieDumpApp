import 'package:flutter/material.dart';
import 'package:moviedump/core/constants/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_add_criteria_button.dart';
import '../controller/add_movie_controller.dart';
import '../widgets/criteria_item.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

File? selectedImage;

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
    int _criteriaVersion = 0;

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

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        selectedImage = File(picked.path);
      });
    }
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
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded, color: Colors.white),
            onPressed: () {
              setState(() {
                controller.reset();
                titleController.clear();
                noteController.clear();
                addCriteriaController.clear();
                selectedImage = null;
                _formKey.currentState?.reset();
                showAddCriteriaField = false;
                                _criteriaVersion++;
              });
            },
          ),
        ],
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
                  key: ValueKey('${c.name}-$_criteriaVersion-$i'),   
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
                decoration: const InputDecoration(
                  labelText: "Observaciones (opcional)",
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              const Text(
                "Imagen (opcional)",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF404040),
                ),
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  // Vista previa
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white38),
                      image: selectedImage != null
                          ? DecorationImage(
                              image: FileImage(selectedImage!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: selectedImage == null
                        ? const Icon(Icons.image, color: Colors.black, size: 60)
                        : null,
                  ),

                  const SizedBox(width: 12),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: AppColors.buttonColor,
                      foregroundColor: Colors.white,
                      elevation: 5,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 20,
                      ),
                    ),
                    onPressed: () async {
                      await pickImage();
                    },
                    child: const Text("Seleccionar foto"),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              CustomButton(
                text: "Guardar película",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.saveMovie(
                      titleController.text.trim(),
                      noteController.text,
                      imagePath: selectedImage?.path,
                    );

                    setState(() {
                      titleController.clear();
                      noteController.clear();
                      addCriteriaController.clear();
                      selectedImage = null;
                    });

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
