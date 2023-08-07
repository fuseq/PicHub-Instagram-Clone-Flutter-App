import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pichub/models/utils.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  bool isLoading = false;
  final TextEditingController _descriptionController = TextEditingController();

  _selectImage(BuildContext parentContext) async {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Create a Post'),
          children: <Widget>[
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.camera);
                  if (file != null) {
                    String base64Image =
                        base64Encode(file); // Convert to base64
                    print('Base64 image: $base64Image'); // Print to console
                    setState(() {
                      _file = file;
                    });
                  }
                }),
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from Gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  if (file != null) {
                    String base64Image = base64.encode(file);
                    // Convert to base64
                    log(base64Image); // Print to console
                    setState(() {
                      _file = file;
                    });
                  }
                }),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  Future<void> addPostToFirestore(
      String uid, String username, String title, String image64) async {
    setState(() {
      isLoading = true;
    });
    // Start the loading

    try {
      // Convert base64 string to bytes (Uint8List)
      Uint8List imageBytes = base64Decode(base64Encode(_file!));

      // Prepare the data for the new post
      Map<String, dynamic> postData = {
        'caption': _descriptionController.text,
        'id': uid, // or you can use another method to generate a unique id
        'imageUrl':
            image64, // You may upload the image to storage and set the URL here
        'location':
            'location', // You can set the location if you have this information
        'postedBy': username,
        'postedTime': FieldValue.serverTimestamp().toString(),
        'title': title, // Set the title if you have this information
        'totalComments': '10',
        'totalLikes': '20',
      };

      // Use Firestore API to add the new post document
      await FirebaseFirestore.instance
          .collection('posts') // Assuming the collection name is 'posts'
          .doc() // Firestore will generate a unique ID for the new document
          .set(postData);

      setState(() {
        isLoading = false;
      });

      if (context.mounted) {
        showSnackBar(
          context,
          'Posted!',
        );
      }

      clearImage();
    } catch (err) {
      print('Hata-' + err.toString());
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  void postImage(String uid, String username, String profImage) async {
    setState(() {
      isLoading = true;
    });
    // start the loading
    try {
      // upload to storage and db
      /*String res = await FireStoreMethods().uploadPost(
        _descriptionController.text,
        _file!,
        uid,
        username,
        profImage,
      );
      */
      //if (res == "success") {
      if (true) {
        setState(() {
          isLoading = false;
        });
        if (context.mounted) {
          showSnackBar(
            context,
            'Posted!',
          );
        }
        clearImage();
      } else {
        if (context.mounted) {
          //showSnackBar(context, res);
          showSnackBar(context, "test");
        }
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final UserProvider userProvider = Provider.of<UserProvider>(context);

    return _file == null
        ? Center(
            child: IconButton(
              icon: const Icon(
                Icons.upload,
              ),
              onPressed: () => _selectImage(context),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: clearImage,
              ),
              title: const Text(
                'Post to',
              ),
              centerTitle: false,
              actions: <Widget>[
                /* TextButton(
                  onPressed: () => postImage(
                    userProvider.getUser.uid,
                    userProvider.getUser.username,
                    userProvider.getUser.photoUrl,
                  ),
                  
                  child: const Text(
                    "Post",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                )*/
              ],
            ),
            // POST FORM
            body: Column(
              children: <Widget>[
                isLoading
                    ? const LinearProgressIndicator()
                    : const Padding(padding: EdgeInsets.only(top: 0.0)),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //CircleAvatar(
                    // backgroundImage: NetworkImage(
                    //   userProvider.getUser.photoUrl,
                    // ),
                    //),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                            hintText: "Write a caption...",
                            border: InputBorder.none),
                        maxLines: 8,
                      ),
                    ),
                    SizedBox(
                      height: 45.0,
                      width: 45.0,
                      child: AspectRatio(
                        aspectRatio: 487 / 451,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.fill,
                            alignment: FractionalOffset.topCenter,
                            image: MemoryImage(_file!),
                          )),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          addPostToFirestore(
                              'id',
                              'user',
                              _descriptionController.text,
                              base64Encode(_file!));
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyHomePage(),
                          ));
                        },
                        icon: const Icon(Icons.add_a_photo_outlined)),
                  ],
                ),
                const Divider(),
              ],
            ),
          );
  }
}
