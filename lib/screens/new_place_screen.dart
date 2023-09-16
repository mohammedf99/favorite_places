import 'package:flutter/material.dart';
import 'dart:io';

import 'package:favorite_places/widgets/image_input.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places/providers/user_places.dart';

class NewPlaceScreen extends ConsumerStatefulWidget {
  const NewPlaceScreen({super.key});

  @override
  ConsumerState<NewPlaceScreen> createState() => _NewPlaceScreenState();
}

class _NewPlaceScreenState extends ConsumerState<NewPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _savePlace() {
    if (_titleController.text.isEmpty) {
      return;
    }
    ref
        .read(placeProvider.notifier)
        .addPlace(_titleController.text, _selectedImage!);
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
              // Image input goes here...
              ImageInput(
                onImageSelected: (pickedImage) => _selectedImage = pickedImage,
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
