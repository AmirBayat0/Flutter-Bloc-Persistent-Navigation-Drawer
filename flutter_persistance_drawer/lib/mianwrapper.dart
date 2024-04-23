import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_persistance_drawer/bloc/nav_drawer_bloc.dart';
import 'package:flutter_persistance_drawer/bloc/nav_drawer_state.dart';
import 'package:flutter_persistance_drawer/views/cart_view.dart';
import 'package:flutter_persistance_drawer/views/home_view.dart';
import 'package:flutter_persistance_drawer/views/order_view.dart';
import 'package:flutter_persistance_drawer/views/profile_view.dart';
import 'package:flutter_persistance_drawer/views/setting_view.dart';
import 'package:flutter_persistance_drawer/widget/drawer_widget.dart';
import 'package:flutter_persistance_drawer/widget/info_builder.dart';
import 'package:iconly/iconly.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  MainWrapperState createState() => MainWrapperState();
}

class MainWrapperState extends State<MainWrapper> {
  /// NavDrawer Bloc
  late NavDrawerBloc _bloc;

  /// Each Item in Drawer Content
  late Widget _content;

  @override
  void initState() {
    super.initState();
    _bloc = NavDrawerBloc();
    _content = _getContentForState(_bloc.state.selectedItem);
  }

  //
// Created by CodeWithFlexZ
// Tutorials on my YouTube
//
//! Instagram
//! @CodeWithFlexZ
//
//? GitHub
//? AmirBayat0
//
//* YouTube
//* Programming with FlexZ
//

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavDrawerBloc>(
      create: (BuildContext context) => _bloc,
      child: BlocConsumer<NavDrawerBloc, NavDrawerState>(
        /// Listener
        listener: (BuildContext context, NavDrawerState state) {
          _content = _getContentForState(state.selectedItem);
        },

        /// Build When
        buildWhen: (previous, current) {
          return previous.selectedItem != current.selectedItem;
        },

        /// Listen When
        listenWhen: (previous, current) {
          return previous.selectedItem != current.selectedItem;
        },

        /// Builder
        builder: (BuildContext context, NavDrawerState state) {
          /// Main App Scaffold
          return Scaffold(
            /// Drawer
            drawer: NavDrawerWidget(),

            /// AppBar
            appBar: _buildAppBar(state),

            /// FAB
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (_) => const SettingView()));
              },
              child: const Icon(IconlyBold.setting),
            ),

            /// Body
            body: AnimatedSwitcher(
              switchInCurve: Curves.easeInExpo,
              switchOutCurve: Curves.easeOutExpo,
              duration: const Duration(milliseconds: 400),

              /// Each Item Body/Content
              child: _content,
            ),
            bottomNavigationBar: const InfoBuilder(),
          );
        },
      ),
    );
  }

  /// MainWrapper AppBar
  AppBar _buildAppBar(NavDrawerState state) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      title: Text(
        _getAppBarTitle(state.selectedItem),
        style: const TextStyle(color: Colors.white),
      ),
      centerTitle: false,
      backgroundColor: const Color.fromARGB(255, 112, 119, 249),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  /// Content For Each Drawer Item
  Widget _getContentForState(NavItem selectedItem) {
    switch (selectedItem) {
      case NavItem.homeView:
        return const HomeView();
      case NavItem.profileView:
        return const ProfileView();
      case NavItem.orderView:
        return const OrderView();
      case NavItem.cartView:
        return const CartView();
      default:
        return Container();
    }
  }

  /// Get AppBar Title For Each Drawer Item
  String _getAppBarTitle(NavItem selectedItem) {
    switch (selectedItem) {
      case NavItem.homeView:
        return "Home";
      case NavItem.profileView:
        return "Profile";
      case NavItem.orderView:
        return "Orders";
      case NavItem.cartView:
        return "Cart";
      default:
        return "Navigation Drawer Demo";
    }
  }
}
