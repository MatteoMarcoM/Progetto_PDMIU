import 'package:flutter/material.dart';
import 'package:pdmiu_app_biblioteca/utility/httpGetHelper.dart' as httpHelper;

class BiblioHomePageBody extends StatelessWidget {
  const BiblioHomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FutureBuilder(
            future: httpHelper.getRootWebSite(),
            builder: ((context, snapshot) {
              if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.deepOrange.shade500,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  offset: Offset.fromDirection(120, 8),
                                  color: Colors.black.withAlpha(100))
                            ]),
                        child: Center(
                          child: Text('Connection Error: ${snapshot.error}',
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white)),
                        )),
                  ),
                );
              } else if (snapshot.hasData) {
                final response = snapshot.data!; // as http.Response;

                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.deepOrange.shade500,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  offset: Offset.fromDirection(120, 8),
                                  color: Colors.black.withAlpha(100))
                            ]),
                        child: Center(
                          child: Text(
                            'Connesso alla root del servizio: ${response.body}',
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white),
                          ),
                        )),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
          ),
          // istruzioni servizio in ListView
        ],
      ),
    );
  }
}
