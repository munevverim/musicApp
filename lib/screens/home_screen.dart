import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/jamendo_service.dart';
import '../models/music.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final jamendoService = Provider.of<JamendoService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Jamendo Music Downloader'),
      ),
      body: FutureBuilder(
        future: jamendoService.fetchMusic(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: jamendoService.musicList.length,
              itemBuilder: (context, index) {
                Music music = jamendoService.musicList[index];
                return ListTile(
                  title: Text(music.name),
                  subtitle: Text(music.artistName),
                );
              },
            );
          }
        },
      ),
    );
  }
}
