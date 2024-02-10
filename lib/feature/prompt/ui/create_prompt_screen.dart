import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/feature/prompt/bloc/prompt_bloc.dart';

class CreatePromptSceen extends StatefulWidget {
  const CreatePromptSceen({super.key});

  @override
  State<CreatePromptSceen> createState() => _CreatePromptSceenState();
}

class _CreatePromptSceenState extends State<CreatePromptSceen> {
  final PromptBloc _promptBloc = PromptBloc();
  @override
  void initState() {
    _promptBloc.add(PromptEventInitial());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Generate AI Images",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            BlocConsumer<PromptBloc, PromptState>(
              bloc: _promptBloc,
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                switch (state.runtimeType) {
                  case PromptInitial:
                    final initialState = state as PromptInitial;
                    return Container(
                      width: double.infinity,
                      child: LottieBuilder.asset(initialState.lottiePath!),
                    );

                  case PromptGeneratingImageLoadingState:
                    return const Center(
                      child: Text("Lotte"),
                    );

                  case PromptGeneratingErrorState:
                    return const Center(
                      child: Text("Error"),
                    );
                  case PromptGeneratingSuccessState:
                    return const Center(
                      child: Text("Success"),
                    );
                  default:
                    return const Center(
                      child: Text("initial"),
                    );
                }
              },
            ),
            Container(
              height: 240,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text("Enter your image"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Enter your prompt",
              ),
            ),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.generating_tokens),
                label: const Text("Generate"))
          ],
        ),
      ),
    );
  }
}
