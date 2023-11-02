import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api/providers/user_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Users")),
      body: _data.when(
        data: (data) => ListView.builder(
          itemCount: _data.value?.length,
          itemBuilder: (context, index) {
            return Card(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("Name"), Text("Email"), Text("Age"), Text("City")],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        Text(":"),
                        Text(":"),
                        Text(":"),
                        Text(":"),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_data.value![index].userName.toString()),
                      Text(_data.value![index].email.toString()),
                      Text(_data.value![index].age.toString()),
                      Text(_data.value![index].city.toString()),
                    ],
                  ),
                ],
              ),
            ));
          },
        ),
        error: (err, s) => Text(err.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
