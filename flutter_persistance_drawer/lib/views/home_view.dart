import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_persistance_drawer/bloc/drawer_event.dart';
import 'package:flutter_persistance_drawer/bloc/nav_drawer_bloc.dart';
import 'package:flutter_persistance_drawer/bloc/nav_drawer_state.dart';
import 'package:iconly/iconly.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              IconlyBold.home,
              size: 100,
            ),
            const Text(
              "Home View",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "It can be a stateless or stateful class. You can place any content or widgets you need within this page class.",
                textAlign: TextAlign.center,
              ),
            ),
            TextButton(
                onPressed: () {
                  BlocProvider.of<NavDrawerBloc>(context)
                      .add(const NavigateTo(NavItem.cartView));
                },
                child: const Text("Go To CART"))
          ],
        ),
      ),
    );
  }
}
