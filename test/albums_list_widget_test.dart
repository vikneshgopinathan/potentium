import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:potentium_test/bloc/fetch_albums/fetch_albums_bloc.dart';
import 'package:potentium_test/repository/models/album_model.dart';
import 'package:mockito/annotations.dart';

class MockMyBloc extends MockBloc<FetchAlbumsEvent,FetchAlbumsState> implements FetchAlbumsBloc{}

@GenerateMocks([MockMyBloc])
void main() {
  group('MyListView', () {
   late  MockMyBloc mockMyBloc;

    setUp(() {
      mockMyBloc = MockMyBloc();
      when(mockMyBloc.state).thenReturn(FetchAlbumsInitial());

    });

    tearDown(() {
      mockMyBloc.close();
    });

    testWidgets('renders correctly when MyLoadedState is emitted', (WidgetTester tester) async {
      final myModels = [
        AlbumModel(id: 1, title: 'Item 1'),
        AlbumModel(id: 2, title: 'Item 2'),
        AlbumModel(id: 3, title: 'Item 3'),
      ];

      when(mockMyBloc.state).thenAnswer((_) => FetchAlbumsLoaded(albumsList: myModels));

      await tester.pumpWidget(
        BlocProvider<FetchAlbumsBloc>.value(
          value: mockMyBloc,
          child: MaterialApp(
            home: Scaffold(
              body: BlocBuilder<FetchAlbumsBloc, FetchAlbumsState>(
                builder: (context, state) {
                  print(state);
                  if (state is FetchAlbumsLoaded) {
                    return ListView.builder(
                      itemCount: state.albumsList.length,
                      itemBuilder: (context, index) {
                        final myModel = state.albumsList[index];
                        return ListTile(
                          title: Text(myModel.title.toString()),
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
        ),
      );

      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);
      expect(find.text('Item 3'), findsOneWidget);
    });
   tearDown(() {
     mockMyBloc.close();
   });
   testWidgets('renders correctly when Error state  is emitted', (WidgetTester tester) async {
   String error = "Some error";

     when(mockMyBloc.state).thenAnswer((_) => FetchAlbumsError(error: error));

     await tester.pumpWidget(
       BlocProvider<FetchAlbumsBloc>.value(
         value: mockMyBloc,
         child: MaterialApp(
           home: Scaffold(
             body: BlocBuilder<FetchAlbumsBloc, FetchAlbumsState>(
               builder: (context, state) {
                 if (state is FetchAlbumsError) {
                   return  Center(
                     child: Text("Something went wrong"),
                   );
                 }
                 return Container();
               },
             ),
           ),
         ),
       ),
     );

     expect(find.text('Something went wrong'), findsOneWidget);

   });
  });
}
