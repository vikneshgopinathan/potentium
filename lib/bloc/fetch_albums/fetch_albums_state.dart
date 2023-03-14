part of 'fetch_albums_bloc.dart';

abstract class FetchAlbumsState extends Equatable {
  const FetchAlbumsState();
}

class FetchAlbumsInitial extends FetchAlbumsState {
  @override
  List<Object> get props => [];
}
class FetchAlbumsLoading extends FetchAlbumsState {
  @override
  List<Object> get props => [];
}
class FetchAlbumsLoaded extends FetchAlbumsState {
  List<AlbumModel> albumsList;
  FetchAlbumsLoaded({required this.albumsList});
  @override
  List<Object> get props => [];
}
class FetchAlbumsError extends FetchAlbumsState {
  String error;
  FetchAlbumsError({required this.error});
  @override
  List<Object> get props => [];
}
