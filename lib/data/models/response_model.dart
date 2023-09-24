class ResponseModel {
  final int statusCode;
  final bool isSuccess;
  final dynamic returndata;

  ResponseModel(
      {required this.isSuccess,
      required this.statusCode,
      required this.returndata});
}
