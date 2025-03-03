import 'dart:io';

import 'package:flutter/material.dart';
import 'package:img_picker/img_picker.dart';

class MyUploadPage extends StatefulWidget {
  PageController pageController;

  MyUploadPage({super.key, required this.pageController});

  @override
  State<MyUploadPage> createState() => _MyUploadPageState();
}

class _MyUploadPageState extends State<MyUploadPage> {
  final TextEditingController _textEditingController = TextEditingController();
  File? _image;
  final picker = ImagePicker();

  void _imgFromGalery() async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = File(image.path);
      }
    });
  }

  void _imgFromCamera() async {
    final image = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (image != null) {
        _image = File(image.path);
      }
    });
  }

  void _showBottomPicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: [
                ListTile(
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                  leading: Icon(Icons.photo_camera),
                  title: Text("Camera"),
                ),
                ListTile(
                  onTap: () {
                    _imgFromGalery();
                    Navigator.of(context).pop();
                  },
                  leading: Icon(Icons.photo_library),
                  title: Text("Gallery"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void uploadPost() {
    String caption = _textEditingController.text.trim().toString();
    if (_image == null || caption.isEmpty) return;
    //RTDB save post
    widget.pageController.animateToPage(
      0,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
    setState(() {
      _image = null;
      _textEditingController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Upload",
          style: TextStyle(
            fontFamily: "Billabong",
            color: Color.fromRGBO(193, 53, 132, 1),
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: uploadPost,
            icon: Icon(Icons.save, color: Color.fromRGBO(193, 53, 132, 1)),
          ),
        ],
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              _showBottomPicker();
            },
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              color: Colors.grey.shade300,
              child: Center(
                child:
                    _image == null
                        ? Icon(
                          Icons.add_a_photo_rounded,
                          size: 60,
                          color: Colors.grey,
                        )
                        : Stack(
                          children: [
                            Container(
                              color: Colors.black12,
                              padding: EdgeInsets.all(4),
                              width: double.infinity,
                              child: Image.file(_image!, fit: BoxFit.cover),
                            ),
                            Container(
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _image = null;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.highlight_remove,
                                      size: 35,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: "Caption",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
