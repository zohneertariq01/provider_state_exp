import 'package:api_tutorials/Provider/favourite_class.dart';
import 'package:api_tutorials/Screens/Favourite/my_favourite_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyFavouriteScreen()));
                },
                child: Icon(Icons.favorite),
              ),
            ],
          ),
          SizedBox(width: 20),
        ],
        title: Text('Favourite Screen'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: 1000,
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
