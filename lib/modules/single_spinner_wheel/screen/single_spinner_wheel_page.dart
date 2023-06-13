import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinner_wheel/data/repositories/spinner_wheels_repository.dart';
import 'package:spinner_wheel/models/spinner_wheel_model.dart';
import 'package:spinner_wheel/modules/single_spinner_wheel/bloc/single_spinner_wheel_bloc.dart';
import 'package:spinner_wheel/widgets/spinner_wheel_widget.dart';

class SingleSpinnerWheelPage extends StatelessWidget {
  final SpinnerWheel spinnerWheel;
  const SingleSpinnerWheelPage({Key? key, required this.spinnerWheel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingleSpinnerWheelBloc(SpinnerWheelRepositoryImpl()),
      child: const SingleSpinnerWheelView(),
    );
  }
}

class SingleSpinnerWheelView extends StatelessWidget {
  const SingleSpinnerWheelView({super.key});

  @override
  Widget build(BuildContext context) {
    //this page will have a spinner wheel and Tabs to switch between the items
    // and the wheels
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
      ),
      body: Column(children: [
        BlocBuilder<SingleSpinnerWheelBloc, SingleSpinnerWheelState>(
          builder: (context, state) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 350,
                  height: 350,
                  child: SpinnerWheelWidget(items: [
                    "Hey",
                    "Hello",
                    "Bonjour"
                  ]),
                ),
              ),
            );
          },
        )
      ]),
    );
  }
}
