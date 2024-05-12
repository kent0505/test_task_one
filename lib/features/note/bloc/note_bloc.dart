import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/note.dart';
import '../../../core/utils.dart';
import '../note_service.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final _service = NoteService();
  List<Note> _notes = [];

  NoteBloc() : super(NoteInitial()) {
    // GET NOTES
    on<GetNotesEvent>((event, emit) async {
      if (_service.notes.isEmpty) {
        _notes = await _service.getNotes();
        emit(NotesLoadedState(notes: _notes));
      } else {
        emit(NotesLoadedState(notes: _notes));
      }
    });

    // ADD NOTE
    on<AddNoteEvent>((event, emit) async {
      if (event.note.title.isNotEmpty || event.note.description.isNotEmpty) {
        _service.notes.add(event.note);
        _notes = await _service.updateNotes();
        emit(NotesLoadedState(notes: _notes));
      }
    });

    // EDIT NOTE
    on<EditNoteEvent>((event, emit) async {
      for (Note note in _service.notes) {
        if (note.id == event.note.id) {
          note.title = event.note.title;
          note.description = event.note.description;
          note.pinned = event.note.pinned;
        }
      }
      _notes = await _service.updateNotes();
      emit(NotesLoadedState(notes: _notes));
    });

    // DELETE NOTE
    on<DeleteNoteEvent>((event, emit) async {
      _service.notes.removeWhere((element) => element.id == event.id);
      _notes = await _service.updateNotes();
      emit(NotesLoadedState(notes: _notes));
    });

    // SORT NOTES
    on<SortNotesEvent>((event, emit) async {
      if (newFirst && event.newFirst || !newFirst && !event.newFirst) {
        return;
      }
      await saveBool('newFirst', event.newFirst);
      newFirst = event.newFirst;
      emit(NotesLoadedState(notes: _notes));
    });

    // SEARCH NOTES
    on<SearchNotesEvent>((event, emit) async {
      List<Note> suggestionList = event.text.isEmpty
          ? _service.notes
          : _service.notes.where((item) {
              return item.title
                      .toLowerCase()
                      .contains(event.text.toLowerCase()) ||
                  item.description
                      .toLowerCase()
                      .contains(event.text.toLowerCase());
            }).toList();
      emit(NotesLoadedState(notes: suggestionList));
    });
  }
}
