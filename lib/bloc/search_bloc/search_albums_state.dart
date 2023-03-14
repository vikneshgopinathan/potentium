part of 'search_albums_bloc.dart';

abstract class SearchAlbumsState extends Equatable {
  const SearchAlbumsState();
}

class SearchAlbumsInitial extends SearchAlbumsState {
  @override
  List<Object> get props => [];

}

class SearchAlbumsLoading extends SearchAlbumsState {
  @override
  List<Object> get props => [];
}
class SearchAlbumsLoaded extends SearchAlbumsState {
  @override
  List<Object> get props => [];
  List<AlbumModel> albumsList;
  SearchAlbumsLoaded({required this.albumsList});
}
class SearchAlbumsError extends SearchAlbumsState {
  @override
  List<Object> get props => [];

  String error;
  SearchAlbumsError({required this.error});
}

