class Menu_opts {
  String ruta;
  String icon;
  String texto;
  Menu_opts({
    this.ruta = "",
    this.icon = "",
    this.texto = "",
  });

  factory Menu_opts.fromJson(Map<String, dynamic> json) {
    return Menu_opts(
      ruta: json['ruta'],
      icon: json['icon'],
      texto: json['texto'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ruta'] = this.ruta;
    data['icon'] = this.icon;
    data['texto'] = this.texto;

    return data;
  }
}
