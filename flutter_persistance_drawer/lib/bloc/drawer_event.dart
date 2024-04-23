import 'package:equatable/equatable.dart';

import 'nav_drawer_state.dart';

sealed class NavDrawerEvent extends Equatable {
  const NavDrawerEvent();
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

class NavigateTo extends NavDrawerEvent {
  final NavItem destination;

  const NavigateTo(this.destination);

  @override
  List<Object?> get props => [
        destination,
      ];
}
