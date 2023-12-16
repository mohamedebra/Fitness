import 'package:fitness/Features/home/manger/home_cubit.dart';
import 'package:fitness/Features/home/manger/home_state.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/core/unit/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => HomeCubit(),
        child: BlocBuilder<HomeCubit,HomeState>(
          builder: (BuildContext context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            extendBody: true,
            backgroundColor: background,
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: BottomNavigationBar(
                elevation: 0,
                backgroundColor:Colors.transparent,
                  selectedItemColor: Colors.white,
                  currentIndex: cubit.currentIndex,
                  onTap: (index) {
                    cubit.changeBottonNav(index);
                  },
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(IconBroken.Home), label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(IconBroken.Setting),
                        label: 'Setting'),
                  ]),
            ),

          );
        },
        ));
  }
}
