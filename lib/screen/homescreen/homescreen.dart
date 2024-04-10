
import 'dart:io';
import 'package:core_exam/screen/detailscreen/detailscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
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
        title: Text('Student Details',style: TextStyle(color: Colors.white),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          Navigator.pushNamed(context, '/second');
          setState(() {

          });
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Stack(
            children: [
              Center(
                child: Container(
                  height: 100,
                  width: 340,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 20,top: 10),
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      // image
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 20,left: 120),
                    child: Text(text.text,style: TextStyle(color: Colors.white),),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 20,left: 120),
                    child: Text(text2.text,style: TextStyle(color: Colors.white),),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 20,left: 120),
                    child: Text(text3.text,style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 250,top: 25),
                    child: IconButton(onPressed: (){
                      showDialog(context: context, builder: (context) =>
                          SingleChildScrollView(
                            child: AlertDialog(
                            actions: [
                              Column(
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
                                              ? Image.file(_imageFile!,fit: BoxFit.cover,)
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
                                      Navigator.of(context).pop('/');
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
                              )
                            ],
                            ),
                          ),
                        );
                    }, icon: Icon(Icons.edit,color: Colors.white,)),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 25),
                    child: IconButton(onPressed: ()
                      {

                      },icon: Icon(Icons.delete,color: Colors.white,),),

                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

int index=0;