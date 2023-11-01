class DoctorModels {
  final String? doctorId;

  final String? fee;

  bool? paid;

  final bool? self;

  final String? slot;

  final String? userId;

  DoctorModels(
      {required this.doctorId,
      required this.fee,
      required this.self,
      required this.slot,
      required this.userId});

  toJson() {
    return {
      "doctorId": doctorId,
      "fee": fee,
      "self": self,
      "slot": slot,
      "userId": userId
    };
  }
}
