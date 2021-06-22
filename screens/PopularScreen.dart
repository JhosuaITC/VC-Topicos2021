import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica2/models/popularDAO.dart';
import 'package:practica2/network/api_movies.dart';

class PopularScreen extends StatefulWidget {
  PopularScreen({Key? key}) : super(key: key);
  _PopularScreenState createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  late ApiMovies apiMovies;
  @override
  void initState() {
    super.initState();
    apiMovies = ApiMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: FutureBuilder(
        future: apiMovies.getPopular(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Results>?> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Has error in this request :´('),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return _ListPopular(
              snapshot.data,
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _ListPopular(List<Results>? movies) {
    return ListView.builder(
      itemBuilder: (context, index) {
        Results movie = movies![index];
        return Text(movie.title!);
      },
      itemCount: movies!.length,
    );
  }
}
