import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places/providers/user_places.dart';

class NewPlaceScreen extends ConsumerStatefulWidget {
  const NewPlaceScreen({super.key});

  @override
  ConsumerState<NewPlaceScreen> createState() => _NewPlaceScreenState();
}

class _NewPlaceScreenState extends ConsumerState<NewPlaceScreen> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _savePlace() {
    if (_titleController.text.isEmpty) {
      return;
    }
    ref.read(placeProvider.notifier).addPlace(_titleController.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Place"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                ),
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton.icon(
                onPressed: _savePlace,
                icon: const Icon(Icons.add),
                label: const Text("Add Place"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
