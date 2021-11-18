// import 'package:flutter/material.dart';
// import 'addressScreen.dart';

// void main() {
//   runApp(
//     // const MaterialApp()
//     MyApp(),
//   );
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text('Flutter FlatButton Example'),
//           ),
//           body: Center(
//               child: Column(children: <Widget>[
//             Container(
//               margin: EdgeInsets.all(25),
//               child: FlatButton(
//                 child: Text(
//                   'Locate me',
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//                 color: Colors.blueAccent,
//                 textColor: Colors.white,
//                 onPressed: () {
//                   //_navigateToNextScreen(context);
//                   // Navigator.push(context,
//                   //     MaterialPageRoute(builder: (context) => AddressScreen()));
//                   // Navigator.push(context,
//                   //     MaterialPageRoute(builder: (context) => AddressScreen()));
//                   // Navigator.pop(context);
//                 },
//               ),
//             ),
//           ]))),
//     );
//   }

//   // void _navigateToNextScreen(BuildContext context) {
//   //   Navigator.of(context)
//   //       .push(MaterialPageRoute(builder: (context) => AddressScreen()));
//   //   Navigator.pop(context);
//   // }
// }

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';

// void main() {
//   runApp(const MaterialApp(
//     title: 'Location',
//     home: FirstRoute(),
//   ));
// }

// class FirstRoute extends StatelessWidget {
//   const FirstRoute({Key? key}) : super(key: key);

