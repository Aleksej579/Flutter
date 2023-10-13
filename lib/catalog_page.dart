import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogDataState();
}

class _CatalogDataState extends State<CatalogPage> {
  final catalogAll = <String, dynamic>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
                child:
                    const Text("Get JSON Data", style: TextStyle(fontSize: 18)),
                onPressed: () async {
                  final httpPackageUrl =
                      Uri.https('jsonplaceholder.typicode.com', '/photos/1');
                  final httpPackageInfo = await http.read(httpPackageUrl);
                  final httpPackageJson = json.decode(httpPackageInfo);
                  httpPackageJson.forEach((key, value) {
                    setState(() {
                      catalogAll['$key'] = '$value';
                    });
                  });
                  print(catalogAll);
                }),
            // Text(catalogAll),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.amber,
                    blurRadius: 10.0,
                    // spreadRadius: 5,
                  ),
                ],
              ),
              child: Container(
                color: Colors.blue,
                child: Row(
                  children: [
                    catalogAll.isEmpty
                        ? Image.asset('images/flower.jpg',
                            height: 100, width: 100, fit: BoxFit.cover)
                        : Image.network(catalogAll['url'].toString(),
                            height: 100, width: 100, fit: BoxFit.cover),
                    catalogAll.isEmpty
                        ? const Text(
                            "TEST",
                            style: const TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          )
                        : Expanded(
                            child: Text(
                              catalogAll['title'].toString().toUpperCase(),
                              textAlign: TextAlign.center,
                              softWrap: false,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
