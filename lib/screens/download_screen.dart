import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DownloadScreen extends StatefulWidget {
  @override
  _DownloadScreenState createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  late Directory _downloadsDirectory;
  List<FileSystemEntity> _downloadedFiles = [];

  @override
  void initState() {
    super.initState();
    _loadDownloadedFiles();
  }

  Future<void> _loadDownloadedFiles() async {
    final directory = await getApplicationDocumentsDirectory();
    setState(() {
      _downloadsDirectory = Directory('${directory.path}/Downloads');
      _downloadedFiles = _downloadsDirectory.listSync();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Downloaded Music'),
      ),
      body: _downloadedFiles.isEmpty
          ? Center(
              child: Text('No downloaded music found.'),
            )
          : ListView.builder(
              itemCount: _downloadedFiles.length,
              itemBuilder: (context, index) {
                final file = _downloadedFiles[index];
                return ListTile(
                  title: Text(file.path.split('/').last),
                  trailing: IconButton(
                    icon: Icon(Icons.play_arrow),
                    onPressed: () {
                      // Müzik oynatma işlevini burada ekleyin
                      _playMusic(file);
                    },
                  ),
                  onTap: () {
                    // Müzik dosyasını yönetin (silme, paylaşma vb.)
                    _showOptions(context, file);
                  },
                );
              },
            ),
    );
  }

  void _playMusic(FileSystemEntity file) {
    // Müzik oynatma işlemini buraya ekleyin
    // Örneğin, `audioplayers` paketini kullanarak müziği çalabilirsiniz.
  }

  void _showOptions(BuildContext context, FileSystemEntity file) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete'),
              onTap: () {
                _deleteFile(file);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share'),
              onTap: () {
                // Paylaşma işlevini buraya ekleyin
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteFile(FileSystemEntity file) {
    file.deleteSync();
    setState(() {
      _downloadedFiles.remove(file);
    });
  }
}
