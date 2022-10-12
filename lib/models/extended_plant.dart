import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libotanic/models/%D1%81lassification.dart';
import 'package:libotanic/models/division.dart';
import 'package:libotanic/models/plant_class.dart';
import 'package:libotanic/models/plant_detail.dart';
import 'package:libotanic/models/simple_plant.dart';
import 'package:libotanic/test_info.dart';

class ExtendedPlant {
  late int id;
  late PlantClass plantClass;
  late String nameRus;
  late String nameLat;
  String? imageURL;
  String? description;
  Classification? classification;
  List<PlantDetail>? details;

  ExtendedPlant(this.id, this.plantClass, this.nameRus, this.nameLat,
      {this.imageURL, this.description, this.classification, this.details});

  ExtendedPlant.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'] as int;
    plantClass = PlantClass(
      division: Division(
          nameRus: parsedJson['otdel'],
          imageURL: TestInfo.divisionsImages[parsedJson['otdel']]!), //TODO: image for unknown
      nameRus: parsedJson['classis'],
      imageURL: TestInfo.classesImages[parsedJson['classis']]!,
    );
    nameRus = parsedJson['rus_name'];
    nameLat = parsedJson['lat_name'];
    imageURL = parsedJson['mainPic'];
    description = parsedJson['descr'];
  }
}
