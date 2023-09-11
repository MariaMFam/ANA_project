import 'package:ana_project/bloc/home_name/home_name_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../colors.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeNameCubit, HomeNameState>(
  builder: (context, state) {
    return Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'اخْتَرْ شَكْلٍ مِنَ الْأَشْكَالِ',
                  style: TextStyle(
                      color: MyColors().textColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 40),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 150,
                            childAspectRatio: 2 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 46),
                    itemCount: BlocProvider.of<HomeNameCubit>(context)
                        .avatarImagesList
                        .length,
                    itemBuilder: (BuildContext ctx, index) {
                      return InkWell(
                        onTap: () {
                          BlocProvider.of<HomeNameCubit>(context).updateImage(
                              BlocProvider.of<HomeNameCubit>(context)
                                  .avatarImagesList[index]);
                        },
                        child: CircleAvatar(
                          backgroundColor:
                              (BlocProvider.of<HomeNameCubit>(context)
                                          .avatarImagesList[index] ==
                                      BlocProvider.of<HomeNameCubit>(context)
                                          .imagePath)
                                  ? MyColors().primaryColor
                                  : MyColors().textColor,
                          child: CircleAvatar( radius: 53,
                            child: Image.asset(
                                BlocProvider.of<HomeNameCubit>(context)
                                    .avatarImagesList[index],),
                          ),

                        ),
                      );
                    }),
                CustomButton()
              ],
            ),
          ),
        );
  },
),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      height: 36,
      child: FilledButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/categorypage');
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(MyColors().primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
        ),
        child: const Text(
          'التَّالِي',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
