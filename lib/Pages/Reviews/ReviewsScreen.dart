
import 'package:eltuv_use/Widget/customTextField.dart';
import 'package:eltuv_use/Widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class ReviewsScreen extends StatefulWidget {

  @override
  _ReviewsScreenState createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  final txtdriverController = TextEditingController();
  final txtresturentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Reviews",
          style: TextStyle(fontSize: size.width * 0.047),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DriverPlusResturent(
                image:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Central_African_Republic_-_Boy_in_Birao.jpg/1200px-Central_African_Republic_-_Boy_in_Birao.jpg",
                name: "Gubin Lastavo",
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              RatingWidget(
                text: "How was the driver?",
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              CustomTextField(
                hint: "Write a Comment",
                textEditingController: txtdriverController,
                maxLines: 3,
              ),
              // Resturant Side

              DriverPlusResturent(
                image:
                "https://brandslogos.com/wp-content/uploads/images/large/burger-king-logo-1.png",
                name: "Burger King",
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              RatingWidget(
                text: "How was the Resturant?",
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              CustomTextField(
                hint: "Write a Comment",
                textEditingController: txtdriverController,
                maxLines: 3,
              ),
              Custombutton(
                title: 'Submint',
                onPress: (){},
                titleColor: Colors.white,
                backgroundColor: Color(0xffC70039),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RatingWidget extends StatelessWidget {
  String text;
  RatingWidget({this.text});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(size.width * 0.045),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          size.width * 0.035,
        ),
      ),
      child: Column(
        children: [
          Text(
            this.text.toString(),
            style: TextStyle(
              fontSize: size.width * 0.047,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: size.width * 0.01,
          ),
          Text(
            "Help us improve our service and your experience by your rating",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: size.width * 0.033,
            ),
          ),
          SizedBox(
            height: size.width * 0.01,
          ),
          StarWidget(
            itemSize: size.width * 0.065,
            initialRating: 3,
            ignoreGestures: false,
          ),
          SizedBox(
            height: size.width * 0.01,
          ),

        ],
      ),
    );
  }
}

class DriverPlusResturent extends StatelessWidget {
  String image;
  String name;
  DriverPlusResturent({this.image, this.name});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(size.width * 0.045),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          size.width * 0.035,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(size.width * 0.01),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  size.width * 0.1,
                ),
                border:
                Border.all(color: Colors.red, width: size.width * 0.005)),
            child: CircleAvatar(
              radius: size.width * 0.085,
              backgroundImage: NetworkImage(this.image.toString()),
            ),
          ),
          SizedBox(
            width: size.width * 0.045,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                this.name.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              StarWidget(
                itemSize: size.width * 0.035,
                initialRating: 3,
                ignoreGestures: true,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                "2345 reviews",
                style: TextStyle(
                  color:Color(0xffd3d3d3),
                  fontSize: size.width * 0.033,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StarWidget extends StatelessWidget {
   double initialRating;
   double itemSize;
  bool ignoreGestures;
  StarWidget(
      {this.initialRating,this.itemSize,
        this.ignoreGestures = false});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return RatingBar.builder(
      initialRating: initialRating,
      minRating: 0,
      unratedColor: Color(0xffd3d3d3),
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      itemSize: itemSize,
      ignoreGestures: ignoreGestures,
      itemPadding: EdgeInsets.symmetric(
        horizontal: size.width * 0.001,
      ),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
