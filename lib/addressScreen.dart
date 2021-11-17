import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//void main() => runApp(const AddressScreen());

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _MyAddressState createState() => _MyAddressState();
}

class _MyAddressState extends State<AddressScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(12.770137, 77.567753);

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }

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
  //   // Position newMarkerPosition = Position(
  //   //     latitude: _position.target.latitude,
  //   //     longitude: _position.target.longitude);

  //   // Marker marker = _markers["v"];

  //   // setState(() {
  //   //   _markers["1"] = marker.copyWith(
  //   //       positionParam: LatLng(newMarkerPosition.latitude, newMarkerPosition.longitude));
  //   // });
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
                zoom: 13.0,
              ),
              markers: Set<Marker>.of(
                <Marker>[
                  Marker(
                    draggable: true,
                    markerId: MarkerId("1"),
                    position: _center,
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


















// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

// void main() {
//   runApp(MyAddressApp());
// }

// class MyAddressApp extends StatelessWidget {
//   getCurrentLocation() async {
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.low);
//     print(position.latitude);
//     print(position.longitude);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             body: Center(
//       child: TextButton(
//           onPressed: () {
//             getCurrentLocation();
//           },
//           child: Text('Locate me')),
//     )));
//   }
// }
