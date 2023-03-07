import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';import 'package:path/path.dart'as path;

class FireStorageDemo extends StatefulWidget {
  const FireStorageDemo({Key? key}) : super(key: key);

  @override
  State<FireStorageDemo> createState() => _FireStorageDemoState();
}

class _FireStorageDemoState extends State<FireStorageDemo> {
  FirebaseStorage storage=FirebaseStorage.instance;
  Future<void> _upload(String inputSource)async{
    final picker=ImagePicker();
    XFile? pickedImage;
    try{
      pickedImage=await picker.pickImage(
          source:inputSource=='camera'? ImageSource.camera:ImageSource.gallery,maxWidth: 1920
      );
      final String fileName=path.basename(pickedImage!.path);
      File imageFile=File(pickedImage.path);
      try{
        await storage.ref(fileName).putFile(imageFile,SettableMetadata(
            customMetadata: {
              'uploaded_by':'A bad guy',
              'description':'some dsecription'
            }
        ));
        setState(() {

        });
      }on FirebaseException catch (error){
        if(kDebugMode){
          print(error);
        }
      }
    }catch (err){
      if(kDebugMode){
        print(err);
      }
    }
  }
  // Retriew the uploaded images
  // This function is called when the app launches for the first time or when an image is uploaded or deleted
  Future<List<Map<String, dynamic>>> _loadImages() async {

    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref().list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles,
            (file) async {
          final String fileUrl = await file.getDownloadURL();
          final FullMetadata fileMeta = await file.getMetadata();

          files.add({
            "url": fileUrl,
            "path": file.fullPath,
            "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
            "description": fileMeta.customMetadata?['description'] ?? 'No description'
          });
        });
    return files;
  }

  // Delete the selected image
  // This function is called when a trash icon is pressed
  Future<void> _delete(String ref) async {
    await storage.ref(ref).delete();
    // Rebuild the UI
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(onPressed: () {
                _upload("camera");

              }, icon: Icon(Icons.camera), label: Text("camera")),
              ElevatedButton.icon(onPressed: () {
                _upload("gallery");

              }, icon: Icon(Icons.photo), label: Text("Gallery")),

            ],
          ),

          Expanded(
              child: FutureBuilder(
                future: _loadImages(),
                builder: (context, AsyncSnapshot<List<Map<String,dynamic>>>snapshot) {
                  if(snapshot.connectionState==ConnectionState.done){
                    return ListView.builder(
                      itemCount: snapshot.data?.length??0,
                      itemBuilder: (context, index) {
                        final Map<String,dynamic>image=snapshot.data![index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            dense: false,
                            leading: Image.network(image['url']),
                            title: Text(image['uploaded_by']),
                            subtitle: Text(image['path']),
                            trailing: IconButton(onPressed: () {
                              _delete(image['path']);
                            }, icon: Icon(Icons.delete)),

                          ),
                        );

                      },);
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ))
        ],
      ),
    );
  }
}
