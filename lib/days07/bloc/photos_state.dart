import 'package:equatable/equatable.dart';
import 'package:flutter_30_days_plan/days07/PhotosModel.dart';

class PhotosState extends Equatable {
  List<Object?> get props => [];
}

class PhotosInitialState extends PhotosState {}

class PhotosLoadingState extends PhotosState {}

class PhotosSuccessState extends PhotosState {
  final List<PhotosModel> photosList;
  PhotosSuccessState(this.photosList);

  @override
  List<Object> get props => [photosList];
}

class PhotosFailureState extends PhotosState {
  final String error;
  PhotosFailureState(this.error);

  @override
  List<Object> get props => [error];
}
