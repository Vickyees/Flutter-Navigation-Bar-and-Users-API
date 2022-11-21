import 'package:flutter/material.dart';
import 'package:vignesh/data/data.dart';

import 'widgets/user_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> response;
  var data = MyData();

  @override
  void initState() {
    super.initState();
    response = data.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/icons/Logo.png"),
        actions: [
          Image.asset("assets/icons/Notification.png"),
          Image.asset("assets/icons/Search.png"),
        ],
      ),
      body: FutureBuilder(
          future: response,
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
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
            final users = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: UserCard(users[index]),
              ),
              itemCount: users!.length,
            );
          }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedLabelStyle: const TextStyle(color: Colors.purple, fontSize: 12),
        unselectedLabelStyle: const TextStyle(color: Colors.grey, fontSize: 12),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset("assets/icons/Home.png"), label: "Home"),
          BottomNavigationBarItem(
              icon: Image.asset("assets/icons/people.png"), label: "People"),
          BottomNavigationBarItem(
              icon: Image.asset("assets/icons/Plus.png"), label: "Create"),
          BottomNavigationBarItem(
              icon: Image.asset("assets/icons/Heart.png"), label: "Activities"),
          BottomNavigationBarItem(
              icon: Image.asset("assets/icons/Profile.png"), label: "Profile"),
        ],
      ),
    );
  }
}
