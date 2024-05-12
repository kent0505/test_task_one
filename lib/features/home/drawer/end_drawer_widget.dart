import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../notes/bloc/note_bloc.dart';

class EndDrawerWidget extends StatelessWidget {
  const EndDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      backgroundColor: AppColors.bg,
      child: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: MediaQuery.of(context).viewPadding.top),
              const _SettingsTitle(
                title: 'Сортировка',
                icon: Icons.filter_list_rounded,
              ),
              _RadioButton(
                title: 'Сначала новые',
                newFirst: newFirst,
                onPressed: () {
                  context.read<NoteBloc>().add(SortNotesEvent(newFirst: true));
                },
              ),
              _RadioButton(
                title: 'Сначала старые',
                newFirst: !newFirst,
                onPressed: () {
                  context.read<NoteBloc>().add(SortNotesEvent(newFirst: false));
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SettingsTitle extends StatelessWidget {
  const _SettingsTitle({
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: AppColors.card,
      child: Row(
        children: [
          const SizedBox(width: 10),
          Icon(
            icon,
            color: AppColors.title,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.title,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _RadioButton extends StatelessWidget {
  const _RadioButton({
    required this.title,
    required this.newFirst,
    required this.onPressed,
  });

  final String title;
  final bool newFirst;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          const SizedBox(width: 10),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: AppColors.bg,
              border: Border.all(
                color: newFirst ? AppColors.accent : AppColors.date,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: newFirst
                ? Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 10,
                      width: 10,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.accent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  )
                : Container(),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.date,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
