import 'package:flutter_test/flutter_test.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:mockito/mockito.dart';
import 'package:potentium_test/bloc/fetch_albums/fetch_albums_bloc.dart';
import 'package:potentium_test/bloc/fetch_images_bloc/fetch_images_bloc.dart';
import 'package:potentium_test/repository/albums_repository.dart';
import 'package:potentium_test/repository/models/album_model.dart';
import 'package:mockito/annotations.dart';

class MockRepository extends Mock implements AlbumRepository {}

@GenerateMocks([MockRepository])
void main() {
  group('Album Bloc', () {
    late FetchAlbumsBloc myBloc;
    late MockRepository mockRepository;

  late List<AlbumModel> albumModelList;

    setUp(() {
      mockRepository = MockRepository();
      myBloc =  FetchAlbumsBloc(mockRepository);
      albumModelList = [AlbumModel(title: "item1",id: 1),AlbumModel(title: "item2",id: 2)];

    });

    tearDown(() {
      myBloc.close();
    });

    test('initial state is correct', () {
      expect(myBloc.state, FetchAlbumsInitial());
    });

    blocTest<FetchAlbumsBloc, FetchAlbumsState>(
      'emits loading and error states loaded - no data',
      build: () => myBloc,
      act: (bloc) => bloc.add(FetchAlbums()),
      expect: ( )=> <FetchAlbumsState> [
       FetchAlbumsLoading(),
       FetchAlbumsError(error: '')

      ],
    );
    test(
      'emits loaded state',
          () {
        when(mockRepository.fetchAlbums())
            .thenAnswer((_) async => Future.value(albumModelList));

        myBloc.add(FetchAlbums());
        expectLater(
          myBloc,
          emitsInOrder([
            FetchAlbumsLoading(),
            FetchAlbumsLoaded(albumsList: albumModelList),

          ]),
        );
      },
    );


    // blocTest<FetchAlbumsBloc, FetchAlbumsState>(
    //
    //   'emits loading and loaded states loaded',
    //   build: () => myBloc,
    //   act: (bloc) => bloc.add(FetchAlbums()),
    //   expect: ( )=> <FetchAlbumsState> [
    //     FetchAlbumsLoading(),
    //   FetchAlbumsLoaded(albumsList: albumModelList)
    //
    //   ],
    // );
    //

  });


}