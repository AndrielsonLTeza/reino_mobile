import 'package:flutter/material.dart';
import '../models/book.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;

  const BookCard({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // Adicionamos o Draggable aqui
    return Draggable<Book>(
      data: book, // O dado que está sendo carregado
      feedback: Material(
        // O que aparece enquanto arrasta
        elevation: 4.0,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.all(16),
          color: Colors.blue.withOpacity(0.5),
          child: Text(book.title, style: const TextStyle(color: Colors.white)),
        ),
      ),
      childWhenDragging: Opacity(
        // O que fica na lista enquanto arrasta
        opacity: 0.3,
        child: _buildCard(),
      ),
      child: _buildCard(),
    );
  }

  Widget _buildCard() {
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
