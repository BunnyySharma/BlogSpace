import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subspaceass/models/favblog.dart';
import '../shared/loading.dart';
import 'detailed.dart';

class favourites extends StatefulWidget {
  const favourites({super.key});

  @override
  State<favourites> createState() => _favouritesState();
}

class _favouritesState extends State<favourites> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final favmodel = Provider.of<Favblogmodel>(context);
    return loading? Loading(): Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(40),
                    child: Text(
                      'Favourites',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Center(
                  child: Text(
                    'Hi \n Welcome to BlogSpace. \n The place where you can Peacefully read your saved blogs!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            if (favmodel.favoriteBlogs.isNotEmpty)
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: PageScrollPhysics(),
                  itemCount: favmodel.favoriteBlogs.length,
                  itemBuilder: (context, index) {
                    if (favmodel.favoriteBlogs.isEmpty){
                      print('wait');
                      return Center(child: CircularProgressIndicator(),);
                    }else{
                      return Padding(
                        padding: EdgeInsets.only(left: 8, bottom: 8),
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Card(
                              child: Stack(
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                detailed(currblog: favmodel.favoriteBlogs[index]),
                                          ),
                                        );
                                        print("${favmodel.blogs[index]?.title ?? "No Title"},"
                                              "${favmodel.blogs[index]?.isfav ?? "No Title"},");
                                      },
                                      title: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: NetworkImage(favmodel.favoriteBlogs[index].image),
                                            radius: 30,
                                          ),
                                          Text(
                                            favmodel.favoriteBlogs[index].title,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      tileColor: Colors.grey[900],
                                    ),
                                    Positioned(
                                        top: 0,
                                        right: 0,
                                        child: IconButton(
                                          onPressed: (){
                                            setState(() {
                                              // futureblogs[index].isfav = !futureblogs[index].isfav;
                                              favmodel.favoriteBlogs[index].isfav = !favmodel.favoriteBlogs[index].isfav;
                                            });
                                            final blogt = favmodel.favoriteBlogs[index];

                                            if (blogt.isfav) {
                                              favmodel.addToFavorites(blogt, index);
                                            } else {
                                              favmodel.removeFromFavorites(blogt, index);
                                            }
                                          },
                                          icon: favmodel.favoriteBlogs[index].isfav? Icon(Icons.favorite): Icon(Icons.favorite_border),
                                          iconSize: 30,
                                          color: Colors.red[700],
                                        )
                                    ),
                                  ]
                              ),
                              elevation: 0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(13),
                            )
                        ),
                      );
                    }
                  }
              ),
            ),
            if (favmodel.favoriteBlogs.isEmpty)
              Column(
                children: [
                  Text(
                    'No blogs Available as for now, But you can',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.grey,
                          size: 30,
                        ),
                        SizedBox(width: 5,),
                        Text(
                            'Add Your first Favourite blog!',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            SizedBox(
              height: MediaQuery.of(context).size.width *0.7,
            )
          ],
        ),
      ),
    );
  }
}
