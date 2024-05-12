import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/home/widgets/note_card.dart';
import '../../config/app_colors.dart';
import '../../models/note.dart';
import '../../utils.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    this.children = const [],
    this.notes = const [],
  });

  final List<Widget> children;
  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch(
          accentColor: AppColors.main,
        ),
      ),
      child: notes.isEmpty
          ? Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: children,
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return NoteCard(
                  note: sortNotes(notes)[index],
                  onPressed: () {
                    context.push('/note_edit', extra: sortNotes(notes)[index]);
                  },
                );
              },
            ),
    );
  }
}
