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
      body: Container(
          child: ListView.builder(
        itemCount: _data.value?.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${_data.value?[index].body}"),
          );
        },
      )),
    );
  }
}

/* 
ElevatedButton(
          onPressed: () => print("I am Data : ${_data.value![0].body}"),
          child: Text("Click me"),
        ), 
*/


/* 
Container(
          child: ListView.builder(
        itemCount: _data.value!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${_data.value![index].body}"),
          );
        },
      )),

 */


/* 
_data.when(
          data: (_data) {
            return Column(
              children: [
                ..._data.map((e) => ListView(shrinkWrap: true, children: [
                      ListTile(
                        title: Text(e.firstname),
                        subtitle: Text(e.lastname),
                        trailing: CircleAvatar(
                          backgroundImage: NetworkImage(e.avatar),
                        ),
                      ),
                    ])),
              ],
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
         
        )

 */