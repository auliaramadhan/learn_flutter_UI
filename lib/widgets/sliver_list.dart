import 'package:flutter/material.dart';

import '../images.dart';

class SliverListApp extends StatelessWidget {
  const SliverListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            expandedHeight: 360,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('hai ini Header'),
              background: Image.network(ImageNetworks.winXP),
            ),
            // appear snap
            snap: true,
            floating: true,
            pinned: true,
          ),
        ];
      },
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            child: Text('list number $index'),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
