import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/note.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/actions/custom_appbar.dart';
import '../../../core/widgets/actions/dialog_widget.dart';
import '../../../core/widgets/buttons/ico_button.dart';
import '../../../core/widgets/textfields/title_field.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../bloc/note_bloc.dart';

class NoteEditPage extends StatefulWidget {
  const NoteEditPage({super.key, required this.note});

  final Note note;

  @override
  State<NoteEditPage> createState() => _NoteEditPageState();
}

class _NoteEditPageState extends State<NoteEditPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  bool pinned = false;

  void onPin() {
    setState(() {
      pinned = !pinned;
    });
  }

  void onDelete() {
    context.read<NoteBloc>().add(DeleteNoteEvent(id: widget.note.id));
    context.pop();
  }

  void onEdit() {
    context.read<NoteBloc>().add(
          EditNoteEvent(
            note: Note(
              id: widget.note.id,
              title: controller1.text,
              description: controller2.text,
              pinned: pinned,
            ),
          ),
        );
    context.pop();
  }

  @override
  void initState() {
    super.initState();
    controller1.text = widget.note.title;
    controller2.text = widget.note.description;
    pinned = widget.note.pinned;
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
              IcoButton(
                icon: Icons.delete_rounded,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DialogWidget(
                        title: 'Удалить заметку?',
                        yesText: 'УДАЛИТЬ',
                        onPressed: onDelete,
                      );
                    },
                  );
                },
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    _DateText(formatDate(widget.note.id)),
                    const Spacer(),
                    _DateText(formatTime(widget.note.id)),
                  ],
                ),
                const SizedBox(height: 20),
                TitleField(controller: controller1),
                TxtField(controller: controller2),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: IcoButton(
        icon: Icons.save,
        color: AppColors.accent,
        onPressed: onEdit,
      ),
    );
  }
}

class _DateText extends StatelessWidget {
  const _DateText(this.date);

  final String date;

  @override
  Widget build(BuildContext context) {
    return Text(
      date,
      style: const TextStyle(
        color: AppColors.date,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
