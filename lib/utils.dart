import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

String token = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlODc2ZjE2YWJlODc4NTM3MzVmNzk2ZTQ2YjMzMWFlZiIsIm5iZiI6MTcyNDA1NTQwMC40MDAzNjksInN1YiI6IjY0MGI0MDkxY2FhY2EyMDBiODA0NmY4YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.a-_3zFLM2Un9V05fuuBCQ2p5yh0Jx4EmSze7mYkNjuM';
const String moviesApi = 'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc';
const String tvApi = 'https://api.themoviedb.org/3/discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=1&sort_by=popularity.desc';


void showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    textColor: Colors.black,
    fontSize: 16,
    backgroundColor: Colors.grey[300],
  );
}