
class Herodata {
  final String name;
  final String power;
  final String url;

  Herodata({required this.name, required this.power, required this.url});

  factory Herodata.fromMap(Map<String, dynamic> heroMap) {
    return Herodata(
      name: heroMap['name'] ,
      power: heroMap['power'],
      url: heroMap['url'],
    );
  }
}