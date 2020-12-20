import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:geolocator/geolocator.dart';

class OpenMaps {
  /// Всплывающее окно с выбором приложения для построение и навигации до торговой точки
  Future openMapsSheet(BuildContext context, {String latitude = "", String longitude = "", String shopName = ""}) async {
    try {
      final destination = Coords(double.tryParse(latitude ?? ''), double.tryParse(longitude ?? ''));
      final availableMaps = await MapLauncher.installedMaps;
      //Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high); //deprecated
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      Coords origin = position != null
          ? Coords(position.latitude, position.longitude)
          : null;
      String title = "Моё местоположение";

      return showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        builder: (BuildContext context) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    child: Wrap(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                          child: Text("Построить маршрут", textAlign: TextAlign.left, style: TextStyle(
                            color: Colors.black
                          )),
                        ),
                        for (var map in availableMaps)
                          ListTile(
                            onTap: () => map.showDirections(
                              destination: destination,
                              destinationTitle: shopName,
                              origin: origin,
                              originTitle: title,
                            ),
                            title: Text(map.mapName),
                            leading: SvgPicture.asset(
                              map.icon,
                              height: 30.0,
                              width: 30.0,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              )
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }
}