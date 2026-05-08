import 'package:flutter/material.dart';
import '../models/book.dart';

class DetailsPage extends StatelessWidget {
  final Book book;
  const DetailsPage({super.key, required this.book});

  void _showStatusDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Status do Livro'),
        content: Text(
          book.isAvailable
              ? 'Disponível para empréstimo.'
              : 'Indisponível no momento.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Autor: ${book.author}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(book.description),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _showStatusDialog(context),
                child: const Text('Verificar Disponibilidade'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
