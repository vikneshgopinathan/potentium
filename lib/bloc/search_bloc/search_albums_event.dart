part of 'search_albums_bloc.dart';

abstract class SearchAlbumsEvent extends Equatable {
  @override
  List<Object> get props => [];
  const SearchAlbumsEvent();
}

class SearchAlbumByTitle extends SearchAlbumsEvent{
  String title;

  SearchAlbumByTitle({required this.title});

}