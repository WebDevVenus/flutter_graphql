import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLClientProvider {
  // URL of the GraphQL endpoint
  static const String _graphqlEndpoint = 'https://rickandmortyapi.com/graphql';

  // Initialize the GraphQL client
  static GraphQLClient initClient() {
    final Link link = HttpLink(_graphqlEndpoint);

    return GraphQLClient(
      cache: GraphQLCache(store: HiveStore()), // Using HiveStore for caching
      link: link,
    );
  }

  // Fetch characters from the API
  static Future<QueryResult> fetchCharacters(GraphQLClient client) async {
    const String fetchCharactersQuery = '''
      query {
        characters {
          results {
            name
            image
            status
            species
            gender
            origin {
              name
            }
            location {
              name
            }
            episode {
              id
              name
              air_date
              episode
            }
          }
        }
      }
    ''';

    QueryResult result = await client.query(
      QueryOptions(
        document: gql(fetchCharactersQuery),
      ),
    );

    if (result.hasException) {
      // Handle error
      return result;
    }
//Simplify name
    List characters = result.data?['characters']['results'];
    for (var character in characters) {
      List<String> words = character['name'].split(' ');
      if (words.length > 1) {
        character['name'] = words.sublist(0, 1).join(' ');
      }
      // Simplify origin
      List<String> originWords = character['origin']['name'].split(' ');
      if (originWords.length > 1) {
        character['origin']['name'] = originWords.sublist(0, 1).join(' ');
      }
      // Simplify location
      List<String> locationWords = character['location']['name'].split(' ');
      if (locationWords.length > 1) {
        character['location']['name'] = locationWords.sublist(0, 1).join(' ');
      }
    }

    return result;
  }
}
