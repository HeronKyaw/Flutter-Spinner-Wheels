import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinner_wheel/modules/home/cubit/home_cubit.dart';

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
    const Text("Spinner Wheel List"),
    const Text("Profile"),
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
            selectedItemColor: Colors.blueGrey,
            unselectedItemColor: const Color(0xFF526480),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
                  label: "Profile"),
            ],
          );
        },
      ),
    );
  }
}
