part of 'note_bloc.dart';

abstract class NoteState {}

class NoteInitial extends NoteState {}

class NotesLoadedState extends NoteState {
  final List<Note> notes;
  NotesLoadedState({required this.notes});
}
