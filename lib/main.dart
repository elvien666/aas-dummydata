import 'package:flutter/material.dart';
import 'package:tugas_aas/homepage/homepage.dart';
import 'package:tugas_aas/models/products.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Dummy Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => HomePage())],
      child: Consumer<HomePage>(builder: (context, productprovider, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Dummy Data',
              style: TextStyle(color: Color.fromARGB(255, 21, 5, 78)),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.all(0.8),
            child: productprovider.isLoading
                ? Center(
                    child: const CircularProgressIndicator(
                    color: Color(0xFF37AEEE),
                  ))
                : ListView.builder(
                    itemCount: productprovider.product.length,
                    itemBuilder: (context, index) {
                      Product data = productprovider.product[index];
                      return InkWell(
                        onTap: () async {
                          //detail
                          onClick();
                        },
                        child: Card(
                          shadowColor: Colors.black,
                          child: ListTile(
                            leading: Image.network(
                              data.thumbnail,
                            ),
                            title: Text(
                              data.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              data.description,
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        );
      }),
    );
  }

  void onClick() {}
}
