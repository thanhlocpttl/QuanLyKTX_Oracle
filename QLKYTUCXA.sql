 CREATE TABLE NhanVienQuanLy
(
    MaNV NUMBER PRIMARY KEY,
    MatKhau VARCHAR2(20),
    QuyenTruyCap VARCHAR2(50),
    HoTen VARCHAR2(200),
    SDT number,
    GioiTinh VARCHAR2(4),
    ChucVu VARCHAR2(50),
    Email VARCHAR(100),
    DiaChi VARCHAR2(200)
);

CREATE TABLE LoaiSV
(
    MaLoaiSV VARCHAR2(6) PRIMARY KEY,
    TenLoaiSV VARCHAR2(100),
    GiamGia NUMBER
);

CREATE TABLE LoaiPhong
(
    MaLoaiPhong NUMBER PRIMARY KEY,
    TenLoaiPhong VARCHAR2(150),
    SoLuongSV NUMBER,
    PhiTheoThang NUMBER
);

CREATE TABLE KhuNha
(
    MaKhu NUMBER PRIMARY KEY,
    TenKhu VARCHAR2(150),
    SoLuongPhong NUMBER
);

CREATE TABLE Phong
(
    MaPhong VARCHAR2(5) PRIMARY KEY,
    TenPhong VARCHAR2(150),
    TinhTrang VARCHAR2(100),
    MaKhu NUMBER,
    MaLoaiPhong NUMBER,
    MaNV NUMBER,
    FOREIGN KEY (MaNV) REFERENCES NhanVienQuanLy(MaNV),
    FOREIGN KEY (MaKhu) REFERENCES KhuNha(MaKhu),
    FOREIGN KEY (MaLoaiPhong) REFERENCES LoaiPhong(MaLoaiPhong)
);

CREATE TABLE TaiSan 
(
    MaTS NUMBER PRIMARY KEY,
    TenTS VARCHAR2(150),
    GiaTS NUMBER,
    MaPhong VARCHAR2(5),
    FOREIGN KEY (MaPhong) REFERENCES Phong(MaPhong)
);

CREATE TABLE HoaDonPhiPhatSinh
(
    MaHDPhiPS NUMBER PRIMARY KEY,
    TenPhiPS VARCHAR2(300),
    SoTien NUMBER,
    NgayThu TIMESTAMP(3),
    MaPhong VARCHAR2(5),
    MaNV NUMBER,
    GhiChu VARCHAR2(200),
    FOREIGN KEY (MaNV) REFERENCES NhanVienQuanLy(MaNV),
    FOREIGN KEY (MaPhong) REFERENCES Phong(MaPhong)
);

CREATE TABLE HoaDonPhiO
(
    MaHDPhiO NUMBER PRIMARY KEY,
    Thang NUMBER,
    NgayThu TIMESTAMP(3),
    SoTien NUMBER,
    MaNV NUMBER,
    FOREIGN KEY (MaNV) REFERENCES NhanVienQuanLy(MaNV)
);

CREATE TABLE HopDong
(
    MaHDong NUMBER PRIMARY KEY, 
    NgayTao TIMESTAMP(3),
    MaNV NUMBER,
    FOREIGN KEY (MaNV) REFERENCES NhanVienQuanLy(MaNV)
);
CREATE TABLE SinhVien 
(
    MaSV NUMBER PRIMARY KEY,
    MatKhau VARCHAR2(20),
    QuyenTruyCap VARCHAR2(50),
    HoTen VARCHAR2(200),
    SDT number,
    Khoa VARCHAR2(150),
    NgaySinh DATE,
    NgayVao DATE,
    NgayRa DATE,
    MaHDPhiO INT,
    MaPhong VARCHAR2(5),
    MaLoaiSV VARCHAR2(6),
    MaHDong INT,
    FOREIGN KEY (MaHDPhiO) REFERENCES HoaDonPhiO(MaHDPhiO),
    FOREIGN KEY (MaPhong) REFERENCES Phong(MaPhong),
    FOREIGN KEY (MaLoaiSV) REFERENCES LoaiSV(MaLoaiSV),
    FOREIGN KEY (MaHDong) REFERENCES HopDong(MaHDong)
);
CREATE TABLE NoiQuyKyLuat 
(
    MaKL NUMBER PRIMARY KEY, 
    NoiDungNoiQuy VARCHAR2(300)
);

CREATE TABLE DienNuocTieuThu 
(
    MaDN NUMBER PRIMARY KEY,
    Thang NUMBER, 
    SLNuoc NUMBER, 
    GiaNuoc NUMBER, 
    SLDien NUMBER, 
    GiaDien NUMBER,
    MaPhong VARCHAR2(5),
    FOREIGN KEY (MaPhong) REFERENCES Phong(MaPhong)
);

CREATE TABLE CTViPham
(
    MaCTVPham NUMBER PRIMARY KEY,
    MaKL NUMBER,
    MaSV NUMBER,
    NgayViPham DATE,
    FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV),
    FOREIGN KEY(MaKL) REFERENCES NoiQuyKyLuat(MaKL)
);


INSERT INTO NhanVienQuanLy VALUES (1001, 'BuiThiHien', 'NHANVIEN', N'Bùi Th? Hi?n', '0372551464', N'N?', N'Tr??ng ban qu?n lý', 'buithihienufm@gmail.com', N'171 ?i?n Biên Ph?, Bình Th?nh, Tp.H? Chí Minh');
INSERT INTO NhanVienQuanLy VALUES (1002, 'ngochanh02', 'NHANVIEN', N'Nguy?n Ng?c H?nh', '0372554678', N'N?', N'Qu?n lý phòng', 'nguyenngochanhufm@gmail.com', N'77 T?ng Nh?n Phú B, Th? ??c, Tp.H? Chí Minh');
INSERT INTO NhanVienQuanLy VALUES (1003, 'thanhnam04', 'NHANVIEN', N'Nguy?n Thành Nam', '0902556789', 'Nam', N'K? toán', 'nguyenthanhnamufm@gmail.com', N'8 Tr?n M?u, Th? ??c, Tp.H? Chí Minh');
INSERT INTO NhanVienQuanLy VALUES (1004, 'vuchien23', 'NHANVIEN', N'Võ Minh Chi?n', '0342453253', 'Nam', N'Nhân viên k? thu?t', 'vuminhchienufm@gmail.com', N'257 Lê V?n Vi?t, Qu?n 9, Tp.H? Chí Minh');
INSERT INTO NhanVienQuanLy VALUES (1005, 'BuiThiHien', 'NHANVIEN', N'Nguy?n Ái Ái', '0372551464', N'N?', N'Tr??ng ban qu?n lý', 'buithihienufm@gmail.com', N'221 Ph?m V?n ??ng, Th? ??c, Tp.H? Chí Minh');
INSERT INTO NhanVienQuanLy VALUES (1006, 'ngochanh02', 'NHANVIEN', N'Nguy?n Minh H?nh', '0372554678', N'N?', N'Qu?n lý phòng', 'nguyenngochanhufm@gmail.com', N'8 Tr?n M?u, Th? ??c, Tp.H? Chí Minh');
INSERT INTO NhanVienQuanLy VALUES (1007, 'thanhnam04', 'NHANVIEN', N'Nguy?n Thành Công', '0902556789', 'Nam', N'K? toán', 'nguyenthanhnamufm@gmail.com', N'345 Lã Xuân Oai, Th? ??c, Tp.H? Chí Minh');
INSERT INTO NhanVienQuanLy VALUES (1008, 'vuchien23', 'NHANVIEN', N'Lý Minh H?u', '0342453253', 'Nam', N'Nhân viên k? thu?t', 'vuminhchienufm@gmail.com', N'257 Lê V?n Vi?t, Qu?n 9, Tp.H? Chí Minh');
INSERT INTO NhanVienQuanLy VALUES (1009, 'thanhnam04', 'NHANVIEN', N'Nguy?n Ph??ng Nam', '0902556789', 'Nam', N'K? toán', 'nguyenthanhnamufm@gmail.com', N'16 Phan V?n Trí, Tp.H? Chí Minh');
INSERT INTO NhanVienQuanLy VALUES (1010, 'vuchien23', 'NHANVIEN', N'Lê Minh An', '0342453253', 'Nam', N'Nhân viên k? thu?t', 'vuminhchienufm@gmail.com', N'385 Lê V?n Vi?t, Qu?n 9, Tp.H? Chí Minh');



INSERT INTO KhuNha VALUES (01, 'Khu 6C', 40);
INSERT INTO KhuNha VALUES (02, 'Khu 6D', 20);
INSERT INTO KhuNha VALUES (03, 'Khu 6E', 20);

INSERT INTO LoaiPhong VALUES (1, N'Phòng lo?i 1', 4, 500000);
INSERT INTO LoaiPhong VALUES (2, N'Phòng lo?i 2', 8, 300000);
INSERT INTO LoaiPhong VALUES (3, N'Phòng lo?i 3', 10, 250000);

