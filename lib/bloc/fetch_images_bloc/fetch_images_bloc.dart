import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/albums_repository.dart';
import '../../repository/models/images_model.dart';

part 'fetch_images_event.dart';
part 'fetch_images_state.dart';

class FetchImagesBloc extends Bloc<FetchImagesEvent, FetchImagesState> {
  AlbumRepository albumRepository = AlbumRepository();
  FetchImagesBloc() : super(FetchImagesInitial()) {
    on<FetchImages>((event, emit) async {
      emit(FetchImagesLoading());
      try{
        List<ImagesModel> imagesList = await albumRepository.fetchImages(event.albumId);
        emit(FetchImagesLoaded(imageslist: imagesList));
      }catch(e){
        emit(FetchImagesError(error: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
