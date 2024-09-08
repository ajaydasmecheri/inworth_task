import 'package:flutter/material.dart';

class Fulldetails extends StatefulWidget {
  const Fulldetails({super.key});

  @override
  State<Fulldetails> createState() => _FulldetailsState();
}

class _FulldetailsState extends State<Fulldetails> {
  @override
  Widget build(BuildContext context) {
    final dataargs = ModalRoute.of(context)!.settings.arguments as Map?;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 250,
                  width: 250,
                  child: Image.network(dataargs?["SHurl"])),
              const SizedBox(
                height: 10,
              ),
              Center(child: Text(dataargs?["SHname"], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold ),)),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(dataargs?["SHpower"], style: const TextStyle( fontWeight: FontWeight.bold ), textAlign: TextAlign.center,),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
