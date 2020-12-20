import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../models/glass_point.dart';
import 'package:flutter/gestures.dart';

class Map extends StatefulWidget {

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  Completer<GoogleMapController> _googleMapController = Completer();

  PageController _controller = PageController(
      initialPage: 1,
      viewportFraction: 0.8
  );

  List<GlassPoint> glassPoints = [
    GlassPoint(
        name: "ЯрГУ им. П. Г. Демидова, 1 корпус",
        lat: 57.633040,
        lng: 39.887332
    ),
    GlassPoint(
        name: "ЯрГУ им. П. Г. Демидова, 2 корпус",
        lat: 57.626851,
        lng: 39.889742
    ),
    GlassPoint(
        name: "ЯрГУ им. П. Г. Демидова, 3 корпус",
        lat: 57.632871,
        lng: 39.891279
    ),
    GlassPoint(
        name: "ЯрГУ им. П. Г. Демидова, 4 корпус",
        lat: 57.575495,
        lng: 39.857969
    ),
    GlassPoint(
        name: "ЯрГУ им. П. Г. Демидова, 7 корпус",
        lat: 57.625508,
        lng: 39.926679
    )
  ];

  List<GlassPoint> vtb = [
    GlassPoint(
        name: "ЯрГУ им. П. Г. Демидова, 1 корпус",
        lat: 57.633040,
        lng: 39.887332
    ),
    GlassPoint(
        name: "ЯрГУ им. П. Г. Демидова, 2 корпус",
        lat: 57.626851,
        lng: 39.889742
    ),
    GlassPoint(
        name: "ЯрГУ им. П. Г. Демидова, 3 корпус",
        lat: 57.632871,
        lng: 39.891279
    ),
    GlassPoint(
        name: "ЯрГУ им. П. Г. Демидова, 4 корпус",
        lat: 57.575495,
        lng: 39.857969
    ),
    GlassPoint(
        name: "ЯрГУ им. П. Г. Демидова, 7 корпус",
        lat: 57.625508,
        lng: 39.926679
    )
  ];

  Set<Marker> _markers = {};

  bool showSheet = false, showSheetBody = false;

  double latitude = 0.0, longitude = 0.0;

