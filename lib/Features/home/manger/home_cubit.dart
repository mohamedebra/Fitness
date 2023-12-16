import 'package:fitness/Features/home/manger/home_state.dart';
import 'package:fitness/Features/home/presentation/home_view.dart';
import 'package:fitness/Features/setting/veiw/setting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List screens = [
    Home(),
    Setting(),
  ];

  void changeBottonNav(index) {
    currentIndex = index;
    emit(ChangeBottonNav());

  }

}
