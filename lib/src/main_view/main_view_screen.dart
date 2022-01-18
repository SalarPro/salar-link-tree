import 'package:flutter/material.dart';
import 'package:salarlinktree/src/config/config_data.dart';
import 'package:url_launcher/url_launcher.dart';

class MainView extends StatefulWidget {
  MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //imageView
                  Center(
                      child: Stack(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(48), // Image radius
                            child: Image.network(userModel.peofileImage!,
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Container(
                          child: Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Colors.grey[500],
                          child: Text(
                            userModel.currentState ?? "",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )),
                    ],
                  )),

                  //bio
                  Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey[300]),
                      child: Center(
                        child: Container(
                          child: Text(userModel.bio ?? ""),
                        ),
                      )),

                  //Social Links
                  Container(
                    height: 400,
                    child: ListView.builder(
                      itemCount: userModel.socialMedia?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent),
                          onPressed: () async {
                            await _launchInBrowser(
                                userModel.socialMedia?[index].link ?? "");
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  child: Image(
                                      image: AssetImage(
                                          "images/${userModel.socialMedia?[index].imageUrl ?? "call.png"}")),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                      userModel.socialMedia?[index].name ??
                                          "No social"),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  //Contact Links
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: userModel.contact?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent),
                          onPressed: () async {
                            if (userModel.contact?[index].name == "Phone") {
                              _makePhoneCall(userModel.contact?[index].link ??
                                  "+9647503505440");
                            } else {
                              await _launchInBrowser(
                                  userModel.contact?[index].link ?? "");
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.amber),
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  child: Image(
                                      image: AssetImage(
                                          "images/${userModel.contact?[index].image ?? "call.png"}")),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  //end of column
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }
}

/*

Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //imageView
            Center(
                child: Stack(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(48), // Image radius
                      child: Image.network(userModel.peofileImage!,
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Container(
                    child: Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.grey[500],
                    child: Text(
                      userModel.currentState ?? "",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
              ],
            )),

            //bio
            Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[300]),
                child: Center(
                  child: Container(
                    child: Text(userModel.bio ?? ""),
                  ),
                )),

            //Social Links
            Container(
              height: 200,
              child: ListView.builder(
                itemCount: userModel.socialMedia?.length ?? 0,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Image(
                              image: AssetImage(
                                  "images/${userModel.socialMedia?[index].imageUrl ?? "call.png"}")),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(userModel.socialMedia?[index].name ??
                              "No social"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            //Contact Links
            // Container(
            //   height: 100,
            //   width: 400,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: userModel.contact?.length ?? 0,
            //     itemBuilder: (context, index) {
            //       return Container(
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             color: Colors.amber),
            //         padding: EdgeInsets.all(10),
            //         child: Row(
            //           children: [
            //             Container(
            //               width: 50,
            //               height: 50,
            //               child: Image(
            //                   image: AssetImage(
            //                       "images/${userModel.contact?[index].image ?? "call.png"}")),
            //             ),
            //             Container(
            //               padding: EdgeInsets.only(left: 10),
            //               child: Text(userModel.socialMedia?[index].name ??
            //                   "No social"),
            //             ),
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // ),

            //end of column
          ],
        ),

*/