import 'package:flutter/material.dart';
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

import 'server_page.dart';
import 'user_page.dart';
import 'products_page.dart';
import 'service/material_color.dart';

void main() {
  runApp(const HomePage());
}

@Openapi(
    additionalProperties: AdditionalProperties(pubName: 'prod_api'),
    inputSpecFile: 'api-docs.yml',
    generatorName: Generator.dio,
    outputDirectory: 'api/prod_api')
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  TabBar get _tabBar => const TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.switch_account),
            text: 'User',
          ),
          Tab(
            icon: Icon(Icons.wallet_travel),
            text: 'Products',
          ),
          Tab(
            icon: Icon(Icons.computer),
            text: 'Server',
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Production',
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFFE50D43)),
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('PRODUCTION PLANNING',
                style: TextStyle(color: Colors.black54)),
            // backgroundColor: Colors.white,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.topRight,
                    colors: <Color>[Colors.white, Color.fromARGB(255, 131, 126, 126)]),
              ),
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: ColoredBox(
                color: Color(0xFFE50D43),
                child: _tabBar,
              ),
            ),
            leading: const Icon(
              Icons.g_mobiledata_sharp,
              color: Colors.black54,
              size: 50,
            ),
          ),
          body: const TabBarView(
            children: [UserApp(), ProductsPageStarter(), ServerApp()],
          ),
        ),
      ),
    );
  }
}
