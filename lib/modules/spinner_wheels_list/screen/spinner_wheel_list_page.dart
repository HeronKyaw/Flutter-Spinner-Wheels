import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinner_wheel/data/repositories/spinner_wheels_repository.dart';
import 'package:spinner_wheel/modules/spinner_wheels_list/bloc/spinner_wheels_list_bloc.dart';

class SpinnerWheelListPage extends StatelessWidget {
  const SpinnerWheelListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpinnerWheelsListBloc(SpinnerWheelRepositoryImpl()),
      child: const SpinnerWheelListView(),
    );
  }
}

class SpinnerWheelListView extends StatelessWidget {
  const SpinnerWheelListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spinner Wheels List'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/spinner_wheel_create');
            },
            icon: const Icon(FluentSystemIcons.ic_fluent_add_filled),
          ),
        ],
      ),
      body: BlocBuilder<SpinnerWheelsListBloc, SpinnerWheelsListState>(
        builder: (context, state) {
          if (state is SpinnerWheelsListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SpinnerWheelsListLoaded) {
            return ListView.builder(
              itemCount: state.spinnerWheelsList.length,
              itemBuilder: (context, index) {
                final spinnerWheel = state.spinnerWheelsList[index];
                return ListTile(
                  title: Text(spinnerWheel.title),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/spinner_wheel_detail',
                      arguments: spinnerWheel,
                    );
                  },
                );
              },
            );
          } else {
            return const Center(
              child: Text('You have no spinner wheels yet. Create one!'),
            );
          }
        },
      ),
    );
  }
}
