

class FormModel {

  String? name;
  var budget;
  String? type;
  dynamic optionListOne;
  dynamic optionListTow;
  var status;

  FormModel({

    required this.name,
    required this.budget,
    required this.type,
    required this.optionListOne,
    required this.optionListTow,
    required this.status,

  });
  FormModel.fromMap(dynamic json) {
    name = json['name'];
    budget = json['budget'];
    type = json['type'];
    optionListOne =json['optionListOne'];
    optionListTow =json['optionListTow'];
    status = json['status']+0.0;
  }





  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};

    map['name'] = name;
    map['budget'] = budget;
    map['type'] = type;
    if (optionListOne != null) {
      map['optionListOne'] = optionListOne!.map((v) => v.toJson()).toList();
    }
    if (optionListTow != null) {
      map['optionListTow'] = optionListTow!.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    return map;
  }

}
