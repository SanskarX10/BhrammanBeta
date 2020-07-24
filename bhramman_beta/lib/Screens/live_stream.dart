import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:bhrammanbeta/Screens/live_stream/live_stream_form.dart';
import 'package:bhrammanbeta/Screens/live_stream/pages/call.dart';
import 'package:bhrammanbeta/Screens/live_stream/pages/index.dart';
import 'package:bhrammanbeta/data/live_stream_data.dart';
import 'package:bhrammanbeta/database/auth.dart';
import 'package:bhrammanbeta/database/firestore.dart';
import 'package:bhrammanbeta/resource/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class LiveStream extends StatefulWidget {
  @override
  _LiveStreamStreamState createState() => _LiveStreamStreamState();
}

class _LiveStreamStreamState extends State<LiveStream> {
  DatabaseService databaseService = DatabaseService();

  @override
  initState() {
    super.initState();
    _handleCameraAndMic();
  }

//
//  List<LiveStreamData> liveStreamData = new List();
//  getLiveStreams() async {
//    await databaseService.getLiveStreamDataFirebase().then((value) {
//      setState(() {
//        liveStreamData =  value;
//      });
//    });
//  }

  Future<void> _handleCameraAndMic() async {
    Map<Permission, PermissionStatus> status = await [
      Permission.camera,
      Permission.microphone,
    ].request();
    print(status['PermissionStatus']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LiveStreamForm(),
              ));
        },
        child: Icon(
          Icons.add,
        ),
      ),


      body: Stack(
        children: [
          SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(children: [
            Column(
              children: <Widget>[
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, bottom: 8, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Row(

                          children: <Widget>[
                            Text(
                              'Live',
                              style: TextStyle(
                                  fontFamily: 'sf_pro_semi_bold',
                                  color: black,
                                  fontSize: 35),
                            ),
                            Text(
                              'Stream',
                              style: TextStyle(
                                  fontFamily: 'sf_pro_bold',
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  height: 250,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                        bottomRight: const Radius.circular(20.0),
                        bottomLeft: const Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          offset: Offset(0.0, 2.0))
                    ],
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/livestream.png',
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                //one
                //---------------------------------------------------
                StreamBuilder(
                    stream: Firestore.instance
                        .collection("LiveStreams")
                        .orderBy("timeStamp", descending: true)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                snapshot.data.documents.length, (index) {
                              DocumentSnapshot liveStreamData =
                              snapshot.data.documents[index];

                              return liveStreamData['currentStatus'] == 'online' ? GestureDetector(
                                onTap: () {
                                  _handleCameraAndMic();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CallPage(
                                              channelName: liveStreamData['broadcastingId'],
                                              role: ClientRole.Audience,
                                            ),
                                      ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 7.5, vertical: 5),
                                  child: Container(
                                    height: 200,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned(
                                          left: 0.0,
                                          bottom: 0.0,
                                          right: 0.0,
                                          child: Container(
                                            height: 80,
                                            width:
                                            MediaQuery
                                                .of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20),
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.black,
                                                  Colors.black12
                                                ],
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                liveStreamData['userName'],
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: 'sf_pro_bold',
                                                    fontWeight: FontWeight.bold,
                                                    color: white),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 2,
                                                    vertical: 10),
                                                child: Container(
                                                  height: 1,
                                                  width: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width /
                                                      1.5,
                                                  color: lightGrey,
                                                ),
                                              ),
                                              Text(
                                                'Live from ${liveStreamData['placeName']} (${liveStreamData['state']}) ',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: 'sf_pro_bold',
                                                    fontWeight: FontWeight.bold,
                                                    color: white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/livestream.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ) : Container();
                            }));
                      } else {
                        return Center(
                          child: Container(
                            padding: EdgeInsets.only(top: 60),
                            child: Text(
                              "No Live Streams right Now",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'sf_pro_bold',
                                  fontSize: 20),
                            ),
                          ),
                        );
                      }
                    }),
              ],
            ),

            //app bar//
            Positioned(
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),
          ]),
        ),

          //app bar//
          Positioned(
            child: AppBar(
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),

       ]
      ),
    );
  }
}
