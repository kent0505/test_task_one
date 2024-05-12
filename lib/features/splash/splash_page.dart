import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils.dart';
import '../../core/widgets/actions/loading_widget.dart';
import '../note/bloc/note_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void _load() async {
    await getData().then((_) {
      context.read<NoteBloc>().add(GetNotesEvent());
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (pincode) {
        context.go('/pincode');
      } else {
        context.go('/home');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoadingWidget(),
    );
  }
}
