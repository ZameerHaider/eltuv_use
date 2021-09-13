import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:eltuv_use/Widget/customTextField.dart';
import 'package:eltuv_use/Widget/custom_button.dart';
import 'package:eltuv_use/Widget/simpletextfield.dart';
import 'package:eltuv_use/managers/api_manager.dart';
import 'package:eltuv_use/utilities/api_constants.dart';
import 'package:eltuv_use/utilities/customloader.dart';
import 'package:eltuv_use/utilities/helper_functions.dart';
import 'package:eltuv_use/utilities/image_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class editprofile extends StatefulWidget {
  String fname = " ";
  String lname = "";

  String address = " ";
  editprofile({this.fname, this.address, this.lname});

  @override
  _editprofileState createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  String userId = "";
  @override
  void initState() {
    HelperFunctions.getFromPreference("firebaseUId")
        .then((value) => userId = value);
    super.initState();
    fnameController.text = widget.fname;
    lnameController.text = widget.lname;
    addressController.text = widget.address;
  }

  String userImage = "";

  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final addressController = TextEditingController();
  File _image;
  final picker = ImagePicker();
  Future getImagefromcamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        Navigator.pop(context);
        print(_image.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImagefromgallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        Navigator.pop(context);
      } else {
        print('No image selected.');
      }
    });
  }

  bool isLoading = false;
  List<CustomMultipartObject> files = [];
  _callUpdateUser(BuildContext context) {
    this.setState(() {
      isLoading = true;
    });

    Map<String, String> body = Map<String, String>();

    body['firstname'] = fnameController.text;
    body['lastname'] = lnameController.text;
    body['address'] = addressController.text;
    body['user_id'] = userId;

    log(jsonEncode(body));

    Map<String, String> header = Map<String, String>();

    FocusScope.of(context).requestFocus(FocusNode());
    CustomMultipartObject obj =
        CustomMultipartObject(file: _image, param: "image");
    files.add(obj);
    ApiCallMultiPart networkCall =
        ApiCallMultiPart(APIConstants.updateUser, body, header);

    networkCall.callMultipartPostAPI(files, context).then((response) async {
      log(jsonEncode(response));
      print('Back from api');

      this.setState(() {
        isLoading = false;
      });

      bool status = response['status'];
      if (status == true) {
        HelperFunctions.showAlert(
            context: context,
            header: "Eltuv",
            widget: Text(response["message"]),
            btnDoneText: "ok",
            onDone: () {
              Navigator.of(context).pop(
                context,
              );
            },
            onCancel: () {});
      } else {
        HelperFunctions.showAlert(
            context: context,
            header: "Eltuv",
            widget: Text(response["message"]),
            btnDoneText: "ok",
            onDone: () {},
            onCancel: () {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return CustomLoader(
      isLoading: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Edit profile',
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffC70034),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: userImage == "" && _image == null
                            ? Image.network(
                                'https://www.kindpng.com/picc/m/252-2524695_dummy-profile-image-jpg-hd-png-download.png',
                                fit: BoxFit.fill,
                                height: size.width * 0.2,
                                width: size.width * 0.2,
                              )
                            : Image.file(
                                _image,
                                fit: BoxFit.fill,
                                height: size.width * 0.2,
                                width: size.width * 0.2,
                              ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    right: -15,
                    child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffC70034),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.02,
                            vertical: MediaQuery.of(context).size.height * 0.01,
                          ),
                          child: InkWell(
                              onTap: () {
                                CustomBottomSheetCamera.bottomSheet(context,
                                    () {
                                  getImagefromcamera();
                                }, () {
                                  getImagefromgallery();
                                });
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              )),
                        )),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              TitleWidget('First Name'),
              CustomTextField(
                // hint: widget.fname,
                textEditingController: fnameController,
              ),
              TitleWidget('Last Name'),
              CustomTextField(
                // hint: widget.lname,
                textEditingController: lnameController,
              ),
              TitleWidget('Address'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              CustomTextField(
                // hint: widget.address,
                textEditingController: addressController,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Custombutton(
                onPress: () {
                  _callUpdateUser(context);
                },
                title: 'Update',
                titleColor: Colors.white,
                backgroundColor: Color(0xffC70034),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  String title = "";
  TitleWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02),
          child: Align(alignment: Alignment.bottomLeft, child: Text(title)),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
      ],
    );
  }
}