INSERT INTO Phong VALUES ('0016C', '001', N'H?t ch?', 01, 1, 1002);
INSERT INTO Phong VALUES ('0026C', '002', N'Còn ch?', 01, 1, 1002);
INSERT INTO Phong VALUES ('0036C', '003', N'H?t ch?', 01, 1, 1002);
INSERT INTO Phong VALUES ('0046C', '004', N'H?t ch?', 01, 1, 1002);
INSERT INTO Phong VALUES ('1016C', '101', N'H?t ch?', 01, 2, 1002);
INSERT INTO Phong VALUES ('1026C', '102', N'H?t ch?', 01, 2, 1002);
INSERT INTO Phong VALUES ('1036C', '103', N'H?t ch?', 01, 2, 1002);
INSERT INTO Phong VALUES ('1046C', '104', N'Còn ch?', 01, 3, 1002);
INSERT INTO Phong VALUES ('0016D', '001', N'Còn ch?', 02, 1, 1002);
INSERT INTO Phong VALUES ('0026D', '002', N'H?t ch?', 02, 1, 1002);
INSERT INTO Phong VALUES ('0036D', '003', N'H?t ch?', 02, 1, 1002);
INSERT INTO Phong VALUES ('2016D', '201', N'H?t ch?', 02, 3, 1006);
INSERT INTO Phong VALUES ('2026D', '202', N'H?t ch?', 02, 3, 1006);
INSERT INTO Phong VALUES ('2036D', '203', N'H?t ch?', 02, 3, 1006);
INSERT INTO Phong VALUES ('0016E', '001', N'H?t ch?', 03, 1, 1006);
INSERT INTO Phong VALUES ('0026E', '002', N'H?t ch?', 03, 1, 1006);
INSERT INTO Phong VALUES ('1016E', '101', N'Còn ch?', 03, 2, 1006);
INSERT INTO Phong VALUES ('1026E', '102', N'H?t ch?', 03, 2, 1006);
INSERT INTO Phong VALUES ('2016E', '201', N'H?t ch?', 03, 3, 1006);
INSERT INTO Phong VALUES ('2026E', '202', N'H?t ch?', 03, 3, 1006);
INSERT INTO Phong VALUES ('2017D', '202', N'Còn ch?', 03, 2, 1006);

INSERT INTO TaiSan VALUES (10101, N'Bóng ?èn phòng t?m 1', 60000, '0016C');
INSERT INTO TaiSan VALUES (10102, N'Bóng ?èn phòng t?m 2', 60000, '0016C');
INSERT INTO TaiSan VALUES (10103, N'Bóng ?èn ban công', 65000, '0016C');
INSERT INTO TaiSan VALUES (10104, N'Bóng ?èn phòng ng?', 85000, '0016C');
INSERT INTO TaiSan VALUES (10105, N'Qu?t', 250000, '0016C');
INSERT INTO TaiSan VALUES (10106, N'Gi??ng 1', 1000000, '0016C');
INSERT INTO TaiSan VALUES (10107, N'Gi??ng 2', 1000000, '0016C');
INSERT INTO TaiSan VALUES (10110, N'Bàn c?u phòng 1', 900000, '0016C');
INSERT INTO TaiSan VALUES (10111, N'Bàn c?u phòng 2', 900000, '0016C');
INSERT INTO TaiSan VALUES (10112, N'Vòi hoa sen phòng t?m 1', 200000, '0016C');
INSERT INTO TaiSan VALUES (10113, N'Vòi hoa sen phòng t?m 2', 200000, '0016C');
INSERT INTO TaiSan VALUES (10114, N'Vòi n??c', 100000, '0016C');
INSERT INTO TaiSan VALUES (10115, N'Bàn r?a tay', 400000, '0016C');
INSERT INTO TaiSan VALUES (10201, N'Bóng ?èn phòng t?m 1', 60000, '0026C');
INSERT INTO TaiSan VALUES (10202, N'Bóng ?èn phòng t?m 2', 60000, '0026C');
INSERT INTO TaiSan VALUES (10203, N'Bóng ?èn ban công', 65000, '0026C');
INSERT INTO TaiSan VALUES (10204, N'Bóng ?èn phòng ng?', 85000, '0026C');
INSERT INTO TaiSan VALUES (10205, N'Qu?t', 250000, '0026C');
INSERT INTO TaiSan VALUES (10206, N'Gi??ng 1', 1000000, '0026C');
INSERT INTO TaiSan VALUES (10207, N'Gi??ng 2', 1000000, '0026C');
INSERT INTO TaiSan VALUES (10210, N'Bàn c?u phòng 1', 900000, '0026C');
INSERT INTO TaiSan VALUES (10211, N'Bàn c?u phòng 2', 900000, '0026C');
INSERT INTO TaiSan VALUES (10212, N'Vòi hoa sen phòng t?m 1', 200000, '0026C');
INSERT INTO TaiSan VALUES (10213, N'Vòi hoa sen phòng t?m 2', 200000, '0026C');
INSERT INTO TaiSan VALUES (10214, N'Vòi n??c', 100000, '0026C');
INSERT INTO TaiSan VALUES (10215, N'Bàn r?a tay', 400000, '0026C');
INSERT INTO TaiSan VALUES (10301, N'Bóng ?èn phòng t?m 1', 60000, '0036C');
INSERT INTO TaiSan VALUES (10302, N'Bóng ?èn phòng t?m 2', 60000, '0036C');
INSERT INTO TaiSan VALUES (10303, N'Bóng ?èn ban công', 65000, '0036C');
INSERT INTO TaiSan VALUES (10304, N'Bóng ?èn phòng ng?', 85000, '0036C');
INSERT INTO TaiSan VALUES (10305, N'Qu?t', 250000, '0036C');
INSERT INTO TaiSan VALUES (10306, N'Gi??ng 1', 1000000, '0036C');
INSERT INTO TaiSan VALUES (10307, N'Gi??ng 2', 1000000, '0036C');
INSERT INTO TaiSan VALUES (10310, N'Bàn c?u phòng 1', 900000, '0036C');
INSERT INTO TaiSan VALUES (10311, N'Bàn c?u phòng 2', 900000, '0036C');
INSERT INTO TaiSan VALUES(10312, N'Vòi hoa sen phòng t?m 1', 200000, '0036C');
INSERT INTO TaiSan VALUES(10313, N'Vòi hoa sen phòng t?m 2', 200000, '0036C');
INSERT INTO TaiSan VALUES(10314, N'Vòi n??c', 100000, '0036C');
INSERT INTO TaiSan VALUES(10315, N'Bàn r?a tay', 400000, '0036C');
INSERT INTO TaiSan VALUES(10401, N'Bóng ?èn phòng t?m 1', 60000, '0046C');
INSERT INTO TaiSan VALUES(10402, N'Bóng ?èn phòng t?m 2', 60000, '0046C');
INSERT INTO TaiSan VALUES(10403, N'Bóng ?èn ban công', 65000, '0046C');
INSERT INTO TaiSan VALUES(10404, N'Bóng ?èn phòng ng?', 85000, '0046C');
INSERT INTO TaiSan VALUES(10405, N'Qu?t', 250000, '0046C');
INSERT INTO TaiSan VALUES(10406, N'Gi??ng 1', 1000000, '0046C');
INSERT INTO TaiSan VALUES(10407, N'Gi??ng 2', 1000000, '0046C');
INSERT INTO TaiSan VALUES(10410, N'Bàn c?u phòng 1', 900000, '0046C');
INSERT INTO TaiSan VALUES(10411, N'Bàn c?u phòng 2', 900000, '0046C');
INSERT INTO TaiSan VALUES(10412, N'Vòi hoa sen phòng t?m 1', 200000, '0046C');
INSERT INTO TaiSan VALUES(10413, N'Vòi hoa sen phòng t?m 2', 200000, '0046C');
INSERT INTO TaiSan VALUES(10414, N'Vòi n??c', 100000, '0046C');
INSERT INTO TaiSan VALUES(10415, N'Bàn r?a tay', 400000, '0046C');
INSERT INTO TaiSan VALUES(11101, N'Bóng ?èn phòng t?m 1', 60000, '1016C');
INSERT INTO TaiSan VALUES(11102, N'Bóng ?èn phòng t?m 2', 60000, '1016C');
INSERT INTO TaiSan VALUES(11103, N'Bóng ?èn ban công', 65000, '1016C');
INSERT INTO TaiSan VALUES(11104, N'Bóng ?èn phòng ng?', 85000, '1016C');
INSERT INTO TaiSan VALUES(11105, N'Qu?t', 250000, '1016C');
INSERT INTO TaiSan VALUES(11106, N'Gi??ng 1', 1000000, '1016C');
INSERT INTO TaiSan VALUES(11107, N'Gi??ng 2', 1000000, '1016C');
INSERT INTO TaiSan VALUES(11108, N'Gi??ng 3', 1000000, '1016C');
INSERT INTO TaiSan VALUES(11109, N'Gi??ng 4', 1000000, '1016C');
INSERT INTO TaiSan VALUES(11110, N'Bàn c?u phòng 1', 900000, '1016C');
INSERT INTO TaiSan VALUES(11111, N'Bàn c?u phòng 2', 900000, '1016C');
INSERT INTO TaiSan VALUES(11112, N'Vòi hoa sen phòng t?m 1', 200000, '1016C');
INSERT INTO TaiSan VALUES(11113, N'Vòi hoa sen phòng t?m 2', 200000, '1016C');
INSERT INTO TaiSan VALUES(11114, N'Vòi n??c', 100000, '1016C');
INSERT INTO TaiSan VALUES(11115, N'Bàn r?a tay', 400000, '1016C');
INSERT INTO TaiSan VALUES(11201, N'Bóng ?èn phòng t?m 1', 60000, '1026C');
INSERT INTO TaiSan VALUES(11202, N'Bóng ?èn phòng t?m 2', 60000, '1026C');
INSERT INTO TaiSan VALUES(11203, N'Bóng ?èn ban công', 65000, '1026C');
INSERT INTO TaiSan VALUES(11204, N'Bóng ?èn phòng ng?', 85000, '1026C');
INSERT INTO TaiSan VALUES(11205, N'Qu?t', 250000, '1026C');
INSERT INTO TaiSan VALUES(11206, N'Gi??ng 1', 1000000, '1026C');




INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000001, 2, TO_TIMESTAMP('03/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 500000, 1003);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000002, 2, TO_TIMESTAMP('03/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 500000, 1009);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000003, 2, TO_TIMESTAMP('03/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 500000, 1003);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000004, 2, TO_TIMESTAMP('03/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 500000, 1003);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000005, 2, TO_TIMESTAMP('03/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 500000, 1003);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000006, 2, TO_TIMESTAMP('03/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 500000, 1003);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000007, 2, TO_TIMESTAMP('03/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 500000, 1009);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000008, 2, TO_TIMESTAMP('03/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 500000, 1007);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000009, 2, TO_TIMESTAMP('03/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 250000, 1007);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000010, 2, TO_TIMESTAMP('03/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 250000, 1003);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000011, 2, TO_TIMESTAMP('03/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 500000, 1003);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000012, 2, TO_TIMESTAMP('03/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 500000, 1003);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000013, 2, TO_TIMESTAMP('03/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 250000, 1009);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000014, 2, TO_TIMESTAMP('03/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 250000, 1003);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000015, 2, TO_TIMESTAMP('03/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 500000, 1003);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000016, 2, TO_TIMESTAMP('03/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 250000, 1003);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000017, 2, TO_TIMESTAMP('03/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 500000, 1009);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000018, 2, TO_TIMESTAMP('03/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 500000, 1003);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000019, 3, TO_TIMESTAMP('04/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 500000, 1003);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000020, 3, TO_TIMESTAMP('04/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 300000, 1007);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000021, 3, TO_TIMESTAMP('04/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 300000, 1007);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000022, 3, TO_TIMESTAMP('04/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 500000, 1003);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000023, 3, TO_TIMESTAMP('04/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 300000, 1003);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000024, 3, TO_TIMESTAMP('04/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 300000, 1009);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000025, 3, TO_TIMESTAMP('04/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 300000, 1003);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000026, 3, TO_TIMESTAMP('04/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 300000, 1003);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000027, 3, TO_TIMESTAMP('04/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 250000, 1003);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000028, 3, TO_TIMESTAMP('04/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 300000, 1003);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000029, 3, TO_TIMESTAMP('04/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 250000, 1003);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000030, 3, TO_TIMESTAMP('04/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 250000, 1009);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000031, 3, TO_TIMESTAMP('04/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 250000, 1007);
INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000032, 3, TO_TIMESTAMP('04/01/2023', 'MM/DD/YYYY HH24:MI:SS'), 250000, 1007);


INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1001, TO_TIMESTAMP('01/12/2023', 'MM/DD/YYYY HH24:MI:SS'), 1003);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1002, TO_TIMESTAMP('01/13/2023', 'MM/DD/YYYY HH24:MI:SS'), 1003);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1003, TO_TIMESTAMP('01/14/2023', 'MM/DD/YYYY HH24:MI:SS'), 1003);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1004, TO_TIMESTAMP('01/14/2023', 'MM/DD/YYYY HH24:MI:SS'), 1003);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1005, TO_TIMESTAMP('01/15/2023', 'MM/DD/YYYY HH24:MI:SS'), 1003);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1006, TO_TIMESTAMP('01/15/2023', 'MM/DD/YYYY HH24:MI:SS'), 1003);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1007, TO_TIMESTAMP('01/15/2023', 'MM/DD/YYYY HH24:MI:SS'), 1007);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1008, TO_TIMESTAMP('01/16/2023', 'MM/DD/YYYY HH24:MI:SS'), 1007);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1009, TO_TIMESTAMP('01/16/2023', 'MM/DD/YYYY HH24:MI:SS'), 1007);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1010, TO_TIMESTAMP('01/16/2023', 'MM/DD/YYYY HH24:MI:SS'), 1007);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1011, TO_TIMESTAMP('01/16/2023', 'MM/DD/YYYY HH24:MI:SS'), 1007);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1012, TO_TIMESTAMP('01/16/2023', 'MM/DD/YYYY HH24:MI:SS'), 1007);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1013, TO_TIMESTAMP('01/16/2023', 'MM/DD/YYYY HH24:MI:SS'), 1007);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1014, TO_TIMESTAMP('01/17/2023', 'MM/DD/YYYY HH24:MI:SS'), 1007);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1015, TO_TIMESTAMP('01/17/2023', 'MM/DD/YYYY HH24:MI:SS'), 1007);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1016, TO_TIMESTAMP('01/18/2023', 'MM/DD/YYYY HH24:MI:SS'), 1009);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1017, TO_TIMESTAMP('01/18/2023', 'MM/DD/YYYY HH24:MI:SS'), 1009);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1018, TO_TIMESTAMP('01/18/2023', 'MM/DD/YYYY HH24:MI:SS'), 1009);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1019, TO_TIMESTAMP('01/18/2023', 'MM/DD/YYYY HH24:MI:SS'), 1009);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1020, TO_TIMESTAMP('01/18/2023', 'MM/DD/YYYY HH24:MI:SS'), 1009);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1021, TO_TIMESTAMP('01/18/2023', 'MM/DD/YYYY HH24:MI:SS'), 1009);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1022, TO_TIMESTAMP('01/18/2023', 'MM/DD/YYYY HH24:MI:SS'), 1009);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1023, TO_TIMESTAMP('01/19/2023', 'MM/DD/YYYY HH24:MI:SS'), 1009);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1024, TO_TIMESTAMP('01/19/2023', 'MM/DD/YYYY HH24:MI:SS'), 1009);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1025, TO_TIMESTAMP('01/19/2023', 'MM/DD/YYYY HH24:MI:SS'), 1009);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1026, TO_TIMESTAMP('01/19/2023', 'MM/DD/YYYY HH24:MI:SS'), 1007);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1027, TO_TIMESTAMP('01/20/2023', 'MM/DD/YYYY HH24:MI:SS'), 1007);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1028, TO_TIMESTAMP('01/20/2023', 'MM/DD/YYYY HH24:MI:SS'), 1003);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1029, TO_TIMESTAMP('01/20/2023', 'MM/DD/YYYY HH24:MI:SS'), 1003);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1030, TO_TIMESTAMP('01/20/2023', 'MM/DD/YYYY HH24:MI:SS'), 1009);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1031, TO_TIMESTAMP('01/20/2023', 'MM/DD/YYYY HH24:MI:SS'), 1009);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1032, TO_TIMESTAMP('01/20/2023', 'MM/DD/YYYY HH24:MI:SS'), 1009);

INSERT INTO DienNuocTieuThu VALUES (200001,3, 80, 5000,160, 3000,'0016C');
INSERT INTO DienNuocTieuThu VALUES(200002,3, 76,5000,124, 3000,'0026C');
INSERT INTO DienNuocTieuThu VALUES(200003,3,67,5000,132,3000,'0036C');
INSERT INTO DienNuocTieuThu VALUES(200004,3,89,5000,140,3000,'0046C');
INSERT INTO DienNuocTieuThu VALUES(200005,3,56,5000,150,3000,'1016C');
INSERT INTO DienNuocTieuThu VALUES(200006,3,87,5000,200,3000,'1026C');
INSERT INTO DienNuocTieuThu VALUES(200007,3,78,5000,150,3000,'1036C');
INSERT INTO DienNuocTieuThu VALUES(200008,3,53,5000,220,3000,'1046C');
INSERT INTO DienNuocTieuThu VALUES(200009,3,56,5000,145,3000,'0016D');
INSERT INTO DienNuocTieuThu VALUES(200010,3,55,5000,155,3000,'0026D');
INSERT INTO DienNuocTieuThu VALUES(200011,3,66,5000,178,3000,'0036D');
INSERT INTO DienNuocTieuThu VALUES(200012,3,77,5000,134,3000,'2016D');
INSERT INTO DienNuocTieuThu VALUES(200013,3,88,5000,177,3000,'2026D');
INSERT INTO DienNuocTieuThu VALUES(200014,3,66,5000,166,3000,'2036D');
INSERT INTO DienNuocTieuThu VALUES(200015,3,78,5000,133,3000,'0016E');
INSERT INTO DienNuocTieuThu VALUES(200016,3,78,5000,155,3000,'0026E');
INSERT INTO DienNuocTieuThu VALUES(200017,3,56,5000,167,3000,'1016E');
INSERT INTO DienNuocTieuThu VALUES(200018,3,89,5000,156,3000,'1026E');
INSERT INTO DienNuocTieuThu VALUES(200019,3,56,5000,145,3000,'2016E');
INSERT INTO DienNuocTieuThu VALUES(200020,3,67,5000,178,3000,'2026E');

INSERT INTO NoiQuyKyLuat VALUES (11, N'T? 23h ?êm ngày hôm tr??c ??n 5h sáng ngày hôm sau, nghiêm c?m ng??i ? ký túc xá ra vào (tr? tr??ng h?p có lý do chính ?áng)');
INSERT INTO NoiQuyKyLuat VALUES (12, N'Không ??a xe ??p, xe máy vào ký túc xá và ph?i ?? ?úng n?i quy ??nh');
INSERT INTO NoiQuyKyLuat VALUES (13, N'Không n?u n??c, t? ch?c ?n, u?ng r??u, bia, x? rác b?a bãi trong ký túc xá');
INSERT INTO NoiQuyKyLuat VALUES (14, N'Không s? d?ng tàng tr? các lo?i v? khí, hung khí, côn… ch?t n?, ch?t gây nghi?n, tiêm chích ma túy');
INSERT INTO NoiQuyKyLuat VALUES (15, N'Ng??i không có nhi?m v? không ???c vào ký túc xá sinh viên');
INSERT INTO NoiQuyKyLuat VALUES (16, N'Gi? gìn phòng ? g?n gàng, s?ch ??p, tích c?c tham gia các phong trào do Ban qu?n lý t? ch?c');

