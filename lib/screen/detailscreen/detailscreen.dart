import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class detailscreen extends StatefulWidget {
  const detailscreen({super.key});

  @override
  State<detailscreen> createState() => _detailscreenState();
}
TextEditingController text=TextEditingController();
TextEditingController text2=TextEditingController();
TextEditingController text3=TextEditingController();


class _detailscreenState extends State<detailscreen> {
  File? _imageFile;
  Map temp={

};
  Future<void> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.black,
        title: Text('Add Data',style: TextStyle(color: Colors.white),),
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons. arrow_back,color: Colors.white,)),
      ),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 20,),

            Center(
              child: GestureDetector(
                onTap: _getImage,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: _imageFile != null
                        ? Image.file(_imageFile!,fit: BoxFit.cover, )
                        : Icon(Icons.camera_alt, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Center(
              child: Container(
                height: 50,
                width: 300,
                child: TextField(
                  controller:text ,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'Enter The Grid',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 50,
                width: 300,
                child: TextField(
                  controller:text2 ,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'Enter Std ',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 50,
                width: 300,
                child: TextField(
                  controller:text3,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'Enter The Name ',
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),
            InkWell(
              onTap: ()
              {
                setState(() {
                  grid= text.text;
                  std=text2.text;
                  name = text3.text;
                });
              },
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Center(child: Text('Save',style: TextStyle(color: Colors.white),)),
              ),
            )
          ],
        ),
      ),

    );
  }
}
late String name;
late String grid;
late String std;