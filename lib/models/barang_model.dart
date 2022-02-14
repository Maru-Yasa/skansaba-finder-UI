class BarangModel {
  int? id;
  String? nama;
  String? keterangan;
  String? gambar;
  String? status;
  String? tanggal;
  int? userId;
  String? createdAt;
  String? updatedAt;

  BarangModel(
      {this.id,
      this.nama,
      this.keterangan,
      this.gambar,
      this.status,
      this.tanggal,
      this.userId,
      this.createdAt,
      this.updatedAt});

  BarangModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    keterangan = json['keterangan'];
    gambar = json['gambar'];
    status = json['status'];
    tanggal = json['tanggal'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['keterangan'] = this.keterangan;
    data['gambar'] = this.gambar;
    data['status'] = this.status;
    data['tanggal'] = this.tanggal;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