INSERT INTO SinhVien VALUES (2101, 'pttl1234', 'SINHVIEN', N'Ph?m Th? Thanh L?c', 0333559000, N'Công ngh? thông tin', TO_DATE('08/01/2003', 'MM/DD/YYYY'), TO_DATE('28/02/2024', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 000001, '0016C', 'LSV004', 1001);
INSERT INTO SinhVien VALUES (2102, 'lltttt84', 'SINHVIEN', N'Lê Th? T?t', 0909739955, N'Công ngh? thông tin', TO_DATE('04/08/2003', 'MM/DD/YYYY'), TO_DATE('28/02/2024', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 000002, '0016C', 'LSV002', 1002);
INSERT INTO SinhVien VALUES (2103, '134254', 'SINHVIEN', N'Nguy?n Th? Mai Lan', 0917739855, N'Qu?n tr? kinh doanh', TO_DATE('07/05/2004', 'MM/DD/YYYY'), TO_DATE('28/02/2024', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 000003, '0026C', 'LSV003', 1003);
INSERT INTO SinhVien VALUES (2104, '34dh78', 'SINHVIEN', N'Tr?n Th? Mai', 0309739945, N'Marketing', TO_DATE('09/06/2002', 'MM/DD/YYYY'), TO_DATE('28/02/2024', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 000004, '0026C', 'LSV004', 1004);
INSERT INTO SinhVien VALUES (2105, '3ededed', 'SINHVIEN', N'Lê Th? H?ng Ph??ng', 0409739924, N'Th?m ??nh giá', TO_DATE('12/02/2003', 'MM/DD/YYYY'), TO_DATE('28/02/2024', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 000005, '0036C', 'LSV001', 1005);
INSERT INTO SinhVien VALUES (2106, '1344567', 'SINHVIEN', N'Mai Ng?c Lâm', 0509767538, N'Tài chính ngân hàng', TO_DATE('06/06/2003', 'MM/DD/YYYY'), TO_DATE('28/02/2024', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 000006, '0036C', 'LSV003', 1006);
INSERT INTO SinhVien VALUES (2107, '345778', 'SINHVIEN', N'Nguy?n Thùy Trinh', 0903456325, N'Qu?n tr? kinh doanh', TO_DATE('07/05/2004', 'MM/DD/YYYY'), TO_DATE('28/02/2024', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 000007, '0046C', 'LSV004', 1007);
INSERT INTO SinhVien VALUES (2108, 'fdddfdfd', 'SINHVIEN', N'Hà Ng?c Loan', 0907124568, N'K? toán, ki?m toán', TO_DATE('08/05/2002', 'MM/DD/YYYY'), TO_DATE('28/02/2024', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 000008, '0046C', 'LSV002', 1008);
INSERT INTO SinhVien VALUES (2109, 'eeeddd', 'SINHVIEN', N'Nguy?n V? Tu? Anh', 0903694270, N'Tài chính ngân hàng', TO_DATE('04/03/2003', 'MM/DD/YYYY'), TO_DATE('28/02/2024', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 000009, '1046C', 'LSV001', 1009);
INSERT INTO SinhVien VALUES (2110, '34eeeddd', 'SINHVIEN', N'Lê Th? Ng?c', 0907623455, N'Th?m ??nh giá', TO_DATE('06/06/2003', 'MM/DD/YYYY'), TO_DATE('28/02/2024', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 0000010, '1046C', 'LSV004', 1010);
INSERT INTO SinhVien VALUES (2111, '11234', 'SINHVIEN', N'Lê Th? M?', 0903467897, N'Kinh doanh qu?c t?', TO_DATE('01/04/2002', 'MM/DD/YYYY'), TO_DATE('28/02/2024', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 0000011, '0016D', 'LSV002', 1011);
INSERT INTO SinhVien VALUES (2112, 'ddede', 'SINHVIEN', N'Nguy?n H?i Ng?c Ngà', 0903489134, N'Tài chính ngân hàng', TO_DATE('05/09/2003', 'MM/DD/YYYY'), TO_DATE('28/02/2024', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 0000012, '0016D', 'LSV001', 1012);
INSERT INTO SinhVien VALUES (2113, 'eeedf', 'SINHVIEN', N'Nguy?n Thúy H?ng',0702589745, N'Marketing', TO_DATE('11/11/2002', 'DD/MM/YYYY'), TO_DATE('28/02/2024', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 0000013, '2016E', 'LSV003', 1013);
INSERT INTO SinhVien VALUES (2114, 'eefff', 'SINHVIEN', N'Lê Ng?c M?', 0321456987, N'Công ngh? thông tin', TO_DATE('10/10/2003', 'DD/MM/YYYY'), TO_DATE('28/02/2024', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 0000014, '2016E', 'LSV004', 1014);

INSERT INTO SinhVien VALUES (2115, 'ffdee', 'SINHVIEN', N'Hà Th? Hoàng', 0903112233, N'Tài chính ngân hàng', TO_DATE('09/09/2002', 'DD/MM/YYYY'), TO_DATE('28/02/2024', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 0000015, '0016D', 'LSV001', 1015);
INSERT INTO SinhVien VALUES (2116, 'ddfgh', 'SINHVIEN', N'Nguy?n V?n Hòa', 0903445566, N'Th?m ??nh giá', TO_DATE('07/07/2003', 'DD/MM/YYYY'), TO_DATE('28/02/2024', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 0000016, '2016E', 'LSV003', 1016);
INSERT INTO SinhVien VALUES (2117, 'ghhfg', 'SINHVIEN', N'Lê Th? Lâm', 0903778899, N'Marketing', TO_DATE('08/08/2002', 'DD/MM/YYYY'), TO_DATE('28/02/2024', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 0000017, '0016D', 'LSV002', 1017);
INSERT INTO SinhVien VALUES (2118, 'jjjkkk', 'SINHVIEN', N'Ph?m V?n Hoàng', 0903990011, N'K? toán, ki?m toán', TO_DATE('06/06/2003', 'DD/MM/YYYY'), TO_DATE('28/02/2024', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 0000018, '0036D', 'LSV001', 1018);
INSERT INTO SinhVien VALUES (2119, 'jjjhghg', 'SINHVIEN', N'Nguy?n Th? Hoa', 0903223344, N'Tài chính ngân hàng', TO_DATE('03/03/2002', 'DD/MM/YYYY'), TO_DATE('28/02/2024', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 0000019, '0036D', 'LSV004', 1019);
INSERT INTO SinhVien VALUES (2120, 'hghgh', 'SINHVIEN', N'Hà V?n Hùng', 0903556677, N'Th?m ??nh giá', TO_DATE('02/02/2003', 'DD/MM/YYYY'), TO_DATE('28/02/2024', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 0000020, '1016E', 'LSV003', 1020);
INSERT INTO SinhVien VALUES (2121, 'hhggh', 'SINHVIEN', N'Lê Th? Hoa', 0903889900, N'Marketing', TO_DATE('01/01/2002', 'DD/MM/YYYY'), TO_DATE('28/02/2024', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 0000021, '1016E', 'LSV002', 1021);
INSERT INTO SinhVien VALUES (2122, '55555tt', 'SINHVIEN', N'Bùi Minh Anh', 0900972658, N'K? toán, ki?m toán', TO_DATE('04/08/2002', 'DD/MM/YYYY'), TO_DATE('28/02/2023', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 0000022, '0026E', 'LSV003', 1022);
INSERT INTO SinhVien VALUES (2123, '55567dd', 'SINHVIEN', N'Nguy?n Minh Anh', 0120973457, N'Qu?n tr? kinh doanh', TO_DATE('01/08/2002', 'DD/MM/YYYY'), TO_DATE('28/02/2023', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 0000023, '1016E', 'LSV002', 1023);
INSERT INTO SinhVien VALUES (2124, '444ddddd', 'SINHVIEN', N'Lê B?o Phúc', 0450974964, N'Marketing', TO_DATE('08/05/2003', 'DD/MM/YYYY'), TO_DATE('28/02/2023', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 0000024, '1026E', 'LSV003', 1024);
INSERT INTO SinhVien VALUES (2125, '34343433', 'SINHVIEN', N'Nguy?n H?u Nam', 0340965378, N'Th?m ??nh giá', TO_DATE('23/04/2003', 'DD/MM/YYYY'), TO_DATE('28/02/2023', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 0000025, '1026E', 'LSV002', 1025);
INSERT INTO SinhVien VALUES (2126, 'edededed', 'SINHVIEN', N'Mai ?ình Tài', 09009739345, N'Tài chính ngân hàng', TO_DATE('12/07/2003', 'DD/MM/YYYY'), TO_DATE('28/02/2023', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 0000026, '1026E', 'LSV003', 1026);
INSERT INTO SinhVien VALUES (2127, '7777777', 'SINHVIEN', N'Lâm Chi?n Th?ng', 0780973985, N'Qu?n tr? kinh doanh', TO_DATE('05/04/2004', 'DD/MM/YYYY'), TO_DATE('28/02/2023', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 0000027, '2016E', 'LSV001', 1027);
INSERT INTO SinhVien VALUES (2128, '8888888', 'SINHVIEN', N'Võ Minh Tài', 09009723565, N'Th?m ??nh giá', TO_DATE('07/09/2004', 'DD/MM/YYYY'), TO_DATE('28/02/2023', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 0000028, '1036C', 'LSV002', 1028); 
INSERT INTO SinhVien VALUES (2129, '23243545', 'SINHVIEN', N'Lê Hoài Nam', 02009787393, N'Marketing', TO_DATE('08/07/2004', 'DD/MM/YYYY'), TO_DATE('28/02/2023', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 0000029, '2016E', 'LSV002', 1029);
INSERT INTO SinhVien VALUES (2130, 'cxcxcxcx', 'SINHVIEN', N'Lê Nguyên B?o Minh', 0945973985, N'Qu?n tr? kinh doanh', TO_DATE('06/04/2002', 'DD/MM/YYYY'), TO_DATE('28/02/2023', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 0000030, '2026E', 'LSV004', 1030);
INSERT INTO SinhVien VALUES (2131, 'dsdsdsdsd', 'SINHVIEN', N'Hà Võ An', 09009235985, N'Công ngh? thông tin', TO_DATE('07/12/2002', 'DD/MM/YYYY'), TO_DATE('28/02/2023', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 0000031, '2026E', 'LSV001', 1031);
INSERT INTO SinhVien VALUES (2132, 'efefefef', 'SINHVIEN', N'Tr?n Minh Tâm', 0670973985, N'K? toán, ki?m toán', TO_DATE('14/09/2002', 'DD/MM/YYYY'), TO_DATE('28/02/2023', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 0000032, '2026E', 'LSV002', 1032);

 
 INSERT INTO CTViPham VALUES (1,11, 2114, TO_DATE('23/02/2023', 'DD/MM/YYYY'));
INSERT INTO CTViPham VALUES (2,11, 2115, TO_DATE('11/02/2023', 'DD/MM/YYYY'));
INSERT INTO CTViPham VALUES (3,11, 2123, TO_DATE('22/02/2023', 'DD/MM/YYYY'));
INSERT INTO CTViPham VALUES (4,11, 2122, TO_DATE('28/02/2023', 'DD/MM/YYYY'));
INSERT INTO CTViPham VALUES (5,12, 2114, TO_DATE('21/02/2023', 'DD/MM/YYYY'));
INSERT INTO CTViPham VALUES (6,12, 2119, TO_DATE('17/02/2023', 'DD/MM/YYYY'));
INSERT INTO CTViPham VALUES (7,12, 2118, TO_DATE('23/02/2023', 'DD/MM/YYYY'));
INSERT INTO CTViPham VALUES (8,13, 2120, TO_DATE('24/02/2023', 'DD/MM/YYYY'));
INSERT INTO CTViPham VALUES (9,13, 2123, TO_DATE('23/02/2023', 'DD/MM/YYYY'));
INSERT INTO CTViPham VALUES (10,13, 2118, TO_DATE('25/02/2023', 'DD/MM/YYYY'));
INSERT INTO CTViPham VALUES (11,14, 2114, TO_DATE('25/02/2023', 'DD/MM/YYYY'));
INSERT INTO CTViPham VALUES (12,14, 2116, TO_DATE('27/02/2023', 'DD/MM/YYYY'));
INSERT INTO CTViPham VALUES (13,15, 2114, TO_DATE('07/02/2023', 'DD/MM/YYYY'));
INSERT INTO CTViPham VALUES (14,16, 2118, TO_DATE('28/02/2023', 'DD/MM/YYYY'));

-------------------View------------------
----1
CREATE VIEW v_DanhSachPhong AS
SELECT P.MaPhong, P.TenPhong, P.TinhTrang, LP.TenLoaiPhong, KN.TenKhu, NVQL.HoTen AS QuanLy
FROM Phong P
JOIN LoaiPhong LP ON P.MaLoaiPhong = LP.MaLoaiPhong
JOIN KhuNha KN ON P.MaKhu = KN.MaKhu
LEFT JOIN NhanVienQuanLy NVQL ON P.MaNV = NVQL.MaNV;

SELECT * FROM v_DanhSachPhong;

----2
CREATE VIEW v_ThongTinSinhVien AS
SELECT SV.MaSV, SV.HoTen, SV.SDT, LSV.TenLoaiSV, P.TenPhong
FROM SinhVien SV
JOIN LoaiSV LSV ON SV.MaLoaiSV = LSV.MaLoaiSV
JOIN Phong P ON SV.MaPhong = P.MaPhong
where TenPhong = 001

SELECT * FROM v_ThongTinSinhVien;

----3
CREATE VIEW v_ThongKeSLSVTheoKhoa AS
SELECT SV.Khoa, COUNT(SV.MaSV) AS SoLuongSinhVien
FROM SinhVien SV
GROUP BY SV.Khoa;

select * from v_ThongKeSLSVTheoKhoa

----4
CREATE VIEW v_DanhSachTaiSan AS
SELECT TS.MaTS, TS.TenTS, TS.GiaTS, P.TenPhong
FROM TaiSan TS
JOIN Phong P ON TS.MaPhong = P.MaPhong
WHERE P.TenPhong = '004';

select * from v_DanhSachTaiSan

---5
CREATE VIEW v_DanhSachViPham AS
SELECT SV.HoTen AS SinhVien, KL.NoiDungNoiQuy, CTV.NgayViPham
FROM CTViPham CTV
JOIN SinhVien SV ON CTV.MaSV = SV.MaSV
JOIN NoiQuyKyLuat KL ON CTV.MaKL = KL.MaKL;

select * from v_DanhSachViPham

-------------------Procedure----------------
----1
CREATE OR REPLACE PROCEDURE p_LayThongTinSinhVienTheoKhoa(p_Khoa IN VARCHAR2, p_Cur OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN p_Cur FOR
    SELECT SV.MaSV, SV.HoTen, SV.SDT, LSV.TenLoaiSV, P.TenPhong, NVQL.HoTen AS QuanLy
    FROM SinhVien SV
    JOIN LoaiSV LSV ON SV.MaLoaiSV = LSV.MaLoaiSV
    JOIN Phong P ON SV.MaPhong = P.MaPhong
    LEFT JOIN NhanVienQuanLy NVQL ON P.MaNV = NVQL.MaNV
    WHERE SV.Khoa = p_Khoa;
END p_LayThongTinSinhVienTheoKhoa;


SET SERVEROUTPUT ON;
ACCEPT v_Khoa CHAR FORMAT 'A50' PROMPT 'Nhap Khoa: ';
DECLARE
    your_cursor_variable SYS_REFCURSOR;
    v_MaSV SinhVien.MaSV%TYPE;
    v_HoTen SinhVien.HoTen%TYPE;
    v_SDT SinhVien.SDT%TYPE;
    v_TenLoaiSV LoaiSV.TenLoaiSV%TYPE;
    v_TenPhong Phong.TenPhong%TYPE;
    v_QuanLy NhanVienQuanLy.HoTen%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Input Khoa: ' || '&v_Khoa');
    p_LayThongTinSinhVienTheoKhoa('&v_Khoa', your_cursor_variable);

    LOOP
        FETCH your_cursor_variable INTO v_MaSV, v_HoTen, v_SDT, v_TenLoaiSV, v_TenPhong, v_QuanLy;
        EXIT WHEN your_cursor_variable%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('MaSV: ' || v_MaSV || ', HoTen: ' || v_HoTen || ', SDT: ' || v_SDT || ', TenLoaiSV: ' || v_TenLoaiSV || ', TenPhong: ' || v_TenPhong || ', QuanLy: ' || v_QuanLy);
    END LOOP;

    CLOSE your_cursor_variable;

    DBMS_OUTPUT.PUT_LINE('Procedure executed successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;

------2
CREATE OR REPLACE PROCEDURE ThemNhanVienQuanLy(
    p_MaNV IN NUMBER,
    p_MatKhau IN VARCHAR2,
    p_QuyenTruyCap IN VARCHAR2,
    p_HoTen IN VARCHAR2,
    p_SDT IN VARCHAR2,
    p_GioiTinh IN VARCHAR2,
    p_ChucVu IN VARCHAR2,
    p_Email IN VARCHAR2,
    p_DiaChi IN VARCHAR2
)
IS
BEGIN
    INSERT INTO NhanVienQuanLy (
        MaNV, MatKhau, QuyenTruyCap, HoTen, SDT, GioiTinh, ChucVu, Email, DiaChi
    ) VALUES (
        p_MaNV, p_MatKhau, p_QuyenTruyCap, p_HoTen, p_SDT, p_GioiTinh, p_ChucVu, p_Email, p_DiaChi
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Thêm nhân viên thành công.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('L?i: ' || SQLERRM);
        ROLLBACK;
END ThemNhanVienQuanLy;

--Th?c thi
ACCEPT maNV NUMBER PROMPT 'Nh?p mã nhân viên: ';
ACCEPT matKhau CHAR PROMPT 'Nh?p m?t kh?u: ';
ACCEPT quyenTruyCap CHAR PROMPT 'Nh?p quy?n truy c?p: ';
ACCEPT hoTen CHAR PROMPT 'Nh?p h? tên: ';
ACCEPT sdt CHAR PROMPT 'Nh?p S?T: ';
ACCEPT gioiTinh CHAR PROMPT 'Nh?p gi?i tính: ';
ACCEPT chucVu CHAR PROMPT 'Nh?p ch?c v?: ';
ACCEPT email CHAR PROMPT 'Nh?p Email: ';
ACCEPT diaChi CHAR PROMPT 'Nh?p ??a ch?: ';

DECLARE
    v_maNV NUMBER := &maNV;
    v_matKhau VARCHAR2(20) := '&matKhau';
    v_quyenTruyCap VARCHAR2(50) := '&quyenTruyCap';
    v_hoTen VARCHAR2(200) := '&hoTen';
    v_sdt VARCHAR2(10) := '&sdt';
    v_gioiTinh VARCHAR2(4) := '&gioiTinh';
    v_chucVu VARCHAR2(50) := '&chucVu';
    v_email VARCHAR2(100) := '&email';
    v_diaChi VARCHAR2(200) := '&diaChi';
BEGIN
    ThemNhanVienQuanLy(
        v_maNV, v_matKhau, v_quyenTruyCap, v_hoTen, v_sdt, v_gioiTinh, v_chucVu, v_email, v_diaChi
    );
END;


----3
CREATE OR REPLACE PROCEDURE p_CapNhatTinhTrangPhong(p_MaPhong IN VARCHAR2, p_TinhTrangMoi IN VARCHAR2)
AS
BEGIN
    UPDATE Phong SET TinhTrang = p_TinhTrangMoi WHERE MaPhong = p_MaPhong;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Procedure executed successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;

ACCEPT v_MaPhong CHAR PROMPT 'Enter MaPhong: ';
ACCEPT v_TinhTrangMoi CHAR PROMPT 'Enter TinhTrangMoi: ';

Set SERVEROUTPUT ON
DECLARE
    v_MaPhong VARCHAR2(50) := '&v_MaPhong'; 
    v_TinhTrangMoi VARCHAR2(50) := '&v_TinhTrangMoi'; 
BEGIN
    p_CapNhatTinhTrangPhong(v_MaPhong, v_TinhTrangMoi);
END;

----4
CREATE OR REPLACE PROCEDURE p_LaySinhVienViPham(
    p_StartDate IN DATE,
    p_EndDate IN DATE
)
AS
    CURSOR student_cursor IS
        SELECT SV.MaSV, SV.HoTen, NoiDungNoiQuy , VP.NgayViPham
        FROM CTViPham VP
        JOIN SinhVien SV ON VP.MaSV = SV.MaSV
        LEFT JOIN NoiQuyKyLuat KL ON VP.MaKL = KL.MaKL
        WHERE VP.NgayViPham BETWEEN p_StartDate AND p_EndDate;

    v_MaSV SinhVien.MaSV%TYPE;
    v_HoTen SinhVien.HoTen%TYPE;
    v_NoiDungNoiQuy VARCHAR2(300);
    v_NgayViPham DATE;
BEGIN
    OPEN student_cursor;
    LOOP
        FETCH student_cursor INTO v_MaSV, v_HoTen, v_NoiDungNoiQuy, v_NgayViPham;
        EXIT WHEN student_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('MaSV: ' || v_MaSV || ', HoTen: ' || v_HoTen || ', NoiDungNoiQuy: ' || v_NoiDungNoiQuy || ',
        NgayViPham: ' || TO_CHAR(v_NgayViPham, 'DD-MON-YYYY HH24:MI:SS'));
    END LOOP;
    CLOSE student_cursor;
END;

DECLARE
    v_StartDate DATE := TO_DATE('2023-02-24', 'YYYY-MM-DD'); 
    v_EndDate DATE := TO_DATE('2023-02-28', 'YYYY-MM-DD');   
BEGIN
    p_LaySinhVienViPham(v_StartDate, v_EndDate);
END;

----5
CREATE OR REPLACE PROCEDURE p_LayPhongTrongTheoKhu(
    p_MaKhu IN NUMBER)
AS
    CURSOR RoomCurSor IS
        SELECT P.MaPhong, P.TenPhong, P.TinhTrang, LP.TenLoaiPhong
        FROM Phong P
        JOIN LoaiPhong LP ON P.MaLoaiPhong = LP.MaLoaiPhong
        WHERE P.MaKhu = p_MaKhu AND P.TinhTrang = N'Còn ch?';
BEGIN
    FOR room_rec IN RoomCursor LOOP
        DBMS_OUTPUT.PUT_LINE(room_rec.MaPhong || '-' || room_rec.TenPhong || '-' ||
                             room_rec.TinhTrang || '-' || room_rec.TenLoaiPhong);
    END LOOP;
END;

SET SERVEROUTPUT ON;
EXEC p_LayPhongTrongTheoKhu(1);

----------------Function-----------------
----1
CREATE OR REPLACE FUNCTION f_TinhTongChiPhiDienNuoc(
    p_TenPhong VARCHAR2,
    p_Thang NUMBER
) RETURN NUMBER AS
    v_TongChiPhi NUMBER;
BEGIN
    SELECT (SUM(GiaNuoc) + SUM(GiaDien))
    INTO v_TongChiPhi
    FROM DienNuocTieuThu DN JOIN PHONG P ON DN.MaPhong = P.MaPhong
    WHERE TenPhong = p_TenPhong AND Thang = p_Thang;

    RETURN v_TongChiPhi;
END f_TinhTongChiPhiDienNuoc;

DECLARE
    v_Result NUMBER;
BEGIN
    v_Result := f_TinhTongChiPhiDienNuoc('001', 3);
    DBMS_OUTPUT.PUT_LINE(N'Tong chi phi dien nuoc la: ' || v_Result);
END;


---2
CREATE OR REPLACE FUNCTION f_LaySVViPhamTheoLoaiKL(
    p_MaKL NUMBER
) RETURN SYS_REFCURSOR AS
    v_SVCursor SYS_REFCURSOR;
BEGIN
    OPEN v_SVCursor FOR
        SELECT SinhVien.*
        FROM SinhVien
        JOIN CTViPham ON SinhVien.MaSV = CTViPham.MaSV
        WHERE CTViPham.MaKL = p_MaKL;

    RETURN v_SVCursor;
END f_LaySVViPhamTheoLoaiKL;

DECLARE
    v_SVCursor SYS_REFCURSOR;
    v_SV SinhVien%ROWTYPE;
BEGIN
    v_SVCursor := f_LaySVViPhamTheoLoaiKL(11);
    LOOP
        FETCH v_SVCursor INTO v_SV;
        EXIT WHEN v_SVCursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('MaSV: ' || v_SV.MaSV || ', Ho ten: ' || v_SV.HoTen);
    END LOOP;
    CLOSE v_SVCursor;
END;

----3
CREATE OR REPLACE FUNCTION f_KiemTraTonTaiSinhVien(p_MaSV IN NUMBER)
RETURN BOOLEAN
AS
   v_TonTai BOOLEAN := FALSE;
   v_Count   NUMBER;
BEGIN
   SELECT COUNT(*) INTO v_Count FROM SinhVien WHERE MaSV = p_MaSV;

   IF v_Count = 1 THEN
      v_TonTai := TRUE;
   END IF;

   RETURN v_TonTai;
END f_KiemTraTonTaiSinhVien;


SET VERIFY OFF;
ACCEPT v_MaSV NUMBER FORMAT '9999999' PROMPT 'Nh?p MaSV: ';
DECLARE
    v_Exists BOOLEAN;
BEGIN
    v_Exists := f_KiemTraTonTaiSinhVien(&v_MaSV);
    IF v_Exists THEN
        DBMS_OUTPUT.PUT_LINE(N'Sinh viên có MaSV ' || &v_MaSV || N' t?n t?i.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(N'Sinh viên có MaSV ' || &v_MaSV || N' không t?n t?i.');
    END IF;
END;

----4
CREATE OR REPLACE FUNCTION f_LaySinhVienVaoTruocNgay(
    p_Ngay DATE
) RETURN SYS_REFCURSOR AS
    v_SVCursor SYS_REFCURSOR;
BEGIN
    OPEN v_SVCursor FOR
        SELECT *
        FROM SinhVien
        WHERE NgayVao < p_Ngay;

    RETURN v_SVCursor;
END f_LaySinhVienVaoTruocNgay;

DECLARE
    v_SVCursor SYS_REFCURSOR;
    v_SinhVienRec SinhVien%ROWTYPE;
BEGIN
    v_SVCursor := f_LaySinhVienVaoTruocNgay(TO_DATE('2023-03-02', 'YYYY-MM-DD'));
    LOOP
        FETCH v_SVCursor INTO v_SinhVienRec;
        EXIT WHEN v_SVCursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Mã Sinh Viên: ' || v_SinhVienRec.MaSV || ', H? Tên: ' || v_SinhVienRec.HoTen);
    END LOOP;
    CLOSE v_SVCursor;
END;


----5
CREATE OR REPLACE FUNCTION f_LayGiamGiaTheoLoaiSV(p_MaLoaiSV IN VARCHAR2)
RETURN NUMBER
AS
   v_GiamGia NUMBER;
BEGIN
   SELECT GiamGia INTO v_GiamGia FROM LoaiSV WHERE MaLoaiSV = p_MaLoaiSV;

   EXCEPTION
      WHEN NO_DATA_FOUND THEN
         DBMS_OUTPUT.PUT_LINE(N'Không tìm th?y d? li?u MaLoaiSV: ' || p_MaLoaiSV);
         v_GiamGia := 0; 

   RETURN v_GiamGia;
END f_LayGiamGiaTheoLoaiSV;


SET SERVEROUTPUT ON;
ACCEPT v_MaLoaiSV CHAR PROMPT 'Nh?p mã lo?i sinh viên: ';

DECLARE
    v_Result NUMBER;
    v_MaLoaiSV VARCHAR2(6);
BEGIN
    v_MaLoaiSV := '&v_MaLoaiSV';  
    v_Result := f_LayGiamGiaTheoLoaiSV(v_MaLoaiSV);
    DBMS_OUTPUT.PUT_LINE('GiamGia: ' || v_Result);
END;

------------------Package----------------------------
--Package p_QuanLyNhanVien
CREATE OR REPLACE PACKAGE pack_Employee AS
  PROCEDURE InsertEmployee(p_MaNV NUMBER,p_MatKhau VARCHAR2, p_QuyenTruyCap VARCHAR2,p_HoTen VARCHAR2,p_SDT VARCHAR2,
                            p_GioiTinh VARCHAR2,p_ChucVu VARCHAR2,p_Email VARCHAR2,p_DiaChi VARCHAR2);
  
  PROCEDURE UpdateEmployee(p_MaNV NUMBER,p_MatKhau VARCHAR2,p_QuyenTruyCap VARCHAR2,p_HoTen VARCHAR2, p_SDT VARCHAR2,
                            p_GioiTinh VARCHAR2,p_ChucVu VARCHAR2,p_Email VARCHAR2,p_DiaChi VARCHAR2);
  PROCEDURE DeleteEmployee(p_MaNV NUMBER);
END pack_Employee;
CREATE OR REPLACE PACKAGE BODY pack_Employee AS
  PROCEDURE InsertEmployee(p_MaNV NUMBER,p_MatKhau VARCHAR2,p_QuyenTruyCap VARCHAR2,p_HoTen VARCHAR2,p_SDT VARCHAR2,p_GioiTinh VARCHAR2,
  p_ChucVu VARCHAR2, p_Email VARCHAR2, p_DiaChi VARCHAR2) IS
  BEGIN
    INSERT INTO NhanVienQuanLy (MaNV,MatKhau,QuyenTruyCap,HoTen,SDT,GioiTinh,ChucVu,Email,DiaChi)
    VALUES ( p_MaNV,p_MatKhau,p_QuyenTruyCap,p_HoTen,p_SDT,p_GioiTinh,p_ChucVu,p_Email,p_DiaChi );
  END InsertEmployee;
  PROCEDURE UpdateEmployee(p_MaNV NUMBER,p_MatKhau VARCHAR2,p_QuyenTruyCap VARCHAR2,p_HoTen VARCHAR2,p_SDT VARCHAR2,
                            p_GioiTinh VARCHAR2,p_ChucVu VARCHAR2,p_Email VARCHAR2,p_DiaChi VARCHAR2) IS
  BEGIN
    UPDATE NhanVienQuanLy
    SET
      MatKhau = p_MatKhau, QuyenTruyCap = p_QuyenTruyCap,
      HoTen = p_HoTen, SDT = p_SDT, GioiTinh = p_GioiTinh,
      ChucVu = p_ChucVu, Email = p_Email,
      DiaChi = p_DiaChi
    WHERE MaNV = p_MaNV;
  END UpdateEmployee;
  PROCEDURE DeleteEmployee(p_MaNV NUMBER) IS
  BEGIN
    DELETE FROM NhanVienQuanLy WHERE MaNV = p_MaNV;
  END DeleteEmployee;
END pack_Employee;


BEGIN
  pack_Employee.InsertEmployee(1012, 'trungnam', 'NHANVIEN', N'Nguy?n Trung Nam', '0307625869', N'Nam', N'K? toán', 'trungnamufm@gmail.com', N'548 Lã Xuân Oai, Th? ??c, Tp.H? Chí Minh');
  pack_Employee.UpdateEmployee(1004, 'vuchien23', 'NHANVIEN', N'Võ Minh Chi?n', '0305785869', N'Nam', N'Nhân viên k? thu?t', 'vuminhchien98ufm@gmail.com', N'257 Lê V?n Vi?t, Qu?n 9, Tp.H? Chí Minh');
  pack_Employee.DeleteEmployee(1005);
END;


--Package p_QuanLyPhong
CREATE OR REPLACE PACKAGE Phong_Pkg AS
  PROCEDURE InsertPhong(p_MaPhong VARCHAR2, p_TenPhong VARCHAR2, p_TinhTrang VARCHAR2, p_MaKhu NUMBER, p_MaLoaiPhong NUMBER, p_MaNV NUMBER);
  PROCEDURE UpdatePhong(p_MaPhong VARCHAR2, p_TenPhong VARCHAR2, p_TinhTrang VARCHAR2, p_MaKhu NUMBER, p_MaLoaiPhong NUMBER, p_MaNV NUMBER);
  PROCEDURE DeletePhong(p_MaPhong VARCHAR2);
END Phong_Pkg;

CREATE OR REPLACE PACKAGE BODY Phong_Pkg AS
  PROCEDURE InsertPhong(p_MaPhong VARCHAR2,p_TenPhong VARCHAR2, p_TinhTrang VARCHAR2,p_MaKhu NUMBER,p_MaLoaiPhong NUMBER,p_MaNV NUMBER) AS
  BEGIN INSERT INTO Phong (MaPhong,TenPhong,TinhTrang,MaKhu,MaLoaiPhong,MaNV)
        VALUES (p_MaPhong,p_TenPhong,p_TinhTrang,p_MaKhu,p_MaLoaiPhong,p_MaNV);
  END InsertPhong;

  PROCEDURE UpdatePhong(p_MaPhong VARCHAR2,p_TenPhong VARCHAR2,p_TinhTrang VARCHAR2,p_MaKhu NUMBER,p_MaLoaiPhong NUMBER,p_MaNV NUMBER) AS
  BEGIN
    UPDATE Phong
    SET
      TenPhong = p_TenPhong,
      TinhTrang = p_TinhTrang,
      MaKhu = p_MaKhu,
      MaLoaiPhong = p_MaLoaiPhong,
      MaNV = p_MaNV
    WHERE MaPhong = p_MaPhong;
  END UpdatePhong;

  PROCEDURE DeletePhong(p_MaPhong VARCHAR2) AS
  BEGIN
    DELETE FROM Phong WHERE MaPhong = p_MaPhong;
  END DeletePhong;
END Phong_Pkg;
 
BEGIN
  Phong_Pkg.InsertPhong('2027E', '301', N'Còn ch?', 2, 2, 1005);
  Phong_Pkg.UpdatePhong('2016E', '201', N'Còn ch?', 1, 3, 1002);
  Phong_Pkg.DeletePhong('2017D');
END;


-- Package CTViPhamPackage
CREATE OR REPLACE PACKAGE CTViPhamPackage AS
  PROCEDURE InsertSVViPham(p_MaCTViPham NUMBER, p_MaKL NUMBER, p_MaSV NUMBER, p_NgayViPham DATE);

  PROCEDURE UpdateSVViPham(p_MaCTVPham NUMBER, p_MaKL NUMBER, p_MaSV NUMBER, p_NgayViPham DATE);

  PROCEDURE DeleteSVViPham(p_MaCTVPham NUMBER);
END CTViPhamPackage;

CREATE OR REPLACE PACKAGE BODY CTViPhamPackage AS
  PROCEDURE InsertSVViPham(p_MaCTViPham NUMBER, p_MaKL NUMBER, p_MaSV NUMBER, p_NgayViPham DATE) IS
  BEGIN
    INSERT INTO CTViPham (MaCTVPham, MaKL, MaSV, NgayViPham)
    VALUES (p_MaCTViPham, p_MaKL, p_MaSV, p_NgayViPham);
  END InsertSVViPham;

  PROCEDURE UpdateSVViPham(p_MaCTVPham NUMBER, p_MaKL NUMBER, p_MaSV NUMBER, p_NgayViPham DATE) IS
  BEGIN
    UPDATE CTViPham
    SET MaKL = p_MaKL, MaSV = p_MaSV, NgayViPham = p_NgayViPham
    WHERE MaCTVPham = p_MaCTVPham;
  END UpdateSVViPham;

  PROCEDURE DeleteSVViPham(p_MaCTVPham NUMBER) IS
  BEGIN
    DELETE FROM CTViPham WHERE MaCTVPham = p_MaCTVPham;
  END DeleteSVViPham;

END CTViPhamPackage;

DECLARE
BEGIN
  CTViPhamPackage.InsertSVViPham(16, 15, 2121, SYSDATE);
  CTViPhamPackage.UpdateSVViPham(12, 15, 2116, TO_DATE('27-FEB-23', 'DD-MM-YY'));
  CTViPhamPackage.DeleteSVViPham(13);
END;

--Package ThongKe_Pkg
CREATE OR REPLACE PACKAGE ThongKe_Pkg AS
    PROCEDURE Get_NhanVienQuanLy_Count(p_Count OUT NUMBER);
    PROCEDURE Get_SinhVien_Count(p_Count OUT NUMBER);
    PROCEDURE Get_Phong_Count(p_Count OUT NUMBER);

END ThongKe_Pkg;

CREATE OR REPLACE PACKAGE BODY ThongKe_Pkg AS
    PROCEDURE Get_NhanVienQuanLy_Count(p_Count OUT NUMBER) IS
    BEGIN
        SELECT COUNT(*) INTO p_Count FROM NhanVienQuanLy;
    END Get_NhanVienQuanLy_Count;

    PROCEDURE Get_SinhVien_Count(p_Count OUT NUMBER) IS
    BEGIN
        SELECT COUNT(*) INTO p_Count FROM SinhVien;
    END Get_SinhVien_Count;

    PROCEDURE Get_Phong_Count(p_Count OUT NUMBER) IS
    BEGIN
        SELECT COUNT(*) INTO p_Count FROM Phong;
    END Get_Phong_Count;

END ThongKe_Pkg;

DECLARE
    v_NhanVienQuanLy_Count NUMBER;
    v_SinhVien_Count NUMBER;
    v_Phong_Count NUMBER;
BEGIN
    ThongKe_Pkg.Get_NhanVienQuanLy_Count(v_NhanVienQuanLy_Count);
    ThongKe_Pkg.Get_SinhVien_Count(v_SinhVien_Count);
    ThongKe_Pkg.Get_Phong_Count(v_Phong_Count);

    DBMS_OUTPUT.PUT_LINE(N'So luong nhan vien: ' || v_NhanVienQuanLy_Count);
    DBMS_OUTPUT.PUT_LINE(N'So luong sinh vien: ' || v_SinhVien_Count);
    DBMS_OUTPUT.PUT_LINE(N'So luong phong: ' || v_Phong_Count);
END;

-----------------------Trigger--------------------
----1
CREATE OR REPLACE TRIGGER t_insert_ctvipham
BEFORE INSERT ON CTViPham
FOR EACH ROW
BEGIN
    :NEW.NgayViPham := SYSDATE;
END;

INSERT INTO CTViPham (MaCTVPham, MaKL, MaSV) VALUES (15,12, 2113);

----2
CREATE OR REPLACE TRIGGER t_update_SoLuongPhong
AFTER INSERT OR DELETE ON Phong
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        UPDATE KhuNha
        SET SoLuongPhong = SoLuongPhong + 1
        WHERE MaKhu = :NEW.MaKhu;
    ELSIF DELETING THEN
        UPDATE KhuNha
        SET SoLuongPhong = SoLuongPhong - 1
        WHERE MaKhu = :OLD.MaKhu;
    END IF;
END;

INSERT INTO Phong (MaPhong, TenPhong, TinhTrang, MaKhu, MaLoaiPhong, MaNV)
VALUES ('0002A', '005', N'Còn ch?', 1, 1, 1006);

DELETE FROM Phong
WHERE MaPhong = '2027E'

----3
CREATE OR REPLACE TRIGGER t_Insert_SinhVien
BEFORE INSERT ON SinhVien
FOR EACH ROW
DECLARE
    RoomCapacity NUMBER;
    CurrentStudents NUMBER;
BEGIN
    -- Get the maximum capacity of the room
    SELECT SoLuongSV INTO RoomCapacity
    FROM LoaiPhong
    WHERE MaLoaiPhong = (
        SELECT MaLoaiPhong
        FROM Phong
        WHERE MaPhong = :NEW.MaPhong
    );

    -- Get the current number of students in the room
    SELECT COUNT(*) INTO CurrentStudents
    FROM SinhVien
    WHERE MaPhong = :NEW.MaPhong;

    -- Check if the room is full
    IF CurrentStudents >= RoomCapacity THEN
        RAISE_APPLICATION_ERROR(-20001, N'Phòng ?ã ??y. Không th? thêm sinh viên');
    END IF;
END;

INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (000033, 10, TO_TIMESTAMP('04/11/2023', 'MM/DD/YYYY HH24:MI:SS'), 250000, 1003);
INSERT INTO HopDong (MaHDong, NgayTao, MaNV)
VALUES (1033, TO_TIMESTAMP('11/09/2023', 'MM/DD/YYYY HH24:MI:SS'), 1001);
INSERT INTO SinhVien VALUES (2133, 'efefefef', 'SINHVIEN', N'Tr?n Thanh Huy?n', 0703235893, N'Công ngh? thông tin', TO_DATE('11/09/2023', 'DD/MM/YYYY'),
TO_DATE('28/02/2023', 'DD/MM/YYYY'), TO_DATE('30/08/2024', 'DD/MM/YYYY'), 0000033, '2026E', 'LSV002', 1033);

---4
CREATE OR REPLACE TRIGGER t_KiemTraNgayThu
BEFORE INSERT ON HoaDonPhiO
FOR EACH ROW
BEGIN
    IF :new.NgayThu > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20006, N'Ngay thu khong the lon hon ngay hien tai.');
    END IF;
END;

INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (34, 11, SYSDATE, 250000, 1003);

INSERT INTO HoaDonPhiO (MaHDPhiO, Thang, NgayThu, SoTien, MaNV)
VALUES (35, 11, SYSDATE + 1, 250000, 1003);
    
----5
CREATE OR REPLACE TRIGGER t_delete_room
BEFORE DELETE ON Phong
FOR EACH ROW
DECLARE
    v_student_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_student_count
    FROM SinhVien
    WHERE MaPhong = :OLD.MaPhong;

    IF v_student_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, N'Phòng v?n còn sinh viên. Không th? xoá');
    END IF;
END;

DELETE FROM Phong
WHERE MaPhong = '0016C';

DELETE FROM Phong
WHERE MaPhong = '3016C';


---6
CREATE OR REPLACE TRIGGER t_KiemTraEmail
BEFORE INSERT OR UPDATE ON NhanVienQuanLy
FOR EACH ROW
DECLARE
    v_EmailCount NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_EmailCount
    FROM NhanVienQuanLy
    WHERE Email = :NEW.Email AND MaNV != :NEW.MaNV;

    -- Raise an error if the email address is not unique
    IF v_EmailCount > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, N'Email này ?ã t?n t?i.');
    END IF;
END;

INSERT INTO NhanVienQuanLy (MaNV, MatKhau, QuyenTruyCap, HoTen, SDT, GioiTinh, ChucVu, Email, DiaChi)
VALUES (1013, '123', 'NHANVIEN', N'Lê T?n L?c', 0123456789, N'Nam', N'Nhân viên k? thu?t', 'tanlocufm@gmail.com', N'123 Ph?m V?n ??ng, Th? ??c, TP H? Chí Minh');

INSERT INTO NhanVienQuanLy (MaNV, MatKhau, QuyenTruyCap, HoTen, SDT, GioiTinh, ChucVu, Email, DiaChi)
VALUES (1014, '123', 'NHANVIEN', N'Nguy?n Thi Minh', 0337856789, N'N?', N'K? toán', 'laanhufm@gmail.com', N'147 Nguy?n V?n Trí, Bình Th?nh, TP H? Chí Minh');
------------Role, User-------------------------
CREATE ROLE QuanLy;

GRANT SELECT, INSERT, UPDATE, DELETE ON SinhVien TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON LoaiSV TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON LoaiPhong TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON NhanVienQuanLy TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON DienNuocTieuThu TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON HoaDonPhiPhatSinh TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON HoaDonPhiO TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON HopDong TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON TaiSan TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON NoiQuyKyLuat TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON CTViPham TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON KhuNha TO QuanLy;
GRANT CREATE VIEW TO QuanLy;
GRANT CREATE TRIGGER TO QuanLy;
GRANT CREATE PROCEDURE TO QuanLy;

CREATE ROLE NhanVien;
GRANT SELECT, INSERT, UPDATE, DELETE ON SinhVien TO NhanVien;
GRANT SELECT, INSERT, UPDATE, DELETE ON LoaiSV TO NhanVien;
GRANT SELECT, INSERT, UPDATE, DELETE ON LoaiPhong TO NhanVien;
REVOKE SELECT, INSERT, UPDATE, DELETE ON NhanVienQuanLy FROM NhanVien;
GRANT SELECT, INSERT, UPDATE, DELETE ON DienNuocTieuThu TO NhanVien;
GRANT SELECT, INSERT, UPDATE, DELETE ON HoaDonPhiPhatSinh TO NhanVien;
GRANT SELECT, INSERT, UPDATE, DELETE ON HoaDonPhiO TO NhanVien;
GRANT SELECT, INSERT, UPDATE, DELETE ON HopDong TO NhanVien;
GRANT SELECT, INSERT, UPDATE, DELETE ON TaiSan TO NhanVien;
GRANT SELECT, INSERT, UPDATE, DELETE ON NoiQuyKyLuat TO NhanVien;
GRANT SELECT, INSERT, UPDATE, DELETE ON CTViPham TO NhanVien;
GRANT SELECT, INSERT, UPDATE, DELETE ON KhuNha TO QuanLy;
GRANT CREATE VIEW TO NhanVien;
GRANT CREATE TRIGGER TO NhanVien;
GRANT CREATE PROCEDURE TO NhanVien;

CREATE ROLE SinhVien;
GRANT SELECT ON DienNuocTieuThu TO SinhVien;
GRANT SELECT ON HoaDonPhiPhatSinh TO SinhVien;
GRANT SELECT ON HoaDonPhiO TO SinhVien;
GRANT SELECT ON HopDong TO SinhVien;


CREATE USER TruongBanQuanLy IDENTIFIED BY 123456;
GRANT QuanLy TO TruongBanQuanLy;

CREATE USER QuanLyPhong IDENTIFIED BY 123456;
GRANT NhanVien TO QuanLyPhong;

CREATE USER KeToan IDENTIFIED BY 123456;
GRANT NhanVien TO KeToan;

CREATE USER NhanVienKyThuat IDENTIFIED BY 123456;
GRANT NhanVien TO NhanVienKyThuat;

CREATE USER SV1 IDENTIFIED BY 123456;
GRANT SinhVien TO SV1;

CREATE USER SV2 IDENTIFIED BY 123456;
GRANT SinhVien TO SV2;


