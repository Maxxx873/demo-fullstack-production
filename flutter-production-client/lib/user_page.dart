import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:prod_api/api.dart';
import 'package:http/http.dart' as http;
import 'service/material_color.dart';

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

Future<RESULT?> createData(String login, String pswd) async {
  final response = await http.get(
    Uri.parse(
        'https://mock-production-server.herokuapp.com/?CMD=GET_PDO_USER&API_KEY=KEY-123&PARAM=user=$login;pswd=${generateMd5(pswd).toUpperCase()}'),
    headers: <String, String>{
      'accept': 'application/json; charset=UTF-8',
    },
  );
  print(generateMd5(pswd).toUpperCase());
  if (response.statusCode == 201 || response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return RESULT.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    return RESULT(
        EXITCODE: 100, EXITTEXT: "Server not responding or bad request");
  }
}

void main() {
  runApp(const UserApp());
}

class UserApp extends StatefulWidget {
  const UserApp({super.key});

  @override
  State<UserApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<UserApp> {
  final TextEditingController _controllerLogin = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<RESULT?>? _futureData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User',
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFFE50D43)),
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: (_futureData == null)
              ? buildColumn()
              : Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(90),
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
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Container(
              width: 200,
              height: 80,
              child: const Icon(
                Icons.settings_applications_sharp,
                color: Colors.black54,
                size: 100,
              ),
            ),
          ),
        ),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Production software',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            )),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Sign in',
              style: TextStyle(fontSize: 20),
            )),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            controller: _controllerLogin,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                border: OutlineInputBorder(),
                hintText: 'Enter your login',
                labelText: 'Login'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            obscureText: true,
            controller: _controllerPassword,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                border: OutlineInputBorder(),
                hintText: 'Enter your password',
                labelText: 'Password'),
          ),
        ),
        Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFFE50D43)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _futureData = createData(
                        _controllerLogin.text, _controllerPassword.text);
                  });
                },
                child: const Text(
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                    'Login'),
              ),
            )),
      ],
    );
  }

  FutureBuilder<RESULT?> buildFutureBuilder() {
    return FutureBuilder<RESULT?>(
      future: _futureData,
      builder: (context, snapshot) {
        List<Widget> children;
        if (snapshot.hasData && snapshot.data?.DATA?.FIRSTNAME != null) {
          children = <Widget>[
            const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 60,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                  'Hello, ${snapshot.data?.DATA?.FIRSTNAME} ${snapshot.data?.DATA?.LASTNAME}'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: BackButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserApp()),
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
                    MaterialPageRoute(builder: (context) => const UserApp()),
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
