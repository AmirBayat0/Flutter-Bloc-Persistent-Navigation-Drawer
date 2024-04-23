import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_persistance_drawer/bloc/drawer_event.dart';
import 'package:flutter_persistance_drawer/bloc/nav_drawer_bloc.dart';
import 'package:flutter_persistance_drawer/bloc/nav_drawer_state.dart';
import 'package:iconly/iconly.dart';

class _NavigationItem {
  final NavItem item;
  final String title;
  final IconData icon;

  _NavigationItem(this.item, this.title, this.icon);
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

class NavDrawerWidget extends StatelessWidget {
  NavDrawerWidget({super.key});

  /// Drawer Items
  final List<_NavigationItem> _listItems = [
    _NavigationItem(
      NavItem.homeView,
      "Home",
      IconlyBold.home,
    ),
    _NavigationItem(
      NavItem.profileView,
      "Profile",
      IconlyBold.profile,
    ),
    _NavigationItem(
      NavItem.orderView,
      "Orders",
      IconlyBold.category,
    ),
    _NavigationItem(
      NavItem.cartView,
      "Cart",
      IconlyBold.bag_2,
    ),
  ];

  @override
  Widget build(BuildContext context) => Drawer(
        child: Column(
          children: [
            /// Header
            const UserAccountsDrawerHeader(
              accountName: Text(
                'FlexZ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text('amirBayat.dev@gmail',
                  style: TextStyle(color: Colors.white)),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://blog.sebastiano.dev/content/images/2019/07/1_l3wujEgEKOecwVzf_dqVrQ.jpeg'))),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/91388754?v=4'),
              ),
            ),

            /// Items
            ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _listItems.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) =>
                  BlocBuilder<NavDrawerBloc, NavDrawerState>(
                builder: (BuildContext context, NavDrawerState state) =>
                    _buildItem(_listItems[index], state),
              ),
            ),
          ],
        ),
      );

  /// Build Each Drawer Item
  Widget _buildItem(_NavigationItem data, NavDrawerState state) =>
      _makeListItem(data, state);

  /// Each Drawer Item
  Widget _makeListItem(_NavigationItem data, NavDrawerState state) => Card(
        color: Colors.grey[100],
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        borderOnForeground: true,
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Builder(
          builder: (BuildContext context) => ListTile(
            title: Text(
              data.title,
              style: TextStyle(
                fontWeight: data.item == state.selectedItem
                    ? FontWeight.bold
                    : FontWeight.w300,
                color: data.item == state.selectedItem
                    ? const Color.fromARGB(255, 112, 119, 249)
                    : Colors.grey[600],
              ),
            ),
            leading: Icon(
              data.icon,
              color: data.item == state.selectedItem
                  ? const Color.fromARGB(255, 112, 119, 249)
                  : Colors.grey[600],
            ),
            onTap: () => _handleItemClick(context, data.item),
          ),
        ),
      );

  /// Tap OnEach item Handler
  void _handleItemClick(BuildContext context, NavItem item) {
    BlocProvider.of<NavDrawerBloc>(context).add(NavigateTo(item));
    Navigator.pop(context);
  }
}
