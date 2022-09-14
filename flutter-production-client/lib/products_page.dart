import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prod_api/api.dart';
import 'dart:convert' show utf8;
import 'service/material_color.dart';

Future<RESULT?> fetchData() async {
  final response = await http.get(
    Uri.parse(
        'https://mock-production-server.herokuapp.com/?CMD=GET_OSO_VYPUSK&API_KEY=KEY-123'),
    headers: <String, String>{
      'accept': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return RESULT.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  } else {
    throw Exception('Failed to load data');
  }
}

void main() => runApp(const ProductsPageStarter());

class ProductsPageStarter extends StatefulWidget {
  const ProductsPageStarter({super.key});

  @override
  State<ProductsPageStarter> createState() => _MyAppState();
}

class _MyAppState extends State<ProductsPageStarter> {
  late Future<RESULT?> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Products',
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFFE50D43)),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Available products:',
              style: TextStyle(color: Colors.black54)),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: FutureBuilder<RESULT?>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Product> products = snapshot.data!.DATA!.ITEM;

                return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading:
                                  const Icon(Icons.token_outlined, size: 50),
                              title: Text(
                                  '${products[index].SIGN} ${products[index].NAME}'),
                              subtitle: Text('${products[index].SN}'),
                            ),
                          ],
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
