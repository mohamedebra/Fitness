import 'package:fitness/Features/auth/veiw/login.dart';
import 'package:fitness/Features/setting/data/setting_cubit.dart';
import 'package:fitness/Features/setting/data/state_cubit.dart';
import 'package:fitness/core/unit/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Setting extends StatelessWidget {
  var firstController = TextEditingController();

  Setting({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit, SettingState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SettingCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              'Setting',
              style: Styles.textStyle27,
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: cubit.url != null
                            ? NetworkImage(cubit.url!)
                            : const NetworkImage(
                                'https://img.freepik.com/free-photo/young-man-s-portrait-isolated-blue-studio-wall_155003-37525.jpg'),
                      ),
                      Spacer(),
                      InkWell(
                          onTap: () {
                            cubit.pickImage();
                          },
                          child: Text('Edit personal photo',
                              style: Styles.textStyle20)),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * .4,
                    height: 1,
                    color: Colors.grey[300],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('First name', style: Styles.textStyle18),
                      SizedBox(
                        height: 7,
                      ),
                      TextFormField(
                        onTap: () {},
                        controller: firstController,
                        decoration: InputDecoration(
                            hintText: 'First name',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontFamily: 'pacifico')),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * .4,
                    height: 1,
                    color: Colors.grey[300],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Last name', style: Styles.textStyle18),
                      SizedBox(
                        height: 7,
                      ),
                      TextFormField(
                        onTap: () {},
                        decoration: InputDecoration(
                            hintText: 'Last name',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontFamily: 'pacifico')),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * .4,
                    height: 1,
                    color: Colors.grey[300],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Text(
                        'Password',
                        style: Styles.textStyle18,
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * .4,
                    height: 1,
                    color: Colors.grey[300],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      InkWell
                        (
                        onTap:(){
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
                        },
                          child: Text('Sign Out', style: Styles.textStyle18)),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
