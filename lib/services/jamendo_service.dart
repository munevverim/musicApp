import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/music.dart';

class JamendoService extends ChangeNotifier {
  static const String baseUrl = 'https://api.jamendo.com/v3.0/';
  static const String clientId = '540ab932'; // Buraya kendi Client ID'nizi ekleyin

  List<Music> _musicList = [];

  List<Music> get musicList => _musicList;

  Future<void> fetchMusic() async {
    try {
      final response = await http.get(
        Uri.parse('${baseUrl}tracks/?client_id=$clientId&limit=10'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> json = jsonDecode(response.body)['results'];
        _musicList = json.map((data) => Music.fromJson(data)).toList();
        notifyListeners(); // Değişiklikleri bildirmek için notifyListeners kullanılır
      } else {
        throw Exception('Failed to load music: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching music: $error');
      throw Exception('Failed to load music due to error: $error');
    }
  }
}

