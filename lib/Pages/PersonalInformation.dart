import 'dart:convert';
import 'dart:io';

import 'package:eltuv_use/Data/constant/Strings.dart';
import 'package:eltuv_use/Data/models/UserModel.dart';
import 'package:eltuv_use/Data/response/AddProfileResponse.dart';

import 'package:eltuv_use/Pages/HomeScreen.dart';
import 'package:eltuv_use/managers/api_manager.dart';
import 'package:eltuv_use/utilities/api_constants.dart';
import 'package:eltuv_use/utilities/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../AppColors.dart';
import '../Widget/ButtonWidget.dart';
import '../Widget/PersonInput.dart';

import 'package:image_picker/image_picker.dart';

class PersonalInformation extends StatefulWidget {
  final String phoneNumber;

  const PersonalInformation({
    Key key,
    this.phoneNumber,
  }) : super(key: key);
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  TextEditingController fNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController provinceController = TextEditingController();

  File _image;
  bool uploadingImage = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    "Personal Details",
                    style: TextStyle(
                        color: colorBlack,
                        fontWeight: FontWeight.w600,
                        fontSize: 25),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        _showPicker(context);
                      },
                      child: CircleAvatar(
                        radius: 55,
                        backgroundColor: Color(0xffFDCF09),
                        child: _image != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.file(
                                  _image,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fitHeight,
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(50)),
                                width: 100,
                                height: 100,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.grey[800],
                                ),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  PersonalWidget(
                    controller: fnameController,
                    hintText: "First Name",
                  ),
                  PersonalWidget(
                    controller: lastNameController,
                    hintText: "Last Name",
                  ),
                  PersonalWidget(
                    controller: cityController,
                    hintText: "City",
                  ),
                  PersonalWidget(
                    controller: provinceController,
                    hintText: "Province",
                  ),
                  PersonalWidget(
                    controller: addressController,
                    hintText: "Address",
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  custom_btn(
                    text: "Enter",
                    onPressed: () {
                      if (validate()) {
                        _callAPICheckPhone(context);
                      }
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    "By typing Enter You agree with Tuktuk's",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "TERMS OF SERVICE",
                        style: TextStyle(color: colorPrimary, fontSize: 15),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text("and"),
                      ),
                      Text(
                        "PRIVACY POLICY",
                        style: TextStyle(color: colorPrimary, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          isLoading
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black26,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  bool validate() {
    if (fnameController.text.isEmpty) {
      showSnackBar(context, "First Name is Required");
      return false;
    }
    if (lastNameController.text.isEmpty) {
      showSnackBar(context, "Last Name is Required");
      return false;
    }
    if (addressController.text.isEmpty) {
      showSnackBar(context, "Address is Required");
      return false;
    }

    return true;
  }

  _callAPICheckPhone(BuildContext context) {
    this.setState(() {
      isLoading = true;
    });

    Map<String, dynamic> body = Map<String, dynamic>();
    body['address'] = addressController.text;

    body['province'] = provinceController.text;
    body['firstName'] = fnameController.text;
    body['lastName'] = lastNameController.text;
    body['city'] = cityController.text;
    body['phone'] = widget.phoneNumber;
    body['type'] = "normal";

    Map<String, String> header = Map<String, String>();

    FocusScope.of(context).requestFocus(FocusNode());

    ApiManager networkCal =
        ApiManager(APIConstants.signup, body, false, header);

    networkCal.callPostAPI(context).then((response) {
      print('Back from api');

      this.setState(() {
        isLoading = false;
      });

      bool status = response['status'];
      if (status == true) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        HelperFunctions.showAlert(
          context: context,
          header: "Eltuv",
          widget: Text(response["message"]),
          btnDoneText: "ok",
          onDone: () {},
          onCancel: () {},
        );
      }
    });
  }

  // addProfile() async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   var apiUrl = Strings.profile_user;

  //   var request = new http.MultipartRequest("POST", Uri.parse(apiUrl));

  //   request.fields['address'] = addressController.text;

  //   request.fields['province'] = provinceController.text;
  //   request.fields['firstName'] = fnameController.text;
  //   request.fields['lastName'] = lastNameController.text;
  //   request.fields['city'] = cityController.text;
  //   request.fields['phone'] = widget.phoneNumber;
  //   request.fields['type'] = "normal";
  //   // request.files.add(
  //   //   new http.MultipartFile.fromBytes('image', await _image.readAsBytes(),
  //   //       filename: 'image.png'),
  //   // );

  //   request
  //       .send()
  //       .then((result) async {
  //         await http.Response.fromStream(result).then((response) {
  //           if (response.statusCode == 200) {
  //             Navigator.pushAndRemoveUntil(
  //                 context,
  //                 MaterialPageRoute(
  //                     builder: (BuildContext context) => HomeScreen()),
  //                 (route) => false);
  //             print("Uploaded! ");
  //             print('response.body ' + response.body);
  //           } else {
  //             print('response.body ' + response.body);
  //           }
  //         });
  //       })
  //       .catchError((err) => print('error : ' + err.toString()))
  //       .whenComplete(() {});
  // }

  _imgFromCamera() async {
    XFile image = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      _image = File(image.path);
    });
  }

  _imgFromGallery() async {
    XFile image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image.path);
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}

showSnackBar(BuildContext context, String str) {
  final snackBar = SnackBar(
    content: Text(
      str,
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.black87,
    duration: Duration(seconds: 1),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
