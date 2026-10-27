# Huong dan van hanh GreenTech K26

## 1. Muc dich

Huong dan nhan vien khoi tao thu muc, chay robot loc log, kiem tra bao cao va doi soat tai nguyen tram. Ten file va thu muc su dung kebab-case, khong dau, khong khoang trang.

## 2. Chay script loc log tren Windows

Tu thu muc goc cua du an, chay:

```bat
scripts\auto_report.bat
```

Script se doc `data\log-he-thong.log`, loc cac dong chua `CRITICAL`, `ERROR` hoac `TIMEOUT`, sau do noi vao `backup\bao-cao-su-co.txt`.

## 3. Chay script loc log tren Linux/macOS

```bash
chmod +x scripts/auto_report.sh
./scripts/auto_report.sh
```

## 4. Checklist kiem tra he thong

- [ ] Kiem tra ket noi cac tram cam bien.
- [ ] Kiem tra log moi phat sinh va cac loi `CRITICAL` / `ERROR` / `TIMEOUT`.
- [ ] Mo bao cao trong `backup/` va xac nhan thoi gian chay.
- [ ] Doi soat ma linh kien tren Excel; xu ly cac dong `KIEM TRA MA`.
- [ ] Sao luu bao cao truoc khi thay doi cau hinh.
- [ ] Xac nhan `.env` nam trong `.gitignore` va khong chua secret trong file mau.

## 5. Bang thong so mau

| Tram | RAM | Ngay lap dat | Ghi chu |
|---|---:|---|---|
| tram-01 | 8GB | 2026-01-10 | SSD Kingston 512GB |
| tram-02 | 16GB | 2026-01-12 | SSD Samsung 1TB |
| tram-08 | 8GB | 2026-02-12 | Ma linh kien can audit |

## 6. Quy tac an toan

Khong dung `>` neu muc tieu la noi them vao bao cao. Dung `>>` de append. Khong chay `del /f /s /q` hoac lenh xoa tuong tu truoc khi kiem tra thu muc dich, danh sach tep va ban sao luu.
