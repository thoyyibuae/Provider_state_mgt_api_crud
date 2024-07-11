import 'package:flutter/foundation.dart';
import 'package:flutter_provider_api/src/model/task_model.dart';
import 'package:flutter_provider_api/src/repository/api_repository.dart';

class TaskProvider with ChangeNotifier {

  TaskProvider(){
    getTasks();
  }

  final List<TaskModel> _tasks = [];

  List<TaskModel> get tasks => _tasks;
  final ApiRepository _apiRepository =ApiRepository();

  Future<List<TaskModel>?> getTasks() async {

    final mList = await _apiRepository.fetchApiList();


    _tasks.addAll(mList??[]);

    notifyListeners();
    return mList;

  }


  Future<void> onAddTask(TaskModel task)

  async {


    final tsk = await _apiRepository.addTask(task);

    _tasks.add(tsk!);


    print("Added task is :${tsk.toJson()}");


  notifyListeners();



  }


  Future<void> onUpdateTask(TaskModel task)

  async {



    print("update 114 The given id is : ${task.toJson()}");




    final update  = await _apiRepository.updateTask(task);


    print("the given updated data is:129");
    print(update?.toJson());

    final int index = _tasks.indexWhere((item) => item.id == task.id);

    _tasks.removeWhere((item) => item.id == task.id);
    _tasks.insert(index, update!);
    //

    print("The given index is : ${index}");
    // return;

    notifyListeners();
  }


  Future<void> onDeleteTask(TaskModel task)

  async {



    print("update 114 The given id is : ${task.toJson()}");




    final update  = await _apiRepository.removeTask(task);


    print("the given updated data is:129");
    print(update?.toJson());

    final int index = _tasks.indexWhere((item) => item.id == task.id);

    _tasks.removeAt(index);

    print("The given index is : ${index}");
    // return;

    notifyListeners();
  }


// on<LoadTask>((event, emit) async {
  // try {
  //
  // emit(TaskLoading());

  // final mList = await _apiRepository.fetchApiList();
  //
  // print("the m list is");
  // mList?.forEach((element) {
  //
  // print(element.taskName);
  // // emit(TaskState(
  // //   allTasks: (AddTask(task: element)
  // // ));
  // });
  // print("the m list is");
  // // final mList = await _apiRepository.fetchProductList();
  // // emit(TaskLoaded(responseModel: mList));
  //
  // emit(TaskState(
  // allTasks: mList,
  // ));
  // // emit(ProductLoaded(mList));
  //
  //
  // // if (mList?.error != null)
  // // {
  // //   emit(ProductError(mList.error));
  // // }
  // // else{
  // //
  // // }
  //
  //
  // } on NetworkError {
  // emit(
  // TaskError(error: "Failed to fetch data. is your device online ?"));
  // }
  // });
  //
  // on<AddTask>(_onAddTask);
  //
  // on<UpdateTask>(_onUpdateTask);
  //
  // on<DeleteTask>(_onDeleteTask);
  // // on<LoadTask>(_onLoadTask);


  }


