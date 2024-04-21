import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

import '../UI/Home/Homepage.dart';

class Progress_gallery extends StatefulWidget {
  @override
  State<Progress_gallery> createState() => _Progress_galleryState();
}

class _Progress_galleryState extends State<Progress_gallery> {
  FirebaseStorage storage = FirebaseStorage.instance;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        title: Text("Progress Gallery", style: TextStyle(fontSize: 24)),
        elevation: 0,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            backgroundColor: Colors.blue,
            onPressed: () => upload('camera'),
            icon: Icon(Icons.camera),
            label: Text("Camera"),
          ),
          SizedBox(width: 8),
          FloatingActionButton.extended(
            backgroundColor: Colors.blue,
            onPressed: () => upload('gallery'),
            icon: Icon(Icons.photo),
            label: Text("Gallery"),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "See the amazing change in this transformation photo!",
              style: GoogleFonts.merriweather(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 23),
            ),
            SizedBox(height: 10),
            Expanded(
              child: FutureBuilder(
                future: loadImage(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final Map<String, dynamic> image =
                        snapshot.data![index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            leading: Image.network(image['url']),
                            title: Text(image['uploaded_by']),
                            subtitle: Text(image['date']),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () =>
                                  _deleteImage(image['path']),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> upload(String source) async {
    final picker = ImagePicker();
    XFile? pickedImage; //to fetch platform dependent path

    try {
      pickedImage = await picker.pickImage(
          source: source == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);
      final String filename =
      path.basename(pickedImage!.path); // path name before / or //
      File imageFile = File(pickedImage.path); //actual path of picked data

      try {
        await storage.ref(filename).putFile(
            imageFile,
            SettableMetadata(
                customMetadata: {'uploaded_by': 'A USER', 'date': '1/1/2021'}));
        setState(() {});
      } on FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<List<Map<String, dynamic>>> loadImage() async {
    List<Map<String, dynamic>> files = [];
    final ListResult result = await storage.ref().list();
    final List<Reference> allfiles = result.items;

    await Future.forEach<Reference>(allfiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata filemeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        'uploaded_by': filemeta.customMetadata?['uploaded_by'] ?? 'NoBody',
        'date': filemeta.customMetadata?['date'] ?? "00/00/0000"
      });
    });
    return files;
  }

  Future<void> _deleteImage(String path) async {
    try {
      await storage.ref(path).delete();
      setState(() {});
      // Show a SnackBar or any other feedback to indicate successful deletion.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Image deleted successfully!'),
        ),
      );
    } catch (error) {
      // Handle the error, and show an error message if needed.
      if (kDebugMode) {
        print(error);
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error deleting image. Please try again.'),
        ),
      );
    }
  }
}
