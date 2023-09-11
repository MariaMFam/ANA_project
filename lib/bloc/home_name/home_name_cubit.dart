import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_name_state.dart';

class HomeNameCubit extends Cubit<HomeNameState> {
  HomeNameCubit() : super(HomeNameInitial());
  String name = '';
  String imagePath = 'assets/jello1.png';
  List avatarImagesList = [
    'assets/avatars/girl.png',
    'assets/avatars/boy.png',
    'assets/avatars/dog.png',
    'assets/avatars/cow.png',
    'assets/avatars/crow.png',
    'assets/avatars/cat.png',
    'assets/avatars/tiger.png',
    'assets/avatars/octo.png',
    'assets/avatars/panda.png',
  ];

  void updateName(String name1) {
    name = name1;
    print(name);
  }

  void updateImage(String avatar1) {
    imagePath = avatar1;
    emit(HomeNameImageUpdate());
    print(imagePath);
  }
}
