import 'package:flutter/material.dart';
import '../../../core/widgets/custom_button.dart';
import '../controller/add_movie_controller.dart';
import '../widgets/criteria_item.dart';

class AddMovieScreen extends StatefulWidget {
  const AddMovieScreen({super.key});

  @override
  State<AddMovieScreen> createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  late final AddMovieController controller;

  final titleController = TextEditingController();
  final noteController = TextEditingController();

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
      appBar: AppBar(title: const Text("Añadir película")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Nombre de la película"),
            ),

            const SizedBox(height: 20),
            const Text("Criterios de evaluación", style: TextStyle(fontSize: 18)),
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
            TextField(
              controller: noteController,
              decoration: const InputDecoration(labelText: "Observaciones"),
              maxLines: 3,
            ),

            const SizedBox(height: 20),
            CustomButton(
              text: "Guardar película",
              onPressed: () {
                controller.saveMovie(titleController.text, noteController.text);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
