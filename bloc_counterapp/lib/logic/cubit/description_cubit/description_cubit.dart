import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'description_state.dart';

class DescriptionCubit extends Cubit<DescriptionState> {
  CollectionReference firestore =
      FirebaseFirestore.instance.collection("content");
  DescriptionCubit() : super(DescriptionState());

  // StreamBuilder stb = StreamBuilder(
  //   stream: FirebaseFirestore.instance
  //       .collection("content")
  //       .doc("fvXoCgt3kA1BCDlKMrFs")
  //       .snapshots(),
  //   builder: (context, snapshot) {
  //     return Container();
  //   },
  // );

  void snapshotHasData() {
    String snapshot = FirebaseFirestore.instance
        .collection("content")
        .doc("fvXoCgt3kA1BCDlKMrFs")
        .snapshots()
        .map((snapshot) => snapshot.data()["Ankur"])
        .toString();
    emit(DescriptionState(desc: snapshot));
  }

  void snapshotHasNoData() {}
}
