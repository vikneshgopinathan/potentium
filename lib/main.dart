import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potentium_test/bloc/fetch_albums/fetch_albums_bloc.dart';
import 'package:potentium_test/bloc/search_bloc/search_albums_bloc.dart';
import 'package:potentium_test/repository/albums_repository.dart';
import 'package:potentium_test/ui/home_screen.dart';

import 'bloc/fetch_images_bloc/fetch_images_bloc.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 MyApp({super.key});
AlbumRepository albumRepository =AlbumRepository();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchAlbumsBloc(this.albumRepository),
        ),
        BlocProvider(
          create: (context) => FetchImagesBloc(),
        ),
        BlocProvider(
          create: (context) => SearchAlbumsBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Potentium Test',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

