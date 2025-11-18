import 'app_states.dart';
import '../../../../const/data.dart';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../data/repo/layout_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/customer_state_model.dart';
import '../../../splash/data/models/data_model.dart';
import '../../../splash/data/models/machine_model.dart';
import '../../../splash/data/models/customer_model.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());
  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);
  final FocusNode myFocusNode = FocusNode();
  DataModel userData = DataModel.empty();
  var theme = ThemeMode.light;
  List<CustomerStatesModel> machineStates({required S s}) {
    return [
      CustomerStatesModel(id: 0, title: s.printed, color: 0xFF2196F3),
      CustomerStatesModel(id: 1, title: s.working, color: 0xFF4CAF50),
      CustomerStatesModel(id: 2, title: s.finished, color: 0xFFF44336),
    ];
  }

  // Set App Data
  void setUserData({required DataModel model}) {
    userData = model;
    theme = model.themeMode == "Light" ? ThemeMode.light : ThemeMode.dark;
    emit(SetState());
  }

  int getMachineIndexById({required int id}) {
    return userData.machines.indexWhere((element) => element.id == id);
  }

  int getCustomerIndexById({required int id, required int machineIndex}) {
    return userData.machines[machineIndex].customers.indexWhere(
      (element) => element.id == id,
    );
  }

  // Search
  bool searchOpen = false;
  List<int> searchMachines = [];
  final FocusNode focusNode = FocusNode();
  List<Map<int, int>> searchCustomers = [];
  var searchValue = TextEditingController();

  void searchChange({required String value}) {
    if (value.isEmpty) {
      if (searchOpen) {
        searchOpen = false;
        emit(SetState());
      }
    } else {
      if (!searchOpen) {
        searchOpen = true;
        emit(SetState());
      }
    }
  }

  void resetSearch() {
    if (searchOpen) {
      searchOpen = false;
      searchValue.clear();
      emit(SetState());
    }
  }

  void generalSearch() {
    String value = searchValue.text.trim();
    searchChange(value: value);
    searchMachines = [];
    searchCustomers = [];
    var machines = userData.machines;
    for (var i = 0; i < machines.length; i++) {
      var machine = machines[i];
      if (machine.title.toLowerCase().trim().contains(value.toLowerCase())) {
        searchMachines.add(i);
      }
      for (var j = 0; j < machine.customers.length; j++) {
        var customer = machines[i].customers[j];
        if (customer.title.toLowerCase().trim().contains(value.toLowerCase())) {
          searchCustomers.add({i: j});
        }
      }
    }
    emit(SetState());
  }

  void CustomersSearch({required int MachineId}) {
    String value = searchValue.text.trim();
    searchChange(value: value);
    searchCustomers = [];
    var index = getMachineIndexById(id: MachineId);
    var customers = userData.machines[index].customers;

    for (var i = 0; i < customers.length; i++) {
      var customer = customers[i];
      if (customer.title.toLowerCase().trim().contains(
        value.toLowerCase().trim(),
      )) {
        searchCustomers.add({index: i});
      }
    }
    emit(SetState());
  }

  // Add Data
  bool isLoading = false;
  bool emptyAddData = true;
  var addTitle = TextEditingController();
  var addValue = TextEditingController();
  var addState = 0;

  void resetAddData() {
    addState = 0;
    addTitle.clear();
    addValue.clear();
    emptyAddData = true;
  }

  void checkValidate({required bool isAddMachine}) {
    if (isAddMachine) {
      addMachineValidate(value: addTitle.text);
    } else {
      addCustomerValidate(
        title: addTitle.text,
        value: int.tryParse(addValue.text) ?? 0,
      );
    }
  }

  // Machine

  void addMachineValidate({required String value}) {
    if (value.isEmpty) {
      if (!emptyAddData) {
        emptyAddData = true;
        emit(SetState());
      }
    } else {
      if (emptyAddData) {
        emptyAddData = false;
        emit(SetState());
      }
    }
  }

  Future<void> addMachine() async {
    isLoading = true;
    emit(LoadingState());
    var data = await LayoutRepoImpl().newMachine(title: addTitle.text);
    data.fold(
      (l) {
        isLoading = false;
        emit(FailureState(errorMessage: l.errMessage));
      },
      (r) {
        userData = r;
        isLoading = false;
        emit(SuccessState());
      },
    );
  }

  Future<void> removeMachine({required Machine machine}) async {
    isLoading = true;
    emit(LoadingState());
    var index = getMachineIndexById(id: machine.id);
    var data = await LayoutRepoImpl().removeMachine(machine: machine);
    data.fold(
      (l) {
        isLoading = false;
        emit(FailureState(errorMessage: l.errMessage));
      },
      (r) {
        userData = r;
        searchMachines.removeWhere((r) => r == index);
        searchCustomers.removeWhere((element) {
          var key = element.keys.first;
          return key == index;
        });
        isLoading = false;
        emit(SuccessState());
      },
    );
  }

  // Add Customer

  void addCustomerValidate({required String title, required int value}) {
    if (title.isEmpty || value == 0) {
      if (!emptyAddData) {
        emptyAddData = true;
        emit(SetState());
      }
    } else {
      if (emptyAddData) {
        emptyAddData = false;
        emit(SetState());
      }
    }
  }

  void changeAddStates({required int index}) {
    checkValidate(isAddMachine: false);
    addState = index;
    emit(SetState());
  }

  void setEditData({required Customer customer}) {
    addTitle.text = customer.title;
    addValue.text = customer.quantity.toString();
    addState = customer.state;
  }

  Future<void> addCustomer({required machineId}) async {
    isLoading = true;
    emit(LoadingState());
    int? quantity = int.tryParse(addValue.text);
    var data = await LayoutRepoImpl().newCustomer(
      machineId: machineId,
      title: addTitle.text,
      quantity: quantity ?? 0,
      state: addState,
    );
    data.fold(
      (l) {
        isLoading = false;
        emit(FailureState(errorMessage: l.errMessage));
      },
      (r) {
        userData = r;
        isLoading = false;
        emit(SuccessState());
      },
    );
  }

  Future<void> deletCustomers({required machineId, required CustomerId}) async {
    isLoading = true;
    emit(LoadingState());
    var machineIndex = getMachineIndexById(id: machineId);
    var customerIndex = getCustomerIndexById(
      id: CustomerId,
      machineIndex: machineIndex,
    );

    var data = await LayoutRepoImpl().removeCustomer(
      machineId: machineId,
      customerId: CustomerId,
    );
    data.fold(
      (l) {
        isLoading = false;
        emit(FailureState(errorMessage: l.errMessage));
      },
      (r) {
        userData = r;
        isLoading = false;
        searchCustomers.removeWhere((element) {
          var key = element.keys.first;
          var values = element.values.first;
          return key == machineIndex && values == customerIndex;
        });
        emit(SuccessState());
      },
    );
  }

  Future<void> editCustomers({
    required int machineId,
    required int customerId,
  }) async {
    isLoading = true;
    emit(LoadingState());
    int? quantity = int.tryParse(addValue.text);
    var data = await LayoutRepoImpl().editCustomer(
      machineId: machineId,
      customerId: customerId,
      title: addTitle.text,
      quantity: quantity ?? 0,
      state: addState,
    );
    data.fold(
      (l) {
        isLoading = false;
        emit(FailureState(errorMessage: l.errMessage));
      },
      (r) {
        userData = r;
        isLoading = false;
        emit(SuccessState());
      },
    );
  }

  // Change Theme

  Future<void> changeTheme() async {
    bool isLight = userData.themeMode == lightTheme;
    isLoading = true;
    emit(LoadingState());
    var data = await LayoutRepoImpl().changeTheme(
      theme: isLight ? darkTheme : lightTheme,
    );
    data.fold(
      (l) {
        isLoading = false;
        emit(FailureState(errorMessage: l.errMessage));
      },
      (r) {
        userData = r;
        theme = isLight ? ThemeMode.dark : ThemeMode.light;
        isLoading = false;
        emit(SetState());
      },
    );
  }

  Future<void> changeLang() async {
    bool isAr = userData.lang == arCode;
    isLoading = true;
    emit(LoadingState());
    var data = await LayoutRepoImpl().changeLang(lang: isAr ? enCode : arCode);
    data.fold(
      (l) {
        isLoading = false;
        emit(FailureState(errorMessage: l.errMessage));
      },
      (r) {
        userData = r;
        isLoading = false;
        emit(SetState());
      },
    );
  }
}
