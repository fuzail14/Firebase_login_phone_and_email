import 'package:firebaseproject/module/Admin/Controller/admin_screen_controller.dart';
import 'package:firebaseproject/module/PhoneLogin/View/phone_login.dart';
import 'package:firebaseproject/utils/constants.dart';
import 'package:firebaseproject/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List customers = [];

  @override
  void initState() {
    AdminScreenController.customers.add(AdminScreenController(
        name: 'Muhammad Ali',
        phone: '+923365067568',
        address: 'office #,Street #,City Area',
        cylindertype: 'Small Cylinder'));

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f5f9),
      body: SingleChildScrollView(
        child: Container(
          height: 1000,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.340,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/appbarpic.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.083,
                        left: 20,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100,
                              child: Image(
                                image: AssetImage('assets/logo.png'),
                                height: 80,
                              ),
                            ),
                            Container(
                              width: 100,
                              child: Icon(
                                Icons.notifications_active,
                                color: Colors.white,

                                size: 40.0,
                                textDirection: TextDirection.ltr,
                                semanticLabel:
                                    'Icon', // Announced in accessibility modes (e.g TalkBack/VoiceOver). This label does not show in the UI.
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/fuzail.jpg',
                          height: 150.0,
                          width: 60.0,
                        ),
                      ),
                      title: Text(
                        'Good Morning!',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        'Muhammad Ali',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 250, left: 20),
                child: Container(
                  // decoration:
                  //     BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  height: 150,
                  width: 354,

                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "32",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade600,
                                  fontSize: 30),
                            ),
                            Text(
                              "43",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade600,
                                  fontSize: 30),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(width: 40),
                            Container(
                                height: 15,
                                width: 18,
                                child: Image.asset("assets/noteicon.png")),
                            Text(
                              "Total Orders",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 17, 98, 168),
                                  fontSize: 17),
                            ),
                            SizedBox(width: 20),
                            Container(
                                height: 15,
                                width: 20,
                                child: Image.asset("assets/truckicon.png")),
                            SizedBox(width: 3),
                            Text(
                              "Cars Registered",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 17, 98, 168),
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 360),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 3,
                        child: Container(
                          height:
                              MediaQuery.of(context).size.height * 0.190, //88
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 14, bottom: 12, left: 12),
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.100, //61
                                  width: MediaQuery.of(context).size.width *
                                      0.185, //70
                                  color: Color(0xffeaeaea),
                                  child: Image.asset("assets/image1.png"),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.025,
                                        left: 125),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Text(
                                            "شوق سے بدلو مگر ",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.044, //16
                                                fontFamily: "OpenSansSemiBold"),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: const Size(100, 40),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        14.0),
                                              ),
                                            ),
                                            child: Text(
                                              'شوق سے',
                                              style: TextStyle(fontSize: 16),
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
