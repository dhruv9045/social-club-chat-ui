import 'package:carousel_slider/carousel_slider.dart';
import 'package:chat_app_/screens/add_group.dart';
import 'package:chat_app_/screens/groupparticipantsselection.dart';
import 'package:chat_app_/widgets/chat.dart';
import 'package:chat_app_/widgets/chat_widget.dart';
import 'package:chat_app_/widgets/iconn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/group_notification.dart';

class groupscreen extends StatefulWidget {
  @override
  State<groupscreen> createState() => _groupscreenState();
}

class _groupscreenState extends State<groupscreen> {
  // const groupscreen({Key? key}) : super(key: key);
  List colors = [
    0xffa57ecc,
    0xff80b2c4,
    0xffcc7ec2,
    0xffa57ecc,
    0xff80b2c4,
    0xffcc7ec2
  ];

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  List items = [
    "Flutter Community",
    "Random Stuff",
    "Gamers",
    "Designers",
    "Singers"
  ];

  List nums = [0, 1, 2, 3, 4, 5, 6, 7, 8];

  ScrollController controller = ScrollController();

  bool closeTopContainer = false;
  double topContainer = 0;

  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .9,
      child: Column(
        children: [
          const SizedBox(height: 20),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: closeTopContainer ? 0 : 1,
            child: AnimatedContainer(
              alignment: Alignment.topCenter,
              height: closeTopContainer ? 0 : Get.height * 0.20,
              duration: const Duration(milliseconds: 2000),
              width: Get.width,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 140.0,
                  enlargeCenterPage: false,
                  viewportFraction: 0.5,
                ),
                items: items.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width / 2,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Color(colors.elementAt(items.indexOf(i))),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.white10,
                                  offset: Offset(5.0, 5.0),
                                  blurRadius: 15.0,
                                  spreadRadius: 1.0),
                              BoxShadow(
                                  color: Colors.white10,
                                  offset: Offset(-5.0, -5.0),
                                  blurRadius: 15.0,
                                  spreadRadius: 1.0),
                            ]),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Container(
                                height: 75,
                                width: 80,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(20), // Image border
                                  child: SizedBox.fromSize(
                                    size: Size.fromRadius(45), // Image radius
                                    child: Image.network(
                                        imgList.elementAt(items.indexOf(i)),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 8.0,
                              left: 8.0,
                              child: Text(
                                i,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                      // Stack(
                      //   children:[
                      //     Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Container(
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Text(
                      //                 i,
                      //                 style: TextStyle(
                      //                   color: Colors.white,
                      //                   fontSize: 22,
                      //                   fontWeight: FontWeight.w500,
                      //                 ),
                      //               ),
                      //               CircleAvatar(
                      //                 radius: 15,
                      //                 backgroundColor: Colors.red,
                      //                 child: Text(
                      //                   "1",
                      //                   style: TextStyle(color: Colors.white),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //           SizedBox(height: 30),
                      //           // groupnotification(),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ]            // ));
                    },
                  );
                }).toList(),
              ),
            ),
            // SizedBox(height: 20),
            // Padding(
            //   padding: const EdgeInsets.only(left: 21.0, right: 21.0),
            //   child: Align(
            //     alignment: Alignment.bottomLeft,
            //     child: Text(
            //       "Recents",
            //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 20),
          ),
          Expanded(

              // height: Get.height/2,
              child: ListView(
            controller: controller,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: nums.map((e) {
              double scale = 1.0;
              if (topContainer > 0.5) {
                scale = e + 0.5 - topContainer;
                if (scale < 0) {
                  scale = 0;
                } else if (scale > 1) {
                  scale = 1;
                }
              }
              return chat(
                index: e,
              );
            }).toList(),
          ))
        ],
      ),
    );
  }
}


// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:chat_app_/screens/add_group.dart';
// import 'package:chat_app_/screens/groupparticipantsselection.dart';
// import 'package:chat_app_/widgets/chat.dart';
// import 'package:chat_app_/widgets/chat_widget.dart';
// import 'package:chat_app_/widgets/iconn.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter/cupertino.dart';
// import '../widgets/group_notification.dart';

// class groupscreen extends StatefulWidget {
//   @override
//   State<groupscreen> createState() => _groupscreenState();
// }

// class _groupscreenState extends State<groupscreen> {
//   // const groupscreen({Key? key}) : super(key: key);
//   List colors = [
//     0xffa57ecc,
//     0xff80b2c4,
//     0xffcc7ec2,
//     0xffa57ecc,
//     0xff80b2c4,
//     0xffcc7ec2
//   ];

//   final List<String> imgList = [
//     'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//     'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//     'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//     'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//     'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
//   ];

//   List items = [
//     "Flutter Community",
//     "Random Stuff",
//     "Gamers",
//     "Designers",
//     "Singers"
//   ];

//   List nums = [0, 1, 2, 3,4,5,6,7,8];

//   ScrollController controller =ScrollController();

//   bool closeTopContainer = false;
// double topContainer=0;

//  final CategoriesScroller categoriesScroller = CategoriesScroller();
  

