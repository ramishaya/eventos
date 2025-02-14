part of 'imagepicker_cubit.dart';

@immutable
abstract class ImagePickerState {}

class ImagePickerInitial extends ImagePickerState {}

class ImagePickerSuccess extends ImagePickerState {
  final File image;
  ImagePickerSuccess(this.image);
}
class ImagePickerFailure extends ImagePickerState{}
