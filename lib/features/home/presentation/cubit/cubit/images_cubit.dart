import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:integrated_todo/features/home/data/data_model/images_datamodel.dart';
import 'package:integrated_todo/features/home/data/data_model/images_response_model.dart';
import 'package:integrated_todo/features/home/domain/repository/images_repository.dart';

part 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  final ImagesRepository imagesRepository;
  bool isFetching = false; // ✅ synchronous lock

  ImagesCubit({required this.imagesRepository}) : super(ImagesState.initial());

  Future<void> getAndSetImages({bool isPaginating = false}) async {
    print("called a");

    if (isFetching) return; // ✅ checked synchronously before any await
    if (!state.isNextPage) return;

    isFetching = true; // ✅ set immediately — no await before this

    try {
      if (isPaginating) {
        emit(state.copyWith(isPaginationLoading: true));
      } else {
        emit(state.copyWith(isInitialLoading: true));
      }

      final response = await imagesRepository.fetchImages(
        page: state.currentPage,
        pageSize: 20,
      );

      emit(
        state.copyWith(
          currentPage: response.currentPage + 1,
          imagesList: [...state.imagesList, ...response.dataResult],
          isInitialLoading: false,
          isPaginationLoading: false,
          isNextPage: response.isNextPage,
        ),
      );

      print("called b");
    } catch (e) {
      emit(state.copyWith(isInitialLoading: false, isPaginationLoading: false));
    } finally {
      isFetching = false; // ✅ always release the lock
    }
  }
}
