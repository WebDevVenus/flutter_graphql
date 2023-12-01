import 'package:flutter/material.dart';
import './my_text.dart';

class ItemInfoCard extends StatelessWidget {
  final String status;
  final String species;
  final String gender;
  final String origin;
  final String locName;

  ItemInfoCard(
      this.status, this.species, this.gender, this.origin, this.locName);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          myTitle: 'Status:  $status',
        ),
        MyText(
          myTitle: 'Species:  $species',
        ),
        MyText(
          myTitle: 'Gender:  $gender',
        ),
        MyText(
          myTitle: 'Origin:  $origin',
        ),
        MyText(
          myTitle: 'Location:  $locName',
        ),
        const MyText(
          myTitle: 'Episodes:',
        ),
      ],
    );
  }
}
