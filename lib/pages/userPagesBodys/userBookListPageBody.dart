import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdmiu_app_biblioteca/widgets/mobileUserDrawer.dart';
import 'package:pdmiu_app_biblioteca/utility/httpGetHelper.dart' as httpHelper;
import 'package:http/http.dart' as http;
import '../../models/user.dart';
import '../../utility/providers.dart';

// "home page" dell'utente
class UserBookListPageBody extends ConsumerWidget {
  const UserBookListPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User user = ref.watch(currentUserProvider.notifier);

    return FutureBuilder(
      future: user.getLibri(),
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Connection Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final response = snapshot.data!; // as http.Response;

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.deepOrange.shade500,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            offset: Offset.fromDirection(120, 8),
                            color: Colors.black.withAlpha(100))
                      ]),
                  child: const Center(
                      child: Text('Lista dei libri',
                          style: TextStyle(fontSize: 20, color: Colors.white))),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: _trimResponse(response.body).length,
                      itemBuilder: (context, index) {
                        return Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.symmetric(vertical: 10),
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
                              child: Text(_trimResponse(response.body)[index],
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ));
                      }),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}

List<String> _trimResponse(String bookList) {
  // ogni libro e' separato da '\n'
  final List<String> stringList = bookList.split('\n');

  // elimino 'Lista libri:\n ...' dalla risposta
  stringList.removeAt(0);

  // elimino gli spazi vuoti
  for (var element in stringList) {
    element.trim();
  }

  //elimino stringhe vuote
  stringList.removeWhere((element) => element == '');

  //debugPrint(stringList.toString());
  return stringList;
}