//   List<Widget> itemsData = [];
// List FOOD_DATA = [
//   {
//     "name":"Burger",
//     "brand":"Hawkers",
//     "price":2.99,
//     "image":"burger.png"
//   },{
//     "name":"Cheese Dip",
//     "brand":"Hawkers",
//     "price":4.99,
//     "image":"cheese_dip.png"
//   },{
//     "name":"Burger",
//     "brand":"Hawkers",
//     "price":2.99,
//     "image":"burger.png"
//   },{
//     "name":"Cheese Dip",
//     "brand":"Hawkers",
//     "price":4.99,
//     "image":"cheese_dip.png"
//   },
//   {
//     "name":"Cola",
//     "brand":"Mcdonald",
//     "price":1.49,
//     "image":"cola.png"
//   },
//   {
//     "name":"Fries",
//     "brand":"Mcdonald",
//     "price":2.99,
//     "image":"fries.png"
//   },
//   {
//     "name":"Ice Cream",
//     "brand":"Ben & Jerry's",
//     "price":9.49,
//     "image":"ice_cream.png"
//   },
//   {
//     "name":"Noodles",
//     "brand":"Hawkers",
//     "price":4.49,
//     "image":"noodles.png"
//   },
//   {
//     "name":"Pizza",
//     "brand":"Dominos",
//     "price":17.99,
//     "image":"pizza.png"
//   },
//   {
//     "name":"Sandwich",
//     "brand":"Hawkers",
//     "price":2.99,
//     "image":"sandwich.png"
//   },
//   {
//     "name":"Wrap",
//     "brand":"Subway",
//     "price":6.99,
//     "image":"wrap.png"
//   }
// ];
//  void getPostsData() {
//     List<dynamic> responseList = FOOD_DATA;
//     List<Widget> listItems = [];
//     responseList.forEach((post) {
//       listItems.add(Container(
//           height: 150,
//           margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
//             BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
//           ]),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       post["name"],
//                       style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       post["brand"],
//                       style: const TextStyle(fontSize: 17, color: Colors.grey),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       "\$ ${post["price"]}",
//                       style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
//                     )
//                   ],
//                 ),
//                 Image.asset(
//                   "assets/images/${post["image"]}",
//                   height: double.infinity,
//                 )
//               ],
//             ),
//           )));
//     });
//     setState(() {
//       itemsData = listItems;
//     });
//   }
//   @override
//   void initState() {
//     super.initState();
//     getPostsData();
//     controller.addListener(() {

//       double value = controller.offset/119;

//       setState(() {
//         topContainer = value;
//         closeTopContainer = controller.offset > 50;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
    
//   final Size size = MediaQuery.of(context).size;
//     final double categoryHeight = size.height*0.30;
//     return  Container(
//           height: size.height,
//           child: Column(
//             children: <Widget>[
             
//               AnimatedOpacity(
//                 duration: const Duration(milliseconds: 200),
//                 opacity: closeTopContainer?0:1,
//                 child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 200),
//                     width: size.width,
//                     alignment: Alignment.topCenter,
//                     height: closeTopContainer?0:categoryHeight,
//                     child: categoriesScroller),
//               ),
//               Expanded(
//                   child: ListView.builder(
//                     controller: controller,
//                       itemCount: itemsData.length,
//                       physics: BouncingScrollPhysics(),
//                       itemBuilder: (context, index) {
//                         double scale = 1.0;
//                         if (topContainer > 0.5) {
//                           scale = index + 0.5 - topContainer;
//                           if (scale < 0) {
//                             scale = 0;
//                           } else if (scale > 1) {
//                             scale = 1;
//                           }
//                         }
//                         return Opacity(
//                           opacity: scale,
//                           child: Transform(
//                             transform:  Matrix4.identity()..scale(scale,scale),
//                             alignment: Alignment.bottomCenter,
//                             child: Align(
//                                 heightFactor: 0.7,
//                                 alignment: Alignment.topCenter,
//                                 child: itemsData[index]),
//                           ),
//                         );
//                       })),
//             ],
//           ),
        
      
//     );
//   }
// }



    
// class CategoriesScroller extends StatelessWidget {
//   const CategoriesScroller();

//   @override
//   Widget build(BuildContext context) {
//     final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
//     return SingleChildScrollView(
//       physics: BouncingScrollPhysics(),
//       scrollDirection: Axis.horizontal,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//         child: FittedBox(
//           fit: BoxFit.fill,
//           alignment: Alignment.topCenter,
//           child: Row(
//             children: <Widget>[
//               Container(
//                 width: 150,
//                 margin: EdgeInsets.only(right: 20),
//                 height: categoryHeight,
//                 decoration: BoxDecoration(color: Colors.orange.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         "Most\nFavorites",
//                         style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "20 Items",
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 150,
//                 margin: EdgeInsets.only(right: 20),
//                 height: categoryHeight,
//                 decoration: BoxDecoration(color: Colors.blue.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
//                 child: Container(
//                   child: Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           "Newest",
//                           style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "20 Items",
//                           style: TextStyle(fontSize: 16, color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 150,
//                 margin: EdgeInsets.only(right: 20),
//                 height: categoryHeight,
//                 decoration: BoxDecoration(color: Colors.lightBlueAccent.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         "Super\nSaving",
//                         style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "20 Items",
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }