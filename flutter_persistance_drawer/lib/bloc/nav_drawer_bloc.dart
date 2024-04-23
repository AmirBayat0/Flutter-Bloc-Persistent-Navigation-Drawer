// nav_drawer_bloc.dart
import 'package:bloc/bloc.dart';
import 'drawer_event.dart';
import 'nav_drawer_state.dart';
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

class NavDrawerBloc extends Bloc<NavDrawerEvent, NavDrawerState> {
  NavDrawerBloc() : super(const NavDrawerState(NavItem.homeView)) {
    on<NavigateTo>(
      (event, emit) {
        if (event.destination != state.selectedItem) {
          emit(NavDrawerState(event.destination));
        }
      },
    );
  }
}
