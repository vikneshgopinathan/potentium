import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:potentium_test/repository/models/album_model.dart';

import '../../repository/albums_repository.dart';

part 'search_albums_event.dart';
part 'search_albums_state.dart';

class SearchAlbumsBloc extends Bloc<SearchAlbumsEvent, SearchAlbumsState> {
  AlbumRepository albumRepository = AlbumRepository();
  SearchAlbumsBloc() : super(SearchAlbumsInitial()) {
    on<SearchAlbumByTitle>((event, emit) async  {
      emit(SearchAlbumsLoading());
      try{
        List<AlbumModel> albumsList = await albumRepository.fetchAlbumsbySearch(event.title);
        emit(SearchAlbumsLoaded(albumsList: albumsList));

      }catch(e){
        print(e);
        emit(SearchAlbumsError(error: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