//   Future<Position> _getGeoLocationPosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled don't continue
//       // accessing the position and request users of the
//       // App to enable the location services.
//       await Geolocator.openLocationSettings();
//       return Future.error('Location services are disabled.');
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied, next time you could try
//         // requesting permissions again (this is also where
//         // Android's shouldShowRequestPermissionRationale
//         // returned true. According to Android guidelines
//         // your App should show an explanatory UI now.
//         return Future.error('Location permissions are denied');
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//     // When we reach here, permissions are granted and we can
//     // continue accessing the position of the device.
//     return await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('First Route'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: const Text('Locate me'),
//           onPressed: () async {
//             Position position = await _getGeoLocationPosition();
//             print(position);
//             Text("position is $position");
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => SecondRoute(position)),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class SecondRoute extends StatelessWidget {
// //global variable for lat long
//   LatLng _center = LatLng(12.770137, 77.567753);

//   SecondRoute(Position position) {
//     _center = LatLng(position.latitude, position.longitude);
//     print("Constructor");
//     print(position.latitude);
//   }

//   late GoogleMapController mapController;

//   Map<String, Marker> markers = {};

//   void _updatePosition(CameraPosition _position) {
//     print(_position.target.latitude);
//     print(_position.target.longitude);
//     print("*********************");
//     // Position newMarkerPosition = Position(
//     //     latitude: _position.target.latitude,
//     //     longitude: _position.target.longitude);

//     // Marker marker = (Marker)markers["1"];

//     // setState(() {
//     //   markers["1"] = marker.copyWith(
//     //       positionParam: LatLng(newMarkerPosition.latitude, newMarkerPosition.longitude));
//     // });
//   }

//   // void _onMapCreated(GoogleMapController controller) async {
//   //   setState(() {
//   //     _markers.clear();

//   //     final marker = Marker(
//   //       markerId: MarkerId('v'),
//   //       position: _center,
//   //       infoWindow: InfoWindow(
//   //         title: '',
//   //         snippet: '',
//   //       ),
//   //     );
//   //     _markers['v'] = marker;
//   //   });
//   // }

//   // void _updatePosition(CameraPosition _position) {
//   //   print(_position.target.latitude);
//   //   Position newMarkerPosition = Position(
//   //       latitude: _position.target.latitude,
//   //       longitude: _position.target.longitude);

//   //   Marker marker = _markers["v"];

//   //   setState(() {
//   //     _markers["1"] = marker.copyWith(
//   //         positionParam: LatLng(newMarkerPosition.latitude, newMarkerPosition.longitude));
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     var scaffold = Scaffold(
//       appBar: AppBar(
//         title: const Text('Maps Sample App'),
//         backgroundColor: Colors.green[700],
//       ),
//       // body: GoogleMap(
//       //   onMapCreated: _onMapCreated,
//       //   initialCameraPosition: CameraPosition(
//       //     target: _center,
//       //     zoom: 11.0,
//       //   ),
//       //   markers: _markers.values.toSet(),
//       // ),
//       body: GoogleMap(
//         mapType: MapType.normal,
//         initialCameraPosition: CameraPosition(
//           target: _center,
//           zoom: 13.0,
//         ),

//         markers: Set<Marker>.of(
//           <Marker>[
//             Marker(
//               onTap: () {
//                 print('Tapped');
//                 onDragEnd:
//                 ((newPosition) {
//                   print('Latitude is');
//                   print(_center.longitude);
//                 });
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => FirstRoute()),
//                 // );
//               },
//               draggable: true,
//               markerId: MarkerId("1"),
//               position: _center,
//               icon: BitmapDescriptor.defaultMarker,
//               infoWindow: const InfoWindow(
//                 title: 'I am here',
//               ),
//             )
//           ],
//         ),
//         onCameraMove: ((_position) => _updatePosition(_position)),
//         onMapCreated: (GoogleMapController controller) {
//           mapController = controller;
//         },
//         // ignore: unnecessary_new
//         // Row(children: [
//         //   child:RaisedButton(onPressed: (){},
//         //   )
//         // ],)
//         // RaisedButton(onPressed: () async {},)
//         //  RaisedButton(onPressed: (){},

//         //  )
//       ),
//     );
//     return MaterialApp(
//       home: scaffold,

//       //  ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'addressScreen.dart';

// void main() {
//   runApp(
//     // const MaterialApp()
//     MyApp(),
//   );
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text('Flutter FlatButton Example'),
//           ),
//           body: Center(
//               child: Column(children: <Widget>[
//             Container(
//               margin: EdgeInsets.all(25),
//               child: FlatButton(
//                 child: Text(
//                   'Locate me',
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//                 color: Colors.blueAccent,
//                 textColor: Colors.white,
//                 onPressed: () {
//                   //_navigateToNextScreen(context);
//                   // Navigator.push(context,
//                   //     MaterialPageRoute(builder: (context) => AddressScreen()));
//                   // Navigator.push(context,
//                   //     MaterialPageRoute(builder: (context) => AddressScreen()));
//                   // Navigator.pop(context);
//                 },
//               ),
//             ),
//           ]))),
//     );
//   }

//   // void _navigateToNextScreen(BuildContext context) {
//   //   Navigator.of(context)
//   //       .push(MaterialPageRoute(builder: (context) => AddressScreen()));
//   //   Navigator.pop(context);
//   // }
// }

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Location',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Locate me'),
          onPressed: () async {
            Position position = await _getGeoLocationPosition();

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute(position)),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
//global variable for lat long
  LatLng _center = LatLng(12.770137, 77.567753);

  SecondRoute(Position position) {
    _center = LatLng(position.latitude, position.longitude);
    print("Constructor");
    print(position.latitude);
  }

  late GoogleMapController mapController;

  Map<String, Marker> markers = {};

  void _updatePosition(CameraPosition _position) {
    print(_position.target.latitude);
    print(_position.target.longitude);
    print("*********************");
    // Position newMarkerPosition = Position(
    //     latitude: _position.target.latitude,
    //     longitude: _position.target.longitude);

    // Marker marker = (Marker)markers["1"];

    // setState(() {
    //   markers["1"] = marker.copyWith(
    //       positionParam: LatLng(newMarkerPosition.latitude, newMarkerPosition.longitude));
    // });
  }

  // void _onMapCreated(GoogleMapController controller) async {
  //   setState(() {
  //     _markers.clear();

  //     final marker = Marker(
  //       markerId: MarkerId('v'),
  //       position: _center,
  //       infoWindow: InfoWindow(
  //         title: '',
  //         snippet: '',
  //       ),
  //     );
  //     _markers['v'] = marker;
  //   });
  // }

  // void _updatePosition(CameraPosition _position) {
  //   print(_position.target.latitude);
  //   Position newMarkerPosition = Position(
  //       latitude: _position.target.latitude,
  //       longitude: _position.target.longitude);

  //   Marker marker = _markers["v"];

  //   setState(() {
  //     _markers["1"] = marker.copyWith(
  //         positionParam: LatLng(newMarkerPosition.latitude, newMarkerPosition.longitude));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Maps Sample App'),
              backgroundColor: Colors.green[700],
            ),
            // body: GoogleMap(
            //   onMapCreated: _onMapCreated,
            //   initialCameraPosition: CameraPosition(
            //     target: _center,
            //     zoom: 11.0,
            //   ),
            //   markers: _markers.values.toSet(),
            // ),
            body: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 16.0,
              ),
              markers: Set<Marker>.of(
                <Marker>[
                  Marker(
                    draggable: true,
                    markerId: MarkerId("1"),
                    position: _center,
                    onDragEnd: ((newPosition) {
                      print(newPosition.latitude);
                      print(newPosition.longitude);
                    }),
                    icon: BitmapDescriptor.defaultMarker,
                    infoWindow: const InfoWindow(
                      title: 'I am here',
                    ),
                  )
                ],
              ),
              onCameraMove: ((_position) => _updatePosition(_position)),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            ))
        //  ),

        );
  }
}
