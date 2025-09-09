import 'package:flutter/material.dart';
import 'package:superhero_app/models/superherodetailresponse.dart';
import 'package:superhero_app/models/superheroresponse.dart';

class Heroinfo extends StatelessWidget {
  final Superherodetailresponse? infoResponse;
  const Heroinfo({super.key, required this.infoResponse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${infoResponse?.name}")),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Image.network(
              "${infoResponse?.url}",
              width: double.infinity,
              height: 430,
              fit: BoxFit.cover,
            ),
            Text(
              "${infoResponse?.name}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            ),
            Text(
              "${infoResponse?.fullname ?? "N/A"}",
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            SizedBox(
              width: double.infinity,
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 20,
                        height: double.parse(
                          infoResponse?.powerstats?.power ?? "0",
                        ),
                        child: Container(color: Colors.redAccent),
                      ),
                      Text(
                        "Power",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 20,
                        height: double.parse(
                          infoResponse?.powerstats?.strength ?? "0",
                        ),
                        child: Container(color: Colors.grey),
                      ),
                      Text(
                        "Strength",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 20,
                        height: double.parse(
                          infoResponse?.powerstats?.intelligence ?? "0",
                        ),
                        child: Container(
                          color: const Color.fromARGB(255, 4, 123, 235),
                        ),
                      ),
                      Text(
                        "Intelligence",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 20,
                        height: double.parse(
                          infoResponse?.powerstats?.durability ?? "0",
                        ),
                        child: Container(color: Colors.deepOrange),
                      ),
                      Text(
                        "Durability",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 20,
                        height: double.parse(
                          infoResponse?.powerstats?.combat ?? "0",
                        ),
                        child: Container(
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Text(
                        "Combat",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
