import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_name/home_name_cubit.dart';

import '../colors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container( height: 450,
      decoration: BoxDecoration( color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * .4,
              ),
              Text(
                'الاعدادات',
                style: TextStyle(
                    color: MyColors().textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),

            ],
          ),
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(
                BlocProvider.of<HomeNameCubit>(context).imagePath),
          ),
          Text(
            BlocProvider.of<HomeNameCubit>(context).name,
            style: TextStyle(
                color: MyColors().textColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'تعديل الاسم',
                      style: TextStyle(
                          color: MyColors().textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {Navigator.of(context).pushNamed('/homepage');},
                      icon: Icon(
                        Icons.drive_file_rename_outline,
                        color: MyColors().textColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'اختيار شكل جديد',
                      style: TextStyle(
                          color: MyColors().textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {Navigator.of(context).pushNamed('/avatarpage');},
                      icon: Icon(
                        Icons.circle_outlined,
                        color: MyColors().textColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'ازالة فئة',
                      style: TextStyle(
                          color: MyColors().textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_circle_outline,
                        color: MyColors().textColor,
                      ),
                    ),
                  ],
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
