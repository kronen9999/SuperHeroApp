import 'package:flutter/material.dart';
import 'package:superhero_app/data/repository.dart';
import 'package:superhero_app/models/superheroresponse.dart';
import 'package:superhero_app/screens/heroinfo.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  Future<Superheroresponse?>? _superheroresponse;
  Repository repository = Repository();
  bool _textEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Super Hero Search")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    _textEmpty = true;
                  } else {
                    _textEmpty = false;
                  }
                  _superheroresponse = repository.fetchSuperhero(value);
                });
              },
              decoration: InputDecoration(
                hintText: "Ingresa un nombre",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          bodyList(_textEmpty),
        ],
      ),
    );
  }

  FutureBuilder<Superheroresponse?> bodyList(bool textEmpty) {
    return FutureBuilder(
      future: _superheroresponse,
      builder: (context, snaptshot) {
        if (textEmpty) {
          return Text('Please enter a name to search');
        } else if (snaptshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snaptshot.hasError) {
          return Text('Error: ${snaptshot.error}');
        } else if (snaptshot.hasData) {
          var resultado = snaptshot.data?.results;
          return Expanded(
            child: ListView.builder(
              itemCount: resultado?.length ?? 0,
              itemBuilder: (context, index) {
                if (resultado != null) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 16.0,
                    ),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Heroinfo(infoResponse: resultado[index]),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                resultado[index].name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                "${resultado[index].url}",
                                height: 250,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Text('No results');
                }
              },
            ),
          );
        } else {
          return Text('No data');
        }
      },
    );
  }
}
