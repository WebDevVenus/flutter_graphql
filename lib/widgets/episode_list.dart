import 'dart:io';

import 'package:flutter/material.dart';
import './my_text.dart';

class EpisodeList extends StatelessWidget {
  final List<dynamic> episods;

  EpisodeList(this.episods);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? _buildIOSList() : _buildAndroidList();
  }

  Widget _buildIOSList() {
    return SizedBox(
      child: ListView.builder(
        itemCount: episods.length,
        itemBuilder: (context, index) => _buildListItem(index),
      ),
    );
  }

  Widget _buildAndroidList() {
    return SizedBox(
      child: ListView.builder(
        itemCount: episods.length,
        itemBuilder: (context, index) => _buildListItem(index),
      ),
    );
  }

  Widget _buildListItem(int index) {
    var episode = episods[index];
    return Card(
      color: Color.fromARGB(255, 125, 191, 108),
      child: ListTile(
        leading: MyText(
          myTitle: episode['episode'],
        ),
        title: MyText(
          myTitle: episode['name'],
        ),
        subtitle: MyText(
          myTitle: episode['air_date'],
        ),
      ),
    );
  }
}
