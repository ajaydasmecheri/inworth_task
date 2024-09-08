import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inworth_task/api/api_model.dart';


Future<List<Herodata>> fetchData() async {
  final response = await http.get(
    Uri.parse('https://protocoderspoint.com/jsondata/superheros.json'),
  );

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final List<dynamic> heroList = data['superheros'] as List<dynamic>;
    final List<Herodata> heroes = heroList.map((heroMap) => Herodata.fromMap(heroMap as Map<String, dynamic>)).toList();

    return heroes;
 
}
