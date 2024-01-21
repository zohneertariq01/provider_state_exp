import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/favourite_class.dart';

class MyFavouriteScreen extends StatefulWidget {
  const MyFavouriteScreen({super.key});

  @override
  State<MyFavouriteScreen> createState() => _MyFavouriteScreenState();
}

class _MyFavouriteScreenState extends State<MyFavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteClass>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favourite'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: provider.selectedItems.length,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteClass>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItems.contains(index)) {
                          value.removeFavourite(index);
                        } else {
                          value.addFavourite(index);
                        }
                      },
                      title: Text('Item:' + " " + index.toString()),
                      trailing: Icon(
                        value.selectedItems.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                      ),
                    );
                  });
                }),
          ),
        ],
      ),
    );
  }
}
