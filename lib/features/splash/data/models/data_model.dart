import 'machine_model.dart';
import 'package:hive/hive.dart';
import '../../../../const/data.dart';

part 'data_model.g.dart';

@HiveType(typeId: 0)
class DataModel extends HiveObject {
  @HiveField(0)
  final String lang;

  @HiveField(1)
  final String themeMode;

  @HiveField(2)
  final List<Machine> machines;

  DataModel({
    required this.lang,
    required this.themeMode,
    required this.machines,
  });

  factory DataModel.empty() {
    return DataModel(lang: arCode, themeMode: darkTheme, machines: []);
  }

  DataModel copy({String? lang, String? themeMode, List<Machine>? machines}) {
    return DataModel(
      lang: lang ?? this.lang,
      themeMode: themeMode ?? this.themeMode,
      machines: machines ?? this.machines,
    );
  }

  DataModel newMachine({required String title}) {
    final int newId = machines.isNotEmpty ? machines.last.id + 1 : 0;
    final Machine newMachine = Machine.newMachine(id: newId, title: title);
    machines.add(newMachine);
    return DataModel(lang: lang, themeMode: themeMode, machines: machines);
  }

  DataModel deleteMachine({required Machine machine}) {
    machines.removeWhere((m) => m.id == machine.id);
    return DataModel(lang: lang, themeMode: themeMode, machines: machines);
  }

  DataModel editMachine({required Machine editMachine}) {
    final List<Machine> newMachines = List.from(machines);
    for (int i = 0; i < newMachines.length; i++) {
      if (newMachines[i].id == editMachine.id) {
        newMachines[i] = editMachine;
        break;
      }
    }
    return DataModel(lang: lang, themeMode: themeMode, machines: newMachines);
  }
}
