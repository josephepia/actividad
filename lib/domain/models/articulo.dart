class Articulo {
  final String idArticulo;
  final String detalle;
  final String marca;
  final String medida;
  final String cantBodega;
  final String foto;


  Articulo({
    required this.idArticulo,
    required this.detalle,
    required this.marca,
    required this.medida,
    required this.cantBodega,
    required this.foto

  });

  factory Articulo.desdeJson(Map<String, dynamic> json){
    return Articulo(
        idArticulo: json['idArticulo'] ?? '',
        detalle: json['detalle'] ?? '',
        marca: json['marca'] ?? '',
        medida: json['medida'] ?? '',
        cantBodega: json['cantBodega'] ?? '',
        foto: json['foto'] ?? ''

    );
  }
}