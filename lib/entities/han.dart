enum Han {
  huynhTuyen,
  tamKheo,
  nguHo,
  thienTinh,
  tanTan,
  thienLa,
  diaVong,
  diemVuong;

  static Han? coiHan({
    required int tuoi,
    required bool gioiTinh,
  }) {
    while (tuoi - 8 < 10) {
      tuoi -= 8;
    }
    if (gioiTinh == true) {
      switch (tuoi) {
        case 10:
          return Han.huynhTuyen;
        case 11:
          return Han.tamKheo;
        case 12:
          return Han.nguHo;
        case 13:
          return Han.thienTinh;
        case 14:
          return Han.tanTan;
        case 15:
          return Han.thienLa;
        case 16:
          return Han.diaVong;
        case 17:
          return Han.diemVuong;
      }
    } 
    return null;
  }
}
