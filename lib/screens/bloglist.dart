import 'package:flutter/material.dart';
import 'package:subspaceass/models/favblog.dart';
import 'package:subspaceass/screens/detailed.dart';
import 'package:subspaceass/service/API.dart';
import 'package:subspaceass/shared/loading.dart';
import '../models/blog.dart';
import 'package:provider/provider.dart';

class bloglist extends StatefulWidget {
  const bloglist({super.key});

  @override
  State<bloglist> createState() => _bloglistState();
}

class _bloglistState extends State<bloglist> {
  Apiuse ins =Apiuse();
  List<Blog> futureblogs = [];
  bool loading = false;
  @override
  void initState() {
    super.initState();
    _loadBlogs();
  }
  Future<void> _loadBlogs() async {
    setState(() {
      loading = true;
    });
      final fetchedBlogs = await ins.fetchBlogs(context);
    setState(() {
      loading = false;
    });
      setState(() {
        futureblogs = fetchedBlogs;
      });
    }
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
                        'BlogSpace',
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
                    'Hi \n Welcome to BlogSpace. \n The place where you can Peacefully read and save your Blogs!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: futureblogs.length,
                itemBuilder: (context, index) {
                  if (futureblogs.isEmpty){
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
                                          detailed(currblog: favmodel.blogs[index]),
                                    ),
                                  );
                                  print(
                                      '${futureblogs[index]?.image ?? "No Image"}, '
                                          '${futureblogs[index]?.title ?? "No Title"}, '
                                          '${futureblogs[index]?.id ?? "No ID"}'
                                          '${futureblogs[index]?.isfav}, \n'
                                    // "${favmodel.blogs[index]?.title ?? "No Title"},"
                                    //       "${favmodel.blogs[index]?.isfav ?? "No Title"},"
                                  );
                                },
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(futureblogs[index].image),
                                      radius: 30,
                                    ),
                                    Text(
                                      futureblogs[index].title,
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
                                          favmodel.blogs[index].isfav = !favmodel.blogs[index].isfav;
                                        });
                                        final blogt = futureblogs[index];

                                        if (blogt.isfav) {
                                          favmodel.addToFavorites(blogt, index);
                                        } else {
                                          favmodel.removeFromFavorites(blogt,index);
                                        }
                                      },
                                      icon: futureblogs[index].isfav? Icon(Icons.favorite): Icon(Icons.favorite_border),
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
            SizedBox(
              height: MediaQuery.of(context).size.width *0.7,
            )
          ],
        ),
      ),
    );
  }
}
