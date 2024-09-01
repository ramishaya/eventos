import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'imagepicker_state.dart';

class ImagepickerCubit extends Cubit<ImagePickerState> {
  ImagepickerCubit() : super(ImagePickerInitial());

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    try {
      final XFile? pickedImage =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        emit(ImagePickerSuccess(File(pickedImage.path)));
      } else {
        emit(ImagePickerFailure());
      }
    } catch (e) {
      emit(ImagePickerFailure());
    }
  }
}
