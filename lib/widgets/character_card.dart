import 'package:flutter/material.dart';
import '../character_details.dart';

class CharacterCard extends StatelessWidget {
  final dynamic character;

  CharacterCard(this.character);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: Theme.of(context).colorScheme.secondary,
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                character['image'],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3),
              child: Text(
                character['name'],
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CharacterDetails(
            name: character['name'],
            image: character['image'],
            status: character['status'],
            species: character['species'],
            gender: character['gender'],
            origin: character['origin']['name'],
            locName: character['location']['name'],
            episods: character['episode'],
          ),
        ),
      ),
    );
  }
}
