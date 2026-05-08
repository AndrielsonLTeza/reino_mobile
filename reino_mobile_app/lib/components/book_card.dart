import 'package:flutter/material.dart';
import '../models/book.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;

  const BookCard({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(book.title),
        subtitle: Text(book.author),
        trailing: Icon(
          book.isAvailable ? Icons.check_circle : Icons.error,
          color: book.isAvailable ? Colors.green : Colors.red,
        ),
        onTap: onTap,
      ),
    );
  }
}
