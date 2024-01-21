import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chatbloc_event.dart';
part 'chatbloc_state.dart';

class ChatblocBloc extends Bloc<ChatblocEvent, ChatblocState> {
  ChatblocBloc() : super(ChatblocInitial()) {
    on<ChatblocEvent>((event, emit) {
    });
  }
}
