import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potentium_test/bloc/fetch_albums/fetch_albums_bloc.dart';
import 'package:potentium_test/bloc/search_bloc/search_albums_bloc.dart';
import 'package:potentium_test/ui/view_abum_screen.dart';

import '../repository/models/album_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    BlocProvider.of<FetchAlbumsBloc>(context).add(FetchAlbums());
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Potentium"),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: SearchBarDelegate());
          },
        ),
      ],),
      body: BlocBuilder<FetchAlbumsBloc, FetchAlbumsState>(
        builder: (context, state) {
          if(state is FetchAlbumsLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          if(state is FetchAlbumsLoaded){
            return listView( context, state.albumsList);
          }
          if(state is FetchAlbumsError){
            return Center(
              child: Text("Something went wrong"),
            );
          }
          return Container();
        },
      ),
    );
  }

}
Widget listView(BuildContext context,List<AlbumModel> albumList){
  return ListView.separated(
      itemCount: albumList.length,
      itemBuilder: (context,index){
        return ListTile(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewAlbumScreen(albumModel: albumList[index]))) ;
          },
          title: Text(albumList[index].title.toString()),);

      },
    separatorBuilder: (BuildContext context, int index) { return Divider(); },
  );
}
class SearchBarDelegate extends SearchDelegate<String> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: Colors.white,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),


    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [      IconButton(        icon: Icon(Icons.clear),        onPressed: () {          query = '';        },      ),    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    return Container();
    // Perform search and return results here
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    BlocProvider.of<SearchAlbumsBloc>(context).add(SearchAlbumByTitle(title: query));
    return BlocBuilder<SearchAlbumsBloc, SearchAlbumsState>(
      builder: (context, state) {
        if(state is SearchAlbumsLoading){
          return Center(child:  CircularProgressIndicator(),);
        }
        if(state is SearchAlbumsLoaded){
          print("loaded state");
          return state.albumsList.isNotEmpty ? listView(context, state.albumsList): Center(child: Text("No Albums Found"),);
        }
        return Container();
      },
    );
    // Return suggestions based on current query here
  }
}
