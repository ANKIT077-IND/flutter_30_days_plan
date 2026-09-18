import 'package:dio/dio.dart';
import 'package:flutter_30_days_plan/days07/PhotosModel.dart';
import 'package:flutter_30_days_plan/days07/bloc/photos_event.dart';
import 'package:flutter_30_days_plan/days07/bloc/photos_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc() : super(PhotosInitialState()) {
    on<PhotosEvent>((event, emit) async {
      try {
        emit(PhotosLoadingState());
        final dio = Dio();
        final response = await dio.get(
          "https://jsonplaceholder.typicode.com/photos",
          options: Options(headers: {'Content-Type': 'application/json'}),
        );

        if (response.statusCode == 200) {
          List<dynamic> list = response.data;
          List<PhotosModel> photos = list
              .map((e) => PhotosModel.fromJson(e))
              .toList();
          emit(PhotosSuccessState(photos));
        } else {
          emit(PhotosFailureState(response.data.toString()));
        }
      } catch (e) {
        emit(PhotosFailureState(e.toString()));
      }
    });
  }
}
