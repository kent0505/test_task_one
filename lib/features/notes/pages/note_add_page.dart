import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/note.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/actions/custom_appbar.dart';
import '../../../core/widgets/buttons/ico_button.dart';
import '../../../core/widgets/listview/custom_listview.dart';
import '../../../core/widgets/textfields/title_field.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../bloc/note_bloc.dart';
import '../widgets/date_and_time.dart';

class NoteAddPage extends StatefulWidget {
  const NoteAddPage({super.key});

  @override
  State<NoteAddPage> createState() => _NoteAddPageState();
}

class _NoteAddPageState extends State<NoteAddPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  bool pinned = false;

  void onPin() {
    setState(() {
      pinned = !pinned;
    });
  }

  void onAdd() {
    context.read<NoteBloc>().add(
          AddNoteEvent(
            note: Note(
              id: getCurrentTimestamp(),
              title: controller1.text,
              description: controller2.text,
              pinned: pinned,
            ),
          ),
        );
    context.pop();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            actions: [
              IcoButton(
                icon: pinned ? Icons.star_rounded : Icons.star_outline_rounded,
                onPressed: onPin,
              ),
            ],
          ),
          CustomListView(
            children: [
              const SizedBox(height: 20),
              const DateAndTime(),
              const SizedBox(height: 20),
              TitleField(controller: controller1),
              TxtField(controller: controller2),
              const SizedBox(height: 60),
            ],
          ),
        ],
      ),
      floatingActionButton: IcoButton(
        icon: Icons.save,
        color: AppColors.accent,
        onPressed: onAdd,
      ),
    );
  }
}
