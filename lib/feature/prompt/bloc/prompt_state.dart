part of 'prompt_bloc.dart';

@immutable
sealed class PromptState {}

final class PromptInitial extends PromptState {
  final String? lottiePath;

  PromptInitial({this.lottiePath});
}

final class PromptGeneratingImageLoadingState extends PromptState {}

final class PromptGeneratingErrorState extends PromptState {}

final class PromptGeneratingSuccessState extends PromptState {
  final File file;

  PromptGeneratingSuccessState({required this.file});
}
