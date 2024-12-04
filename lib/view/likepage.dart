import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/qouteproivder.dart';

class LikedQuotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuotesProvider>(context);
    final likedQuotes = provider.likedQuotes;

    return Scaffold(
      appBar: AppBar(title: Text('Liked Quotes')),
      body: ListView.builder(
        itemCount: likedQuotes.length,
        itemBuilder: (context, index) {
          final quote = likedQuotes[index];
          return ListTile(
            title: Text(quote['content']),
            subtitle: Text('- ${quote['author']} (Liked at: ${quote['likedAt']})'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => provider.removeLikedQuote(quote['id']),
            ),
          );
        },
      ),
    );
  }
}
