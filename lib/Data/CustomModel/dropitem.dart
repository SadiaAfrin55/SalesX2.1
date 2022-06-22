class DpItem{
  String name;
  String age;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  DpItem({
    required this.name,
    required this.age,
  });



  @override
  String toString() {
    return 'DpItem{name: $name, age: $age}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DpItem &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age);

  @override
  int get hashCode => name.hashCode ^ age.hashCode;

  factory DpItem.fromMap(Map<String, dynamic> map) {
    return new DpItem(
      name: map['name'] as String,
      age: map['age'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'name': this.name,
      'age': this.age,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}