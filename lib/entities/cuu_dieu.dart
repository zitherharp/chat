import 'package:chat/entities/gioi_tinh.dart';

enum CuuDieu {
  laHau,
  thoTu,
  thuyDieu,
  thaiBach,
  thaiDuong,
  vanHan,
  keDo,
  thaiAm,
  mocDuc;

  String get name {
    switch (this) {
      case CuuDieu.laHau:
        return 'La Hầu';
      case CuuDieu.thoTu:
        return 'Thổ Tú';
      case CuuDieu.thuyDieu:
        return 'Thủy Diệu';
      case CuuDieu.thaiBach:
        return 'Thái Bạch';
      case CuuDieu.thaiDuong:
        return 'Thái Dương';
      case CuuDieu.vanHan:
        return 'Vân Hán';
      case CuuDieu.keDo:
        return 'Kế Đô';
      case CuuDieu.thaiAm:
        return 'Thái Âm';
      case CuuDieu.mocDuc:
        return 'Mộc Đức';
    }
  }

  String get lyTinh {
    switch (this) {
      case CuuDieu.laHau:
        return 'Sao chủ mồm miệng, cửa quan, tai mắt, máu huyết sản nạn buồn rầu.';
      case CuuDieu.thoTu:
        return 'Sao chủ tiểu nhân, xuất hành không thuận, nhà cửa không vui, chăn nuôi thua lỗ.';
      case CuuDieu.thuyDieu:
        return 'Sao chủ Tài, Lộc, Hỷ. Chỉ phòng việc đi sông nước và điều ăn tiếng nói.';
      case CuuDieu.thaiBach:
        return 'Sao chủ tán tiền của, tiểu nhân, quan phụng, bệnh nội tạng.';
      case CuuDieu.thaiDuong:
        return 'Sao chủ hưng vượng tài lộc.';
      case CuuDieu.vanHan:
        return 'Sao chủ sự chủ cựu. Phòng thương tật, ốm đau, sản nạn, nóng nảy, mồm miệng, quan tụng, giấy tờ.';
      case CuuDieu.keDo:
        return 'Sao chủ hung dữ, ám muội, thị phi, buồn rầu.';
      case CuuDieu.thaiAm:
        return 'Sao chủ sự toại nguyện về danh lợi. Nữ phòng ốm đau, tật ách, sản nạn.';
      case CuuDieu.mocDuc:
        return 'Sao chủ hướng tới sự an vui hòa hợp.';
    }
  }

  static CuuDieu? coiCuuDieu({
    required int tuoi,
    required GioiTinh gioiTinh,
  }) {
    while (tuoi - 9 > 10) {
      tuoi -= 9;
    }
    switch (gioiTinh) {
      case GioiTinh.nam:
        switch (tuoi) {
          case 10:
            return CuuDieu.laHau;
          case 11:
            return CuuDieu.thoTu;
          case 12:
            return CuuDieu.thuyDieu;
          case 13:
            return CuuDieu.thaiBach;
          case 14:
            return CuuDieu.thaiDuong;
          case 15:
            return CuuDieu.vanHan;
          case 16:
            return CuuDieu.keDo;
          case 17:
            return CuuDieu.thaiAm;
          case 18:
            return CuuDieu.mocDuc;
        }
        break;
      case GioiTinh.nu:
        switch (tuoi) {
          case 10:
            return CuuDieu.keDo;
          case 11:
            return CuuDieu.vanHan;
          case 12:
            return CuuDieu.mocDuc;
          case 13:
            return CuuDieu.thaiAm;
          case 14:
            return CuuDieu.thoTu;
          case 15:
            return CuuDieu.laHau;
          case 16:
            return CuuDieu.thaiDuong;
          case 17:
            return CuuDieu.thaiBach;
          case 18:
            return CuuDieu.thuyDieu;
        }
        break;
    }
    return null;
  }
}
