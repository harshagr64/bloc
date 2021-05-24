class DataModel {
  final String email;

  DataModel(
    this.email,
  );

 factory DataModel.setData(String emailId) => DataModel(emailId);
}
