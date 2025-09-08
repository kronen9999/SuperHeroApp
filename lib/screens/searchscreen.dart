import 'package:flutter/material.dart';
import 'package:superhero_app/data/repository.dart';
import 'package:superhero_app/models/superheroresponse.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  Future<Superheroresponse?>? _superheroresponse;
  Repository repository = Repository();

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
          bodyList(),
        ],
      ),
    );
  }

  FutureBuilder<Superheroresponse?> bodyList() {
    return FutureBuilder(
      future: _superheroresponse,
      builder: (context, snaptshot) {
        if (snaptshot.connectionState == ConnectionState.waiting) {
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
                  return Column(
                    children: [
                      Text(resultado[index].name),
                      Image.network("${resultado[index].url}"),
                    ],
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
