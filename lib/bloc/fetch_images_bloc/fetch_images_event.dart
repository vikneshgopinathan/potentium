part of 'fetch_images_bloc.dart';

abstract class FetchImagesEvent extends Equatable {
  const FetchImagesEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class FetchImages extends FetchImagesEvent{
String albumId;

FetchImages({required this.albumId});

}