import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../bloc/home_name/home_name_cubit.dart';
import '../colors.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CharacterAvatar(),
                SizedBox(
                  height: 40,
                ),
                ArabicInput(),
                SizedBox(
                  height: 40,
                ),
                CustomButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CharacterAvatar extends StatelessWidget {
  const CharacterAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 125.5,
          backgroundColor: MyColors().textColor,
          child: const CircleAvatar(
            radius: 124,
            backgroundImage: AssetImage('assets/jello1.png'),
          ),
        ),
        Text(
          'مرحبًا بكً',
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: MyColors().textColor),
        ),
      ],
    );
  }
}

class ArabicInput extends StatelessWidget {
  const ArabicInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'الاسم',
              style: TextStyle(color: MyColors().textColor, fontSize: 26),
            ),
            SizedBox(
              width: 310,
              child: TextField( onChanged: (value) {BlocProvider.of<HomeNameCubit>(context).updateName(value);},
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: MyColors().accentColor,
                    hintTextDirection: TextDirection.rtl,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none)),
                    hintText: 'اكتب اسمك',
                    hintStyle: TextStyle(
                        color: MyColors().textColor.withOpacity(0.5))),
              ),
            ),
          ],
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
          Navigator.of(context).pushNamed('/avatarpage');
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
