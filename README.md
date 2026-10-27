# GreenTech K26 - He thong quan tri ha tang

Bo bai thuc hanh ve tu duy he thong IPO/DIKW, quan ly cay thu muc, tu dong hoa loc log, chuan hoa tai lieu va doi soat tai nguyen bang Excel.

## Cau truc du an

```text
greentech-system/
├── docs/
│   ├── README.md
│   └── srs-he-thong.docx
├── scripts/
│   ├── init_structure.bat
│   ├── auto_report.bat
│   └── auto_report.sh
├── data/
│   ├── log-he-thong.log
│   └── quan-ly-thiet-bi.xlsx
├── backup/
│   └── bao-cao-su-co.txt
├── .env.example
├── .env
├── .gitignore
└── README.md
```

## Chay robot loc log tren Windows

1. Mo CMD hoac PowerShell tai thu muc goc `greentech-system`.
2. Chay lenh:

   ```bat
   scripts\auto_report.bat
   ```

3. Mo `backup\bao-cao-su-co.txt` de xem ket qua. Moi lan chay se **noi them** bao cao, khong xoa noi dung cu.

Script dung `type` ket hop `findstr` qua pipe (`|`) de loc dong chua `CRITICAL`, `ERROR` hoac `TIMEOUT`. Cach xu ly theo dong giup tranh phai mo toan bo log trong trinh soan thao; pipe van se doc tuan tu qua tep nguon.

## Chay tren Linux/macOS

Mo Terminal tai thu muc goc va chay:

```bash
chmod +x scripts/auto_report.sh
./scripts/auto_report.sh
```

## Khoi tao cay thu muc tu dau

Neu bat dau trong mot thu muc du an rong, co the dung mau lenh CMD sau tu **thu muc cha**:

```bat
mkdir greentech-system\docs greentech-system\scripts greentech-system\data greentech-system\backup
```

Hoac chay `scripts\init_structure.bat` trong bo du an de dam bao cac thu muc can thiet ton tai. Lenh `mkdir` se khong xoa noi dung da co.

## Doi soat Excel

Mo `data/quan-ly-thiet-bi.xlsx`:

- Sheet `danh-muc-linh-kien`: bang cha, khoa chinh `ma_linh_kien`.
- Sheet `trang-thai-tram`: bang con, khoa ngoai `ma_linh_kien`.
- Cot `ma_linh_kien_chuan` dung `TRIM` de loai bo khoang trang dau/cuoi.
- Cac cot `ten_thiet_bi`, `don_gia`, `loai_storage` tra cuu bang `VLOOKUP(..., FALSE)`.
- Dong `tram-08` co ma `LK-SSD-404` khong co trong danh muc, duoc danh dau `KIEM TRA MA` de minh hoa quy trinh audit.

## IPO va DIKW

- **Input:** `data/log-he-thong.log`.
- **Process:** `scripts/auto_report.bat` hoac `scripts/auto_report.sh` loc log.
- **Output:** `backup/bao-cao-su-co.txt`.
- **Data:** cac dong log tho.
- **Information:** log duoc loc theo tu khoa loi.
- **Knowledge:** nhan dien loai loi / tram lap lai.
- **Wisdom:** uu tien dieu tra, sua cau hinh hoac nang cap thiet bi dua tren bang chung.

## Luu y bao mat

- Khong commit `.env` len repository cong khai. Chi commit `.env.example` voi cac khoa cau hinh khong nhay cam.
- Khong chay lenh xoa de xuat tu AI neu chua kiem tra duong dan va pham vi anh huong.
- Bao cao trong `backup/` dang la mau thuc hanh; can xac minh truoc khi dung cho xu ly su co thuc te.
