import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import './widgets/character_card.dart';
import './GraphQL/graphQL_client_provider.dart';

class ListOfCharacters extends StatefulWidget {
  const ListOfCharacters({Key? key}) : super(key: key);

  @override
  State<ListOfCharacters> createState() => _ListOfCharactersState();
}

class _ListOfCharactersState extends State<ListOfCharacters> {
  List<dynamic> characters = [];
  late bool _loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'The Rick and Morty API',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        centerTitle: true,
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              ),
            )
          : characters.isEmpty
              ? _buildEmptyState()
              : _buildCharacterGrid(),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset('assets/pics/rick.png'),
        ),
        const SizedBox(height: 20),
        _buildFetchButton(),
      ],
    );
  }

  Widget _buildFetchButton() {
    return Center(
      child: Platform.isIOS
          ? CupertinoButton(
              color: Theme.of(context).colorScheme.secondary,
              child: Text(
                'Show Characters',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              onPressed: () => fetchCharacters(),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                elevation: 4.0,
                shadowColor: Colors.black,
              ),
              onPressed: () => fetchCharacters(),
              child: Text(
                'Show Characters',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
    );
  }

  SliverGridDelegate _gridDelegate() {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: Platform.isIOS ? 1 : 2,
      mainAxisSpacing: Platform.isIOS ? 1 : 2,
      childAspectRatio: Platform.isIOS ? 0.84 : 0.75,
    );
  }

  Widget _buildCharacterGrid() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: _gridDelegate(),
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return CharacterCard(characters[index]);
        },
      ),
    );
  }

  void fetchCharacters() async {
    setState(() {
      _loading = true;
    });

    GraphQLClient client = GraphQLClientProvider.initClient();
    QueryResult queryResult =
        await GraphQLClientProvider.fetchCharacters(client);

    if (!queryResult.hasException) {
      setState(() {
        characters = queryResult.data!['characters']['results'];
      });
    }

    setState(() {
      _loading = false;
    });
  }
}
