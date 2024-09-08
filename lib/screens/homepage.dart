import 'package:flutter/material.dart';
import 'package:inworth_task/api/api_model.dart';
import 'package:inworth_task/api/api_service.dart';
import 'package:inworth_task/routers.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<Herodata>> _heroesFuture;
  List<Herodata> _filteredHeroes = [];
  List<Herodata> _allHeroes = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _heroesFuture = fetchData().then((heroes) {
      setState(() {
        _allHeroes = heroes;
        _filteredHeroes = heroes;
      });
      return heroes;
    });
    _searchController.addListener(_filterHeroes);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterHeroes() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredHeroes = _allHeroes
          .where((hero) => hero.name.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: TextFormField(
                  controller: _searchController,
                  decoration: const InputDecoration(hintText: "Enter hero name"),
                ),
                actions: [
                  TextButton(
                    child: const Text('Search'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.search, color: Colors.white, size: 25),
      ),
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Super Heroes",
            style: TextStyle(
              fontFamily: "caveat",
              color: Colors.black,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Herodata>>(
        future: _heroesFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Please wait'));
          } else {
            final heroes = _filteredHeroes;
            return ListView.builder(
              itemCount: heroes.length,
              itemBuilder: (context, index) {
                final hero = heroes[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.network(
                            hero.url,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            hero.name,
                            style: const TextStyle(
                              fontFamily: "jura",
                              color: Colors.black,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routers.fulldetails,
                        arguments: {
                          "SHname": hero.name,
                          "SHpower": hero.power,
                          "SHurl": hero.url,
                        },
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
