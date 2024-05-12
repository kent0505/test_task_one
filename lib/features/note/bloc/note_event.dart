part of 'note_bloc.dart';

abstract class NoteEvent {}

class GetNotesEvent extends NoteEvent {}

class AddNoteEvent extends NoteEvent {
  final Note note;
  AddNoteEvent({required this.note});
}

class EditNoteEvent extends NoteEvent {
  final Note note;
  EditNoteEvent({required this.note});
}

class DeleteNoteEvent extends NoteEvent {
  final String id;
  DeleteNoteEvent({required this.id});
}

class SortNotesEvent extends NoteEvent {
  final bool newFirst;
  SortNotesEvent({required this.newFirst});
}

class SearchNotesEvent extends NoteEvent {
  final String text;
  SearchNotesEvent({required this.text});
}
