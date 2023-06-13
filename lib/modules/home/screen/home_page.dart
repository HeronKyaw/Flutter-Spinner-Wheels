import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinner_wheel/models/spinner_wheel_model.dart';
import 'package:spinner_wheel/modules/home/cubit/home_cubit.dart';
import 'package:spinner_wheel/modules/single_spinner_wheel/screen/single_spinner_wheel_page.dart';
import 'package:spinner_wheel/modules/spinner_wheels_list/screen/spinner_wheel_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static final List<Widget> _pages = <Widget>[
    SingleSpinnerWheelPage(spinnerWheel: SpinnerWheel(
      id: 1,
      userId: 2221,
      title: "Hello testing",
      items: [
        "Hey",
        "Hello",
        "Bonjour"
      ]
    ),),
    const SpinnerWheelListPage(),
    const Text("Profile"),
    const Text("Setting"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: BlocBuilder<HomeCubit, int>(
        builder: (_, selectedIndex) {
          return _pages[selectedIndex];
        },
      )),
      bottomNavigationBar: BlocBuilder<HomeCubit, int>(
        builder: (_, selectedIndex) {
          return BottomNavigationBar(
            currentIndex: selectedIndex,
            elevation: 10,
            // use cubit to change the index
            onTap: (index) {
              context.read<HomeCubit>().changeIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: const Color.fromRGBO(78, 1, 137, 1),
            unselectedItemColor: const Color.fromRGBO(78, 1, 137, 1),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_clock_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_clock_filled),
                  label: "Recent"),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_text_bullet_list_square_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_text_bullet_list_square_filled),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
                  label: "Profile"),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_settings_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_settings_filled),
                  label: "Setting"),
            ],
          );
        },
      ),
    );
  }
}
