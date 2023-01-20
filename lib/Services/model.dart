class Factura {
  int? id;
  String date;
  String month;
  String year;
  String descrip;
  String monto;
  String? sueldoActual;

  Factura({
    this.id,
    required this.date,
    required this.month,
    required this.year,
    required this.descrip,
    required this.monto,
    sueldoActual,
  });

  factory Factura.fromJson(Map<String, dynamic> json) => Factura(
      id: json["CvFactura"],
      date: json["fecha"],
      month: json["mes"],
      year: json["ano"],
      descrip: json["descripcion"],
      monto: json["monto"],
      sueldoActual: json["sueldoActual"] ?? "0.0");

  Map<String, dynamic> toJson() => {
        "CvFactura": id,
        "fecha": date,
        "mes": month,
        "ano": year,
        "descripcion": descrip,
        "monto": monto
      };

  Map<String, dynamic> toMap() {
    return {
      'CvFactura': id,
      'fecha': date,
      'mes': month,
      'ano': year,
      'descripcion': descrip,
      'monto': monto,
      'sueldoActual': sueldoActual
    };
  }
}
