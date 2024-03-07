abstract class SuperstateApp {}

class InitialStateApp extends SuperstateApp {}

class IndexStateChange extends SuperstateApp {
  int? index;
  IndexStateChange(this.index);
}

class CreateDataBaseState extends SuperstateApp {}

class IInsertDataBaseState extends SuperstateApp {}

class GetDataBaseState extends SuperstateApp {}

class ButtonShowstate extends SuperstateApp {}

class UpdateDataBaseState extends SuperstateApp {}

class DeleteElementDatabaseState extends SuperstateApp {}
