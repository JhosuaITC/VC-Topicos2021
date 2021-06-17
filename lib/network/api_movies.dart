import 'dart:convert';
import 'dart:html';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:practica2/models/popularDAO.dart';
import 'package:flutter/material.dart';

class ApiMovies {
  var url = Uri.https("http://api.themoviedb.org",
      "/3/movie/popular?api_key=5019e68de7bc112f4e4337a500b96c56&language=es-MX&page=1");

  final String URL_POPULAR = "";
  Future<List<Results>?> getPopular() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var movies = jsonDecode(response.body)['results'];
      List<Results> listMovies =
          movies.map((movies) => Results.fromMap(movies)).toList();
    } else {
      return null;
    }
  }
}
