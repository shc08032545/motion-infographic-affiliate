# Motion Infographic Affiliate Studio (v2.9)

โปรเจกต์สร้างชุดงานวิดีโอ **Motion Infographic 30 วินาที (9:16)** สำหรับสินค้า Affiliate แบบ Master Prompt เดียวอัตโนมัติครบ 5 Phase พร้อมระบบจัดเก็บไฟล์ Output ลง **Google Drive** โดยอัตโนมัติ

## โครงสร้างโปรเจกต์
- `SKILL.md` — คู่มือและสเปก **Motion Infographic Affiliate Skill v2.9** ฉบับเต็ม (รองรับโหมด `YES VIDEO` และ `NO VIDEO`)
- `scripts/upload_to_drive.sh` — สคริปต์สร้างโฟลเดอร์ย่อยตามชื่อสินค้าและอัปโหลดไฟล์ Output ทั้งหมดขึ้น Google Drive
- `outputs/` — โฟลเดอร์พักไฟล์ Output บนเครื่องก่อน/หลังซิงก์ขึ้น Google Drive

## ตำแหน่งจัดเก็บไฟล์ Output บน Google Drive
- **Drive Path:** `My Drive / 04_AI_โปรเจกต์และโน้ต / โปรเจกต์และเอกสาร_AI / motion-infographic-affiliate`
- **Folder ID:** `1DaX-ltIh5DHTt-qGrK3rRZxmdz-M5nXW`
- **Link:** https://drive.google.com/drive/folders/1DaX-ltIh5DHTt-qGrK3rRZxmdz-M5nXW

## วิธีใช้งานผ่าน Telegram Bot หรือ Antigravity
1. เปิด `/menu` ใน Telegram แล้วเลือก **🛍 Affiliate Studio (30 วิ)** (หรือพิมพ์ `/affiliate`)
2. ส่ง **รูปภาพสินค้า + ชื่อ/จุดเด่นสินค้า** มาได้เลย
3. เลือกโหมดที่ Gate 1: **YES VIDEO** (มีเสียงพากย์จากวิดีโอ) หรือ **NO VIDEO** (ไม่มีเสียงพูด มี Motion Infographic + VO Script แยก)
4. ระบบจะสร้าง Master Prompt ครบทุก Phase (Assets → Storyboard 3 แผ่น → Story-to-Video 3 ฉาก → Audio/VO/Keyword → Thumbnail + QA), บันทึกไฟล์ `.md` และอัปโหลดขึ้น Google Drive ให้อัตโนมัติพร้อมส่งลิงก์กลับมาทาง Telegram

## อัปโหลดไฟล์ Output ขึ้น Drive ด้วยตนเอง
```bash
./scripts/upload_to_drive.sh "product_name_20261124" "./outputs/product_name_20261124"
```
