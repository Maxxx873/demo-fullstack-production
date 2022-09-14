import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prod_api/api.dart';
import 'service/material_color.dart';

String rawResponse = "";

Future<RESULT?> fetchData(String url) async {
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'accept': 'application/json; charset=UTF-8',
   //   'Accept': '*/*'
    },
  );
  if (response.statusCode == 201 || response.statusCode == 200) {
    rawResponse = utf8.decode(response.bodyBytes);
    return RESULT.fromJson(jsonDecode(rawResponse));
  } else {
    rawResponse = "Error, something wrong";
    return RESULT(
        EXITCODE: 100, EXITTEXT: "Server not responding or bad request");
  }
}

void main() {
  runApp(const ServerApp());
}

class ServerApp extends StatefulWidget {
  const ServerApp({super.key});

  @override
  State<ServerApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<ServerApp> {
  final TextEditingController _controller = TextEditingController(
      text:
          "https://mock-production-server.herokuapp.com/?CMD=ECHO&API_KEY=KEY-123");

  Future<RESULT?>? _futureData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Server',
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFFE50D43)),
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Server connection:',
              style: TextStyle(color: Colors.black54)),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: (_futureData == null)
              ? buildColumn()
              : Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                  child: buildFutureBuilder()),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16, right: 5, left: 5),
          child: TextFormField(
            controller: _controller,
            minLines: 1,
            maxLines: 5,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      setState(() {
                        _futureData = fetchData(_controller.text);
                      });
                    }),
                border: OutlineInputBorder(),
                hintText: 'Enter Title',
                labelText: 'Get request'),
          ),
        )
      ],
    );
  }

  FutureBuilder<RESULT?> buildFutureBuilder() {
    return FutureBuilder<RESULT?>(
      future: _futureData,
      builder: (context, snapshot) {
        List<Widget> children;
        if (snapshot.hasData && snapshot.data?.EXITCODE == 0) {
          children = <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Card(
                elevation: 4.0,
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('your request'),
                      subtitle: Text(_controller.text),
                    ),
                    ListTile(
                      title: const Text('server raw reponse'),
                      subtitle: Text(rawResponse),
                      trailing: const Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 40,
                      ),
                    ),
                    ListTile(
                      title: const Text('result object'),
                      subtitle: Text('${snapshot.data}'),
                    ),
                    ButtonBar(
                      children: [
                        TextButton(
                          child: const Text('TRY AGAIN'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ServerApp()),
                            );
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: BackButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ServerApp()),
                  );
                },
              ),
            ),
          ];
        } else if (snapshot.hasError || snapshot.data?.EXITCODE == 100) {
          children = <Widget>[
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                  'Error'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: BackButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ServerApp()),
                  );
                },
              ),
            ),
          ];
        } else {
          children = const <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            ),
          ];
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        );
      },
    );
  }
}