  ///  Калькулятор дистанции.
  /// Принимает координаты точки А и точки Б,
  /// а потом рассчитывает расстояние в километрах и выводит его текстом
  double calculateDistance(double lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 + c(lat1 * p) * c(lat2 * p) *
        (1 - c((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }

  String getDistance(double lat1, lon1, lat2, lon2) {
    double doubleDistance = calculateDistance(lat1, lon1, lat2, lon2);
    if (doubleDistance > 1)
      return doubleDistance.toInt().toString() + "км.";
    else {
      String stringDistance = doubleDistance.toString(), meters = "";
      for (int i = stringDistance.indexOf(".") + 1; i < stringDistance.indexOf(".") + 4; i++) {
        if (stringDistance[i] != "0")
          meters += stringDistance[i];
      }
      return meters + "м.";
    }
  }

  String getTime(double lat1, lon1, lat2, lon2) {
    double doubleDistance = calculateDistance(lat1, lon1, lat2, lon2);
    if (doubleDistance > 1) {
      int fullTime = doubleDistance.toInt() * 20;
      if (fullTime ~/ 302400 != 0)
        return (fullTime ~/ 302400).toString() + "мес.";
      else if (fullTime ~/ 10080 != 0)
        return (fullTime ~/ 10080).toString() + "н.";
      else if (fullTime ~/ 1440 != 0)
        return (fullTime ~/ 1440).toString() + "д.";
      else if (fullTime ~/ 60 != 0)
        return (fullTime ~/ 60).toString() + "ч.";
      else return fullTime.toString() + "мин.";
    }
    else {
      String stringDistance = (doubleDistance / 50).toString(), meters = "";
      for (int i = stringDistance.indexOf(".") + 1; i < stringDistance.indexOf(".") + 4; i++) {
        if (stringDistance[i] != "0")
          meters += stringDistance[i];
      }
      return meters + "мин.";
    }
  }

  @override
  void initState() {
    getMyLocation();
    getMarkers();
    super.initState();
  }

  void getMyLocation() async {
    final myPosition = await Geolocator.getCurrentPosition();
    setState(() {
      latitude = myPosition.latitude;
      longitude = myPosition.longitude;
    });
  }

  void getMarkers() async {
    _markers.add(
        Marker(
            markerId: MarkerId('my_position'),
            position: LatLng(longitude, latitude),
            icon: await BitmapDescriptor.fromAssetImage(
                ImageConfiguration(size: Size(67.5, 54)),
                'images/red_marker.png'
            )
        )
    );
    for (int i = 0; i < glassPoints.length; i++)
      _markers.add(
          Marker(
              onTap: () => getShowSheet(i),
              markerId: MarkerId(i.toString()),
              position: LatLng(glassPoints[i].lat, glassPoints[i].lng),
              icon: await BitmapDescriptor.fromAssetImage(
                  ImageConfiguration(size: Size(67.5, 54)),
                  'images/green_marker.png'
              )
          )
      );
    for (int i = 0; i < glassPoints.length; i++) {
      _markers.add(
          Marker(
              onTap: () => getShowSheet(i),
              markerId: MarkerId(i.toString()),
              position: LatLng(glassPoints[i].lat, glassPoints[i].lng),
              icon: await BitmapDescriptor.fromAssetImage(
                  ImageConfiguration(size: Size(67.5, 54)),
                  'images/green_marker.png'
              )
          )
      );
    }
  }

  void getShowSheet(int index) {
    setState(() {
      _controller.jumpToPage(index);
      showSheet = true;
      Future.delayed(Duration(milliseconds: 500)).then((value) =>
          setState(() => showSheetBody = true)
      );
    });
  }

  void getCloseSheet() {
    setState(() => showSheetBody = false);
    Future.delayed(Duration(milliseconds: 500)).then((value) =>
        setState(() => showSheet = false)
    );
  }

  Future<void> _changeCameraPosition(int value) async {
    final GoogleMapController controller = await _googleMapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(glassPoints[value].lat, glassPoints[value].lng),
        zoom: 14.4746
    )));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Stack(
          children: [
            GoogleMap(
                markers: _markers,
                onTap: (value) => setState(() => getCloseSheet()),
                initialCameraPosition: CameraPosition(
                    target: LatLng(57.575495, 39.857969),
                    zoom: 14.4746
                ),
                gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                  Factory<OneSequenceGestureRecognizer>(
                    // () => ScaleGestureRecognizer(),
                        () => HorizontalDragGestureRecognizer(),
                  ),
                ].toSet(),
                onMapCreated: (GoogleMapController controller) {
                  _googleMapController.complete(controller);
                }
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    height: showSheet ? 205 : 0,
                    decoration: BoxDecoration(
                        color: Color(0xff053cc8),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20)
                        )
                    ),
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: AnimatedOpacity(
                            opacity: showSheetBody ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 500),
                            child: PageView(
                                controller: _controller,
                                onPageChanged: (value) => _changeCameraPosition(value),
                                children: [
                                  for (int i = 0; i < glassPoints.length; i++)
                                    bottomSheetPage(
                                        glassPoints[i].name,
                                        glassPoints[i].lat,
                                        glassPoints[i].lng
                                    )
                                ]
                            )
                        )
                    )
                )
            )
          ]
      )
  );

  Padding bottomSheetPage(String name, lat, lon) =>
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.5),
          child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                        children: [
                          Flexible(
                              child: Container(
                                  child: Text(
                                      name,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Color(0xff405372),
                                          fontSize: 16
                                      )
                                  )
                              )
                          ),
                          Container(
                              width: 6.0,
                              height: 6.0,
                              margin: EdgeInsets.symmetric(horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff4cd964)
                              )
                          ),
                          SizedBox(width: 10),
                          Text(
                              getDistance(latitude, longitude, lat, lon),
                              style: TextStyle(
                                  color: Color(0xff405372),
                                  fontSize: 16
                              )
                          ),
                          Text(
                              getTime(latitude, longitude, lat, lon),
                              style: TextStyle(
                                  color: Color(0xff405372),
                                  fontSize: 16
                              )
                          ),
                          Icon(Icons.chevron_right)
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          bottomSheetIcon("92%", "green", "Стекло"),
                          bottomSheetIcon("13%", "yellow", "Пластик"),
                          bottomSheetIcon("42%", "blue", "Бумага"),
                          bottomSheetIcon("74%", "black", "Бытовые", title2: "отходы")
                        ]
                    )
                  ]
              )
          )
      );

  Column bottomSheetIcon(String percent, image, title, {title2 = ""}) => Column(
      children: [
        Text(
            percent,
            style: TextStyle(
                fontSize: 11,
                color: Color(0xff405372)
            )
        ),
        Image.asset(
            "images/$image.png",
            width: 29,
            height: 33
        ),
        Text(
            title,
            style: TextStyle(
                fontSize: 11,
                color: Color(0xff405372)
            )
        ),
        Text(
            title2,
            style: TextStyle(
                fontSize: 11,
                color: Color(0xff405372)
            )
        )
      ]
  );
}