import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/qouteproivder.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuotesProvider>(context);
    final quotes = provider.quotes;

    return Scaffold(
      appBar: AppBar(title: Text('Quotes',style: GoogleFonts.roboto(),)),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Liked Quotes',style: GoogleFonts.roboto(),),
              onTap: (){
                Navigator.of(context).pushNamed('like');
              }
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: quotes.length + 1,
        itemBuilder: (context, index) {
          if (index == quotes.length) {
            if (!provider.isLoading) {
              provider.fetchQuotes();
            }
            return provider.isLoading
                ? Center(child: CircularProgressIndicator())
                : SizedBox();
          }
          final quote = quotes[index];
          return ListTile(
            title: Text(quote.content),
            subtitle: Text('- ${quote.author}'),
            trailing: IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () => provider.likeQuote(quote),
            ),
          );
        },
      ),
    );
  }
}
