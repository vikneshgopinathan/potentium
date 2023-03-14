import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potentium_test/bloc/fetch_images_bloc/fetch_images_bloc.dart';
import 'package:potentium_test/bloc/fetch_images_bloc/fetch_images_bloc.dart';
import 'package:potentium_test/repository/models/album_model.dart';

import '../repository/models/images_model.dart';

class ViewAlbumScreen extends StatefulWidget {
  ViewAlbumScreen({Key? key, required this.albumModel}) : super(key: key);
  AlbumModel albumModel;

  @override
  State<ViewAlbumScreen> createState() => _ViewAlbumScreenState();
}

class _ViewAlbumScreenState extends State<ViewAlbumScreen> {
  @override
  void initState() {
    BlocProvider.of<FetchImagesBloc>(context).add(FetchImages(albumId: widget.albumModel.id.toString()));
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.albumModel.title.toString()),
      ),
      body: BlocBuilder<FetchImagesBloc, FetchImagesState>(
        builder: (context, state) {
          if(state is FetchImagesLoading){
            return Center(child:  CircularProgressIndicator(),);
          }
          if(state is FetchImagesLoaded){
return ImageCarousal(state.imageslist, context);
          }
          if(state is FetchImagesError){
            return Center(
              child: Text("Something went wrong"),
            );
          }
          return Container();
        },
      ),

    );
  }

  Widget ImageCarousal(List<ImagesModel> imagesList,BuildContext context){
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,) , itemBuilder: (context,index){

      return Container(
        width: MediaQuery.of(context).size.width/2,
        height: MediaQuery.of(context).size.width/2,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black)
        ),
        child: Stack(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.width/2,
                child: Image.network(imagesList[index].thumbnailUrl.toString(),fit: BoxFit.fill,)),
            Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(imagesList[index].title.toString()),
            ))
          ],
        ),
      );

    });
  }

}
