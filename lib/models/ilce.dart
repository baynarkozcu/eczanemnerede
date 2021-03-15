class Ilce {
  bool success;
  List<Result> result;

  Ilce({this.success, this.result});

  Ilce.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['result'] != null) {
      result = new List<Result>();
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String text;
  String pharmacyNumber;

  Result({this.text, this.pharmacyNumber});

  Result.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    pharmacyNumber = json['pharmacy_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['pharmacy_number'] = this.pharmacyNumber;
    return data;
  }
}
