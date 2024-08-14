import 'package:flutter/material.dart';
import '../models/music.dart';

class MusicCard extends StatelessWidget {
  final Music music;

  MusicCard({required this.music});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          // Assuming `albumImage` is the correct field in your `Music` model for the image URL
          Image.network(music.albumImage), 
          ListTile(
            // Assuming `name` and `artistName` are correct fields in your `Music` model
            title: Text(music.name), 
            subtitle: Text(music.artistName),
          ),
          ElevatedButton(
            onPressed: () {
              // Trigger the download functionality here
            },
            child: Text('Download'),
          ),
        ],
      ),
    );
  }
}

