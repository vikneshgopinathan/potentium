part of 'fetch_images_bloc.dart';

abstract class FetchImagesState extends Equatable {
  const FetchImagesState();
  @override
  List<Object> get props => [];
}

class FetchImagesInitial extends FetchImagesState {}
class FetchImagesLoading extends FetchImagesState {}
class FetchImagesLoaded extends FetchImagesState {
  List<ImagesModel> imageslist;
  FetchImagesLoaded({required this.imageslist});
}
class FetchImagesError extends FetchImagesState {
  String error;
  FetchImagesError({required this.error});
}
