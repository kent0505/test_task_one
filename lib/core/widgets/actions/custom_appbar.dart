import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../features/home/bloc/home_bloc.dart';
import '../../../features/note/bloc/note_bloc.dart';
import '../../config/app_colors.dart';
import '../buttons/ico_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.title = '',
    this.actions = const [],
    this.home = false,
    this.search = false,
    this.onClose,
  });

  final String title;
  final List<Widget> actions;
  final bool home;
  final bool search;
  final void Function()? onClose;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).viewPadding.top,
            color: AppColors.main,
          ),
          Container(
            height: 56,
            color: AppColors.main,
            child: Row(
              children: [
                if (search) ...[
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(20),
                      ],
                      style: const TextStyle(
                        color: AppColors.title,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Поиск',
                        hintStyle: TextStyle(
                          color: AppColors.desc,
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        context
                            .read<NoteBloc>()
                            .add(SearchNotesEvent(text: value));
                      },
                    ),
                  ),
                  IcoButton(
                    icon: Icons.close_rounded,
                    onPressed: () {
                      context.read<NoteBloc>().add(GetNotesEvent());
                      context.read<HomeBloc>().add(ExitSearchEvent());
                    },
                  )
                ] else ...[
                  IcoButton(
                    icon: home ? Icons.menu_rounded : Icons.arrow_back_rounded,
                    onPressed: () {
                      if (home) {
                        Scaffold.of(context).openDrawer();
                      } else {
                        context.pop();
                      }
                    },
                  ),
                  const SizedBox(width: 16),
                  title.isNotEmpty
                      ? Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : Container(),
                  const Spacer(),
                  ...actions,
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
//   const CustomAppBar2({
//     super.key,
//     this.title,
//     this.leading = true,
//     this.actions,
//     this.backgroundColor,
//     this.elevation,
//   });

//   final Widget? title;
//   final bool leading;
//   final List<Widget>? actions;
//   final Color? backgroundColor;
//   final double? elevation;

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: title,
//       leading: leading
//           ? IcoButton(
//               icon: Icons.arrow_back_rounded,
//               color: Colors.transparent,
//               onPressed: () {
//                 context.pop();
//               },
//             )
//           : null,
//       actions: actions,
//       backgroundColor: backgroundColor,
//       elevation: elevation,
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(56);
// }
