import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/albums_repository.dart';
import '../../repository/models/album_model.dart';

part 'fetch_albums_event.dart';
part 'fetch_albums_state.dart';

class FetchAlbumsBloc extends Bloc<FetchAlbumsEvent, FetchAlbumsState> {
  AlbumRepository albumRepository ;
  FetchAlbumsBloc(this.albumRepository) : super(FetchAlbumsInitial()) {
    on<FetchAlbums>((event, emit) async {
      emit(FetchAlbumsLoading());

      try{
        List<AlbumModel>   albumlist = await albumRepository.fetchAlbums();
        emit(FetchAlbumsLoaded(albumsList: albumlist));
      }catch(e){
        print(e);
        emit(FetchAlbumsError(error:  e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
