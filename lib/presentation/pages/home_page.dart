import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/state/data_state.dart';
import '../../data/model/post_model.dart';
import '../blocs/cubit/post_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post"),
      ),
      body: BlocBuilder<PostCubit, DataState<List<PostModel>, String>>(
        builder: (context, state) {
          if (state.isInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isSuccess) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(state.data![index].id.toString()),
                  title: Text(state.data![index].title ?? ""),
                );
              },
              itemCount: state.data!.length,
            );
          } else if (state.isFailure) {
            return Center(
              child: Text(state.error!),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
