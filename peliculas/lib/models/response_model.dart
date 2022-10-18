class ServiceResponse {
  late int code;
  late String? error;
  late dynamic data;

  ServiceResponse.error(this.code, this.error);

  ServiceResponse.success(this.code, this.error, this.data);
}
