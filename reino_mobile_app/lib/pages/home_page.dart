import 'package:flutter/material.dart';
import '../mocks/mock_books.dart';
import '../components/book_card.dart';
import 'details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Biblioteca Express')),
      body: ListView.builder(
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
    );
  }
}
