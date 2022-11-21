import 'package:flutter/material.dart';
import 'package:vignesh/data/data.dart';

// ignore: must_be_immutable
class UserDetailsScreen extends StatelessWidget {
  static const routeName = "/user-details";
  final name;

  var data = MyData();

  UserDetailsScreen({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: FutureBuilder(
          future: data.fetchUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text("No Data found"),
              );
            }
            final user = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              "assets/images/1.png",
                              fit: BoxFit.cover,
                            )),
                        const SizedBox(
                          width: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user['name'],
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "@${user['username']}",
                              style: const TextStyle(color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildField("Email: ", user['email']),
                    buildField("Address: ",
                        "${user['address']['street']},  ${user['address']['suite']}, ${user['address']['city']}, ${user['address']['zipcode'].split("-")[0]}"),
                    buildField("Phone: ", user['phone'].split(" ")[0]),
                    buildField("Website: ", user['website']),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget buildField(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text: title,
                style: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.bold)),
            TextSpan(text: value, style: const TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
