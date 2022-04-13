import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../models/message_model.dart';

class chat extends StatelessWidget {
  // const chat({Key? key}) : super(key: key);
  int? index;
  chat({this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 11.0, right: 11.0),
      child: Container(
        color: Colors.white,
        height: Get.height * .1,
        child: Row(
          children: [
            // CircleAvatar(
            //   radius: 30,
            //   backgroundImage: NetworkImage(
            //       chats[index!.toInt()].sender!.imageUrl.toString()),
            // ),
            Container(
                height: 75,
                    width: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Image border
                child: SizedBox.fromSize(
                  size: Size.fromRadius(45), // Image radius
                  child: Image.network(
                      chats[index!.toInt()].sender!.imageUrl.toString(),
                    
                      fit: BoxFit.cover),
                ),
              ),
            ),

            SizedBox(
              width: Get.width * .03,
            ),
            Padding(
              padding: EdgeInsets.only(top: 11),
              child: Container(
                width: Get.width * .5,
                height: Get.height * .1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          chats[index!.toInt()].sender!.name.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        chats[index!.toInt()].unread == true
                            ? Container(
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Center(
                                  child: Text(
                                    "12",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox()
                      ],
                    ),
                    Text(
                      chats[index!.toInt()].text as String,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 11),
              child: Column(
                children: [
                  // Text(
                  //   chats[index!.toInt()].time.toString(),
                  //   style: TextStyle(
                  //     fontSize: 14,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Container(
                    child:
                        NeumorphicButton(
  style: NeumorphicStyle(
          depth: 10,
          shadowLightColorEmboss: Colors.white,
          shadowDarkColorEmboss: Colors.black,
          color: Colors.white,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
          intensity: 0.7,
          disableDepth: false,
          shape: NeumorphicShape.concave,
          lightSource: LightSource.left,
          border: NeumorphicBorder(
            width: 2,
            color: Colors.white24,
          )),
                          onPressed: () {}, 
                          child: Text('Join')),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
