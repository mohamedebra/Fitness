import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitness/Features/setting/data/state_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class SettingCubit extends Cubit<SettingState>{
  SettingCubit() : super(InitState());

  static SettingCubit get(context) => BlocProvider.of(context);

  final picker = ImagePicker();
  File? file;
  String? url;

  //get Image
  pickImage() async {
    final XFile? imageFile =
    await picker.pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      file = File(imageFile.path);
      var nameImage = basename(imageFile.path);
      var random = Random().nextInt(10000000);
      nameImage = '$random$nameImage';
      print('//////////$nameImage');
      var refsStorge = FirebaseStorage.instance.ref('images/$random$nameImage');
      await refsStorge.putFile(file!);
      url = await refsStorge.getDownloadURL();
      emit(ChangeImage());
      print('//////////$url');
    } else {
      print('Error');
    }

  }

}