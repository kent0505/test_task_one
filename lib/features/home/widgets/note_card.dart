import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/note.dart';
import '../../../core/utils.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.note,
    required this.onPressed,
  });

  final Note note;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 68,
            width: 50,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    formatToDay(note.id),
                    style: const TextStyle(
                      color: AppColors.desc,
                      fontSize: 34,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    formatToWeekday(note.id),
                    style: const TextStyle(
                      color: AppColors.date,
                      fontSize: 14,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    formatToMonth(note.id),
                    style: const TextStyle(
                      color: AppColors.date,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              children: [
                if (note.title.isNotEmpty && note.description.isNotEmpty) ...[
                  _CardButton(
                    note: note,
                    height: 94,
                    onPressed: onPressed,
                  ),
                ] else if (note.title.isNotEmpty &&
                    note.description.isEmpty) ...[
                  _CardButton(
                    note: note,
                    height: 68,
                    onPressed: onPressed,
                  ),
                ] else ...[
                  _CardButton(
                    note: note,
                    height: 68,
                    onPressed: onPressed,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CardButton extends StatelessWidget {
  const _CardButton({
    required this.note,
    required this.height,
    required this.onPressed,
  });

  final Note note;
  final double height;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          Container(
            height: height,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: AppColors.main.withOpacity(0.7),
                  blurRadius: 1,
                  offset: const Offset(-0.5, 1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (note.title.isNotEmpty) ...[
                      Expanded(
                        child: Text(
                          note.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.title,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Merriweather',
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                    ]
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  note.description,
                  maxLines: 3,
                  style: const TextStyle(
                    color: AppColors.desc,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: SizedBox(
              width: 30,
              height: 30,
              child: note.pinned
                  ? const Icon(
                      Icons.star_rounded,
                      color: AppColors.accent,
                    )
                  : Container(),
            ),
          ),
        ],
      ),
    );
  }
}
