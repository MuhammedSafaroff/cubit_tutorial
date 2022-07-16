import 'package:ders/data/model/album_model.dart';
import 'package:ders/presentation/blocs/album/cubit/album_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/state/data_state.dart';
import '../../data/model/post_model.dart';
import '../blocs/post/post_cubit.dart';

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
      body: Column(
        children: [
          BlocConsumer<AlbumCubit, DataState<AlbumModel, String>>(
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Successful"),
                behavior: SnackBarBehavior.floating,
              ));
            },
            builder: (context, state) {
              if (state.isInProgress) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: CircularProgressIndicator.adaptive(),
                  ),
                );
              } else if (state.isSuccess) {
                return ListTile(
                  leading: Text(
                    state.data!.id.toString(),
                    style: const TextStyle(color: Colors.indigo, fontSize: 25),
                  ),
                  title: Text(
                    state.data!.title.toString(),
                    style: const TextStyle(color: Colors.cyan, fontSize: 25),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          Expanded(
            child: BlocBuilder<PostCubit, DataState<List<PostModel>, String>>(
              builder: (context, state) {
                if (state.isInProgress) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state.isSuccess) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          context
                              .read<AlbumCubit>()
                              .fetchAlbum(state.data![index].id.toString());
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (_) => BlocProvider.value(
                          //       value: context.read<PostCubit>(),
                          //       child: const HomeDetails(),
                          //     ),
                          //   ),
                          // );
                        },
                        child: ListTile(
                          leading: Text(state.data![index].id.toString()),
                          title: Text(state.data![index].title ?? ""),
                        ),
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
          ),
        ],
      ),
    );
  }
}
