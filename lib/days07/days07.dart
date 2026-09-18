import 'package:flutter/material.dart';
import 'package:flutter_30_days_plan/days07/PhotosModel.dart';
import 'package:flutter_30_days_plan/days07/bloc/photos_bloc.dart';
import 'package:flutter_30_days_plan/days07/bloc/photos_event.dart';
import 'package:flutter_30_days_plan/days07/bloc/photos_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Days07 extends StatefulWidget {
  const Days07({super.key});

  @override
  State<Days07> createState() => _Days07State();
}

class _Days07State extends State<Days07> {
  @override
  void initState() {
    super.initState();
    if (!context.mounted) return;
    context.read<PhotosBloc>().add(GetPhotosEvents());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api call using bloc")),
      body: SafeArea(
        child: BlocBuilder<PhotosBloc, PhotosState>(
          builder: (context, state) {
            if (state is PhotosLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PhotosFailureState) {
              return Center(child: Text(state.error.toString()));
            } else if (state is PhotosSuccessState) {
              return ListView.builder(
                itemCount: state.photosList.length,
                itemBuilder: (context, index) {
                  final PhotosModel model = state.photosList[index];
                  return Card(
                    color: Colors.white60,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: .start,
                        children: [
                          Text(model.albumId.toString()),
                          Text(model.id.toString()),
                          Text(model.title.toString()),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
