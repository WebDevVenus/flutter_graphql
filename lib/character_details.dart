//import 'dart:io';
import 'package:flutter/material.dart';
import './widgets/item_info_card.dart';
import './widgets/episode_list.dart';

class CharacterDetails extends StatelessWidget {
  final String name;
  final String image;
  final String status;
  final String species;
  final String gender;
  final String origin;
  final String locName;
  final List<dynamic> episods;

  const CharacterDetails({
    super.key,
    required this.name,
    required this.image,
    required this.status,
    required this.species,
    required this.gender,
    required this.origin,
    required this.locName,
    required this.episods,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          name,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Image.network(
                image,
                height: 230,
                width: 230,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            ItemInfoCard(status, species, gender, origin, locName),
            Expanded(
              child: EpisodeList(episods),
            ),
          ],
        ),
      ),
    );
  }
}
