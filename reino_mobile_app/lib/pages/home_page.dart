import 'package:flutter/material.dart';
import '../mocks/mock_books.dart';
import '../components/book_card.dart';
import 'details_page.dart';
import '../models/book.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biblioteca Express'),
        actions: [
          // ZONA DE DROP NO APPBAR
          DragTarget<Book>(
            onAcceptWithDetails: (details) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${details.data.title} adicionado aos favoritos!',
                  ),
                ),
              );
            },
            builder: (context, candidateData, rejectedData) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.favorite,
                  color: candidateData.isNotEmpty ? Colors.red : Colors.white,
                  size: candidateData.isNotEmpty ? 40 : 30,
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Dica: Arraste um livro até o coração para favoritar!"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: mockBooks.length,
              itemBuilder: (ctx, i) {
                final book = mockBooks[i];
                return BookCard(
                  book: book,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => DetailsPage(book: book)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
