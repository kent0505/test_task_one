import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/app_colors.dart';
import '../../core/widgets/actions/custom_appbar.dart';
import '../../core/widgets/buttons/ico_button.dart';
import '../../core/widgets/listview/custom_listview.dart';
import '../note/bloc/note_bloc.dart';
import 'bloc/home_bloc.dart';
import 'drawer/drawer_widget.dart';
import 'drawer/end_drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      endDrawer: const EndDrawerWidget(),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return CustomAppBar(
                title: 'Dark Diary',
                home: true,
                search: state is HomeSearchState,
                actions: [
                  IcoButton(
                    icon: Icons.filter_list_rounded,
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                  IcoButton(
                    icon: Icons.search_rounded,
                    onPressed: () {
                      context.read<HomeBloc>().add(HomeSearchEvent());
                    },
                  ),
                ],
              );
            },
          ),
          Expanded(
            child: BlocBuilder<NoteBloc, NoteState>(
              builder: (context, state) {
                if (state is NotesLoadedState) {
                  if (state.notes.isEmpty) {
                    return const Center(
                      child: Text(
                        'Заметок нету',
                        style: TextStyle(
                          color: AppColors.title,
                        ),
                      ),
                    );
                  }

                  return CustomListView(notes: state.notes);
                }

                return Container();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: IcoButton(
        icon: Icons.edit_rounded,
        color: AppColors.accent,
        onPressed: () {
          context.push('/note_add');
        },
      ),
    );
  }
}
