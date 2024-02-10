import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapp/feature/prompt/repository/prompt_repository.dart';
part 'prompt_event.dart';
part 'prompt_state.dart';

class PromptBloc extends Bloc<PromptEvent, PromptState> {
  PromptBloc() : super(PromptInitial()) {
    on<PromptEnteredEvent>(promptEnteredEvent);
    on<PromptEventInitial>(promptEventInitial);
  }

  FutureOr<void> promptEnteredEvent(
      PromptEnteredEvent event, Emitter<PromptState> emit) async {
    emit(PromptGeneratingImageLoadingState());
    File? file = await PromptRepository.generateImage(event.prompt);
    if (file != null) {
      emit(PromptGeneratingSuccessState(file: file));
    } else {
      emit(PromptGeneratingErrorState());
    }
  }

  FutureOr<void> promptEventInitial(
      PromptEventInitial event, Emitter<PromptState> emit) {
    emit(PromptInitial(lottiePath:'assets/lottie/ai.json' ));
  }
}
