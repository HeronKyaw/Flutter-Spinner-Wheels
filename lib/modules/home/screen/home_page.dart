import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinner_wheel/modules/home/bloc/home_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:spinner_wheel/modules/single_spinner_wheel/screen/single_spinner_wheel_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.person),
          onPressed: () {},
        ),
        title: const Text(
            "Spinner Wheel",
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return ListView.builder(
              padding: const EdgeInsets.only(top:10, bottom: 10),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return  Slidable(
                  // The end action pane is the one at the right or the bottom side.
                  endActionPane: const ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: null,
                        backgroundColor: Color(0xFF7BC043),
                        foregroundColor: Colors.white,
                        icon: Icons.pin_drop_rounded,
                        label: 'Pin',
                      ),
                      SlidableAction(
                        onPressed: null,
                        backgroundColor: Color(0xFFE81123),
                        foregroundColor: Colors.white,
                        icon: Icons.delete_forever,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SingleSpinnerWheelView(),
                        ),
                      );
                    },
                    leading: const Icon(Icons.circle),
                    title: Text('Spinner Wheel #${index+1}'),
                    subtitle: const Text('29/Jun/2023'),
                  ),
                );
              },
            // separatorBuilder: (BuildContext context, int index) => const Divider(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      )
    );
  }
}
