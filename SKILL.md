---
name: motion-infographic-affiliate
version: 2.9
description: สร้างชุดงานวิดีโอ Motion Infographic 30 วินาที (9:16) สำหรับสินค้า Affiliate แบบ Master Prompt เดียว ทำงานอัตโนมัติจนจบโดยไม่ถามระหว่างทาง ตรวจการแนบ Storyboard image เข้ากับงานสร้างวิดีโอจริง และล็อกความยาว VO ตามเวลาพูดธรรมชาติ เริ่มจาก Assets แล้วสร้าง Storyboard Sheet 3 แผ่นแยกกัน (1 แผ่นต่อ 1 Scene; แต่ละแผ่น 9:16 แบบ 4 Panels) ก่อนทำ Story-to-Video 3 ฉาก และจบด้วย Thumbnail มี 2 โหมด YES VIDEO (เสียงมาจากวิดีโอเลย) และ NO VIDEO (วิดีโอไม่มีเสียงพูด เล่าเรื่องด้วย motion infographic คำสำคัญ พากย์ใส่ตอนตัดต่อ พร้อม Tagged VO และ Clean TTS Script ที่ตรงกัน) ใช้เมื่อผู้ใช้ส่งข้อมูล/ภาพสินค้าเพื่อทำคลิปขาย หรือสั่ง /assets, /scene, /single, /vo, /kw, /thumbnail (หรือ /trumpnail)
---

# Motion Infographic Affiliate Skill v2.9

## 1. เป้าหมายและหลักการ

สร้างชุดงานวิดีโอสินค้าที่ **เข้าใจง่ายใน 3 วินาทีแรก, เห็นประโยชน์จริง, และภาพต่อเนื่องเนียนทุกฉาก** ยึดหลัก 6 ข้อ

1. **ความถูกต้องมาก่อน** ใช้เฉพาะข้อมูลที่ผู้ใช้ให้ หรืออ่านได้ชัดจากภาพอ้างอิง ไม่เดา ไม่แต่งราคา รีวิว ผลลัพธ์
2. **Assets ก่อนวิดีโอ** สร้างภาพอ้างอิงมาตรฐาน (สินค้า พร็อพ ตัวละคร สถานที่) ให้ครบก่อน แล้วทุกฉากอ้างอิงชุดเดียวกัน
3. **สินค้าต้องเหมือนต้นฉบับ** รูปทรง สี ฉลาก โลโก้ ภาษาบนฉลาก ต้องไม่ถูกเปลี่ยน
4. **ต่อเนื่องด้วยระบบ ไม่ใช่โชค** ใช้ Continuity Bible เดียว, START/END FRAME เชื่อมฉาก, shot list มีไทม์โค้ด
5. **เรียบง่าย** กราฟิกน้อยแต่คม ข้อความสั้น ไม่บังสินค้า
6. **กระชับ** ตอบสั้น ไม่อธิบายยืดยาว ไม่ย้ำสิ่งที่ผู้ใช้รู้แล้ว

---

## 2. ขั้นตอนทำงาน (Pipeline)

**หลักการส่งงาน:** หลังทราบโหมด YES VIDEO / NO VIDEO แล้ว ให้สร้าง Master Prompt เดียวที่สั่ง Agent ทำงานทั้งหมดตั้งแต่ Assets จนจบงาน โดยทำทุกขั้นตามลำดับอัตโนมัติ ห้ามถาม ห้ามขออนุมัติ ห้ามรอคำว่า “พร้อม” และห้ามให้ผู้ใช้พิมพ์ continue ระหว่างทาง

**Autonomous Rule:** ห้ามถามคำถามระหว่าง Phase แม้ข้อมูลบางช่องจะไม่ครบ ให้ใช้ค่าเริ่มต้นที่ปลอดภัย สรุปกลุ่มเป้าหมาย/ฉาก/ตัวละครเองจากข้อมูลที่มี ตัดข้อมูลที่ยืนยันไม่ได้ออก และทำส่วนที่เหลือต่อจนจบ หากข้อมูลสินค้าขัดแย้ง ให้ยึดข้อมูลล่าสุดที่ผู้ใช้ระบุอย่างชัดเจน; ถ้ายังตัดสินไม่ได้ ให้ละเว้นประเด็นนั้นแทนการถาม ห้ามแต่งข้อมูลขึ้นเอง

**Single Prompt Rule:** ส่ง Master Prompt เพียงบล็อกเดียว ครอบคลุม Assets → Storyboard 3 แผ่น → Video 3 ฉาก → Audio/VO/Keyword → Thumbnail → Title/Hashtags → QA ห้ามแยกส่งเป็นหลายรอบ และห้ามจบแค่แผนหรือคำอธิบายเมื่อเครื่องมือสามารถสร้างชิ้นงานจริงได้

```
Intake → Gate 1: YES VIDEO / NO VIDEO
→ MASTER PROMPT เดียว: PHASE A Assets
→ PHASE B Storyboard Sheets (แยกตาม Scene)
→ PHASE C Story-to-Video Scene 1–3
→ PHASE D Audio / VO / Keyword ตามโหมด
→ PHASE E Thumbnail + Title + Hashtags + QA
→ จบงาน
```

| Phase | สิ่งที่ Master Prompt ต้องสั่งทำ |
|---|---|
| A. Assets | Product Character Sheet, Props, Character/Hand Model, Location Plate และ Continuity Bible ตามความจำเป็น |
| B. Storyboard | สร้าง Storyboard Sheet แยกเป็นราย Scene: 1 แผ่นต่อ 1 Scene; แต่ละแผ่นเป็น 9:16 และมี 4 Panels |
| C. Story-to-Video | สร้างวิดีโอ 3 ฉาก ฉากละ 10 วินาที โดยแต่ละฉากอ้างอิง Storyboard Sheet ของฉากตัวเอง |
| D. Audio / Text | YES: บทพูดและเสียงในคลิป; NO: ไม่มีเสียงพูด/เพลงในคลิป พร้อม Motion Infographic, Keyword Table และ VO Script แยก |
| E. Final | Thumbnail, ชื่อคลิป, Hashtags และตรวจ QA |

**ห้ามมี approval gates ระหว่าง Phase:** ให้โมเดลทำงานต่อเนื่องจนครบทุก Phase ในคำสั่งเดียว หากเครื่องมือปลายทางไม่สามารถสร้างทุก asset ในคำสั่งเดียว ให้สร้างตามลำดับทีละชิ้น/ทีละซีนภายในงานเดิมโดยอัตโนมัติ ห้ามถามผู้ใช้ให้พิมพ์ continue

### นิยามสองโหมด

| | YES VIDEO | NO VIDEO |
|---|---|---|
| เสียงบรรยาย | เจนเสียงพูดมากับวิดีโอ บทพูดอยู่ในพรอมต์ทุกฉาก | คลิปไม่มีเสียงพูด พากย์ใส่ทีหลัง |
| ส่งมอบ | พรอมต์ 3 ฉากพร้อม VOICE LOCK | พรอมต์ 3 ฉาก + KEYWORD TABLE + VO SCRIPT |
| เสียง | เลือกชาย/หญิงให้เหมาะกับสินค้าโดยอัตโนมัติ ล็อกเสียงเดียวกันทุกฉาก ไม่ต้องถามยืนยันเพิ่ม | ไม่มีเสียงพูด ไม่มีเพลง มีเฉพาะ SFX ธรรมชาติที่สัมพันธ์กับภาพ |
| ข้อความบนจอ | ใส่ได้ตามความเหมาะสม | ใช้ Motion Infographic คำสำคัญ 2–4 ชุดต่อฉาก เว้นผู้ใช้สั่งห้ามข้อความ |

### Gate 1: เลือกโหมด
- เมื่อได้รับข้อมูลสินค้า ให้ถามก่อนเสมอว่า **YES VIDEO / NO VIDEO**
- ก่อนผู้ใช้เลือก ห้ามสร้าง Output เต็ม ให้สรุปข้อมูลสินค้าเท่าที่ได้รับและถามโหมดเท่านั้น
- เมื่อผู้ใช้เลือกแล้ว ให้ส่ง Master Prompt เดียวครบทุก Phase ไม่ถามยืนยันเสียงหรือหยุดรอระหว่างงาน

### กติกาการถาม
- ถามโหมด YES VIDEO / NO VIDEO ได้เฉพาะตอนเริ่มรับงานสินค้า หากยังไม่เคยระบุโหมดในงานชุดนั้น
- หลังทราบโหมดแล้ว ห้ามถามคำถามใด ๆ ระหว่างทาง รวมถึงเรื่องเสียง ตัวละคร สถานที่ ราคา หรือการอนุมัติแต่ละ Phase
- ถ้าอ่านข้อมูลจากภาพหรือข้อความได้แล้ว ให้ใช้ข้อมูลนั้น ไม่ถามซ้ำ
- ข้อมูลที่ไม่จำเป็นหรือไม่มีหลักฐาน เช่น ราคา/โปรโมชัน ให้ละเว้นได้ ห้ามแต่งขึ้นเอง
- ถ้าข้อมูลจำเป็นไม่ครบ ให้ใช้ทางเลือกที่ไม่กล่าวอ้างเกินจริงและเดินหน้าทำงานต่อ พร้อมระบุข้อจำกัดสั้น ๆ ใน QA เท่านั้น

## 3. ข้อมูลที่ต้องรวบรวม (Intake)

| รายการ | สถานะ | ค่าเริ่มต้นถ้าไม่ระบุ |
|---|---|---|
| ชื่อสินค้า/แบรนด์/รุ่น | จำเป็นต่อการระบุตัวสินค้า | อ่านจากภาพ/ข้อความ; ถ้าไม่ชัดให้ใช้คำเรียกกลาง ๆ และไม่ถามคั่น workflow |
| จุดเด่น/การใช้งาน | จำเป็นต่อเนื้อหา | ดึงจากภาพ/ฉลากเท่าที่อ่านได้ชัด; ถ้าไม่ชัดให้เล่าเฉพาะสิ่งที่เห็น |
| ภาพอ้างอิงสินค้า | แนะนำ | ถ้าไม่มี ห้ามหยุดหรือถามซ้ำ ให้ใช้ข้อมูลข้อความที่มี สร้างภาพประกอบสินค้าแบบ generic โดยไม่แต่งรายละเอียดบรรจุภัณฑ์/โลโก้/รูปลักษณ์ที่มองไม่เห็น และแจ้งข้อจำกัดความเหมือนใน QA |
| กลุ่มเป้าหมาย | แนะนำ | สรุปจากประเภทสินค้า |
| ตัวละคร | ไม่บังคับ | **มือเท่านั้น (hands-only)** ไม่เห็นหน้า เพื่อลดความเสี่ยงหน้าไม่ต่อเนื่อง |
| สถานที่ | ไม่บังคับ | เลือกให้ 1 ที่ตามประเภทสินค้า |
| ราคา/โปรโมชัน | ไม่บังคับ | **ไม่ใส่ราคา** |
| แพลตฟอร์ม | ไม่บังคับ | ไม่ระบุ, CTA แบบกลาง |
| ขนาด/รุ่นย่อย (SKU) | ไม่บังคับ | โชว์ช่วงขนาดตามที่ผู้ใช้ให้ |
| ข้อกำหนดพิเศษ (ห้ามข้อความ, ห้ามเสียงพูด ฯลฯ) | ไม่บังคับ | ไม่มี |

---

## 4. ระบบเลือกแนวภาพอัตโนมัติ

เลือก **แนวหลัก 1 แบบ** ผสมแนวรองได้ 1 แบบ แล้วสรุปเหตุผลสั้น ๆ

| ประเภทสินค้า | แนวหลัก | แนวรอง | ระวัง |
|---|---|---|---|
| น้ำยา/สเปรย์ซ่อมบำรุง/ทำความสะอาด | Product Transformation | Before/After | ห้ามเร่งผลลัพธ์เหมือนเวทมนตร์ |
| ของใช้ในบ้าน/จัดระเบียบ | Before/After | Product Transformation | เปรียบเทียบอย่างยุติธรรม |
| แกดเจ็ต/อิเล็กทรอนิกส์/อุปกรณ์เสริมมือถือ | 3D Product Showcase | Viral Reveal | ห้ามสร้างสเปกที่ไม่มีข้อมูล |
| สินค้าราคาเข้าถึงง่าย/แพ็กคู่/ลดราคา | Value & Price | Viral Reveal | ใช้ราคาที่ผู้ใช้ให้เท่านั้น |
| สินค้าทั่วไป | Viral Product Reveal | 3D Showcase | Hook ต้องเกี่ยวกับสินค้า |
| สุขภาพ/ความงาม/อาหารเสริม | 3D Product Showcase | Viral Reveal | **ห้ามกล่าวอ้างผลลัพธ์** (หัวข้อ 12) |

1. **Product Transformation** เปลี่ยนสภาพ/ฉากเพื่อสื่อผลลัพธ์ที่มองเห็นได้
2. **3D Product Showcase** สินค้าเป็นพระเอก หมุนหรือเคลื่อนนุ่มนวล พร้อมกราฟิกชี้ฟังก์ชัน
3. **Before / After** เทียบก่อน-หลัง แสงและมุมกล้องต้องเท่ากัน
4. **Value & Price** เน้นราคา โปรโมชัน จำนวนชิ้น ความคุ้มค่า
5. **Viral Product Reveal** เปิดด้วยภาพสะดุดตา เผยสินค้า ปิดด้วย CTA

---

## 5. สเปกวิดีโอมาตรฐาน

- 30 วินาที = 3 ฉาก × 10 วินาที, 9:16, 1080×1920 (เปลี่ยนได้เมื่อผู้ใช้ระบุ)

| ฉาก | เวลา | หน้าที่ |
|---|---|---|
| Scene 1 | 0–10s | **Hook** ปัญหา/ความต้องการ/ภาพสะดุดตา จับความสนใจใน 2 วินาทีแรก |
| Scene 2 | 10–20s | **Demonstration** สาธิตการใช้หรือจุดเด่นหลักด้วยภาพ |
| Scene 3 | 20–30s | **Product Hero + CTA** โชว์สินค้าชัด สรุปประโยชน์ 2–3 ข้อ ชวนกดดูรายละเอียด |

- ปรับโครงสร้างได้เมื่อสินค้าต้องการ แต่ต้องคงเวลารวมและแจ้งเหตุผลสั้น ๆ
- ฉากไหนไม่มีสินค้าในเฟรม ต้องเขียนว่า "No product in frame" แต่สถานที่และแสงยังเป็นไปตาม Bible

---

## 6. PHASE A: Assets Pack

### 6.1 ระบบรหัส Asset

| Asset | ID | ใช้เมื่อ | เนื้อหาในภาพ | สัดส่วน |
|---|---|---|---|---|
| Product Character Sheet | `PRODUCT-01` | **เสมอ** | turnaround ของสินค้า: หน้า, เฉียง 3/4, ข้าง, หลัง (เฉพาะเมื่อมีภาพด้านหลังจากผู้ใช้), บน + แผงโคลสอัปรายละเอียด (ฉลาก, โลโก้, ฝา/หัวฉีด) บนพื้นหลังเทากลาง | 16:9 |
| Props Sheet | `PROPS-01` | เมื่อมีพร็อพรอง หรือมีสถานะก่อน/หลัง | พร็อพทุกชิ้นแยกชัด (เช่น บานพับสนิม, น็อต, ประแจ), สถานะก่อน/หลังของวัตถุ, ภาพสินค้าอยู่ในมือเพื่อกำหนดสเกล | 16:9 |
| Character Sheet | `CHAR-A` (`CHAR-B`) | เมื่อเห็นคนในเฟรม | เต็มตัวหน้า/ข้าง/หลัง, ใบหน้า 3 มุม, สีหน้า 3 แบบ, ชุดที่ล็อกแล้ว **ถ้า hands-only** ให้เป็น Hand Model Sheet: มือซ้าย-ขวา, สีผิว, ขนาด, เล็บ, ข้อมือ/แขนเสื้อ/ถุงมือ | 16:9 |
| Location Plate | `LOC-01` | **เสมอ** อย่างน้อย 1 ที่ | master wide + 2 มุมเสริม **ไม่มีคนและไม่มีสินค้า** ระบุแสง เวลา อุณหภูมิสี และผังว่าของวางตรงไหน | 16:9 |

- ชุดมาตรฐาน 3–4 ภาพ (PRODUCT-01, LOC-01 + PROPS-01/CHAR-A ตามความจำเป็น)
- NO VIDEO ใช้ PRODUCT-01 เสมอ ส่วนอื่นตามความจำเป็นของภาพ

### 6.2 กติกา Asset
- ทุกพรอมต์เริ่มด้วยบรรทัด reference: ใช้ภาพที่แนบเป็นแหล่งความจริงเดียว
- PRODUCT-01: ห้ามเติมข้อความหรือรายละเอียดฉลากที่ไม่เห็นในภาพอ้างอิง ถ้าไม่มีภาพด้านหลัง ไม่ทำมุมหลัง
- ตัวละครเป็นบุคคลสมมติ ผู้ใหญ่ ไม่อิงบุคคลจริงหรือคนดัง
- ในภาพ asset ห้ามมีข้อความ โลโก้ หรือลายน้ำอื่น (ยกเว้นที่อยู่บนตัวสินค้าเอง)
- ระบุสีเป็นชื่อสีชัดเจน และระบุขนาดสัมพัทธ์ของสินค้ากับมือ/พร็อพ

### 6.3 แม่แบบพรอมต์ Asset (ส่วนคำสั่งเป็นอังกฤษ)

**PRODUCT-01**
```
[REFERENCE] Use the attached product photo(s) as the only source of truth.
[ASSET] PRODUCT-01, product character sheet, 16:9.
[LAYOUT] Same product on neutral mid-grey seamless background: front, three-quarter, side, top<, back only if a back-view reference is attached>. Plus 2-3 close-up detail panels: <label/logo>, <cap/nozzle>.
[LIGHT] Even soft studio light, no harsh shadows, no glare covering the label. True colors.
[LOCK] Shape, proportions, colors, logo, label text and language exactly as the reference. Do not invent any label text.
[NEGATIVE] No hands, no props, no extra text, no watermark, no other brand.
```

**PROPS-01**
```
[REFERENCE] Attached product photo for scale and attached prop references (if any).
[ASSET] PROPS-01, props sheet, 16:9, neutral grey background, even soft light.
[CONTENT] <prop 1 with state A and state B>, <prop 2>, <prop 3>, each isolated and clearly separated. One panel: the product held in a hand for scale.
[LOCK] Product exactly as PRODUCT-01. Props keep the same design, color and wear level in every panel of the same state.
[NEGATIVE] No extra text, no watermark, no other brand.
```

**CHAR-A** (ถ้า hands-only ให้เปลี่ยนเป็น Hand Model Sheet)
```
[ASSET] CHAR-A, character sheet, 16:9, neutral grey background, even soft light.
[CHARACTER] <fictional adult, approx age, build, hair, skin tone, distinguishing features>. Wardrobe: <fixed outfit with colors>.
[LAYOUT] Full body front / side / back; face close-ups from 3 angles; 3 expressions: neutral, focused, satisfied.
[HAND MODEL variant] Left and right hand, back and palm, wrist and sleeve/glove shown, same skin tone and nail style in every panel.
[NEGATIVE] Not based on any real person or celebrity. No text, no logos, no accessories not listed.
```

**LOC-01**
```
[ASSET] LOC-01, location plate, 16:9, empty set: no people, no product.
[SET] <location>, <layout: what is placed where>, <surface materials and wear>.
[SHOTS] Master wide shot + 2 supporting angles of the same set, same objects in same positions.
[LIGHT] <time/setting>, key light from <direction>, <color temperature>K, <practical lights>.
[NEGATIVE] No people, no product, no text, no logos.
```

### 6.4 CONTINUITY BIBLE (สร้างใน Phase A)

บล็อกนี้ส่งพร้อม assets และจะถูกวาง **เหมือนเดิมทุกคำ** ที่ต้นพรอมต์ทุกฉาก ต้องตรงกับพรอมต์ LOC-01 และ CHAR-A (บรรทัด VOICE LOCK เลือกตามโหมด ไม่ใส่ทั้งสองทางเลือก, บรรทัด TEXT STYLE บังคับใน NO VIDEO และใส่ใน YES VIDEO เมื่อมีข้อความบนจอ)

```
[CONTINUITY BIBLE]
LOOK: photoreal commercial look, 35mm lens equivalent, shallow depth of field, subtle film grain, <grade>
LIGHT: <time/setting>, key light from <direction>, <color temperature>K, <practicals>. Do not change lighting between scenes.
PALETTE: <3-4 named colors>
LOCATION STATE: <where objects sit; what stays fixed>
CHARACTER: <fixed wardrobe or hand model; same in every shot>
PRODUCT HANDLING: label always faces camera, nozzle/cap points <direction>, held in <left/right> hand
SCREEN DIRECTION: main action moves left to right; never cross the 180-degree line
TEXT STYLE: Thai bold sans-serif, <1-2 palette colors> with soft shadow, pop-in 0.3s / hold at least 1.2s / fade-out 0.2s, thin-line icons, placed inside the safe zone, never over the product label or logo
VOICE LOCK: <YES VIDEO: Thai off-screen narrator, gender, age range, tone, pace, same voice in every scene | NO VIDEO: no speech, no narration, no singing>
AUDIO POLICY: YES VIDEO: Thai voiceover follows VOICE LOCK; music only if explicitly requested or supported by the target tool, otherwise omit. NO VIDEO: no speech, no narration, no singing, no music in generated clips; natural SFX only. Any optional music is added in post, not generated per scene.
```

### 6.5 รูปแบบ Output ของ Phase A
1. แนวที่เลือก + เหตุผล 1 บรรทัด และตั้งค่า 1 บรรทัด (ความยาว | อัตราส่วน | เสียง | ราคา | แพลตฟอร์ม)
2. ตารางรายการ assets (ID | ชื่อ | ใช้ทำอะไร)
3. พรอมต์ asset ทีละบล็อกโค้ด (1 บล็อก = 1 ภาพ)
4. บล็อก CONTINUITY BIBLE
5. ส่งต่อ Phase B ทันทีภายใน Master Prompt เดียว โดยใช้ Assets ที่เพิ่งสร้างเป็น references; ห้ามขอให้ผู้ใช้พิมพ์ "Assets พร้อม"

---

## 7. ระบบความต่อเนื่อง (Continuity System)

กฎทุกข้อใช้กับ Phase B, Phase C และ Phase D

1. **Bible เดียว** วางเหมือนเดิมทุกคำในทุกฉาก ห้ามเรียบเรียงใหม่
2. **แนบ reference ทุกฉาก** ระบุรหัส asset ที่ใช้ในฟิลด์ `[REFERENCES]` ทุกฉากที่เกี่ยวข้อง
3. **Frame handoff** END FRAME ของฉากก่อนต้องตรงกับ START FRAME ของฉากถัดไป (ตำแหน่งสินค้า มือ ของในฉาก แสง) ถ้าโมเดลรองรับ first-frame ให้ใช้เฟรมสุดท้ายของคลิปก่อนหน้าเป็นเฟรมแรกของคลิปถัดไป
4. **Shot list มีไทม์โค้ด** ฉากละ 2–3 ช็อต ช็อตละ 3–5 วินาที ไม่ยัดหลายการกระทำใน 1 ช็อต
5. **1 ฉาก = 1 การกระทำหลัก** และเขียนสถานะวัตถุต้น/ท้ายฉาก เช่น บานพับ: ฝืด → ลื่น
6. **Screen direction และ eyeline คงที่** ตามที่กำหนดใน Bible
7. **เลนส์และแสงคงที่** ห้ามเปลี่ยนเวลา สภาพอากาศ หรือทิศแสงระหว่างฉาก
8. **Transition ที่ต่อได้จริง** ใช้ match cut (องค์ประกอบหรือการเคลื่อนไหวเดียวกัน) แทนเอฟเฟกต์ล้ำ และไม่ย้ายสถานที่กลางเรื่องโดยไม่จำเป็น
9. **เสียงต่อเนื่อง** YES VIDEO: ใช้ VOICE LOCK เดียวกันทุกฉาก (เพศ โทน ความเร็ว สำเนียง) และให้ประโยคจบก่อนจบคลิป ไม่ตัดกลางคำ | NO VIDEO: คลิปไม่มีเสียงพูด พากย์ต่อเนื่องทั้งเรื่องในครั้งเดียวตอนตัดต่อ | ทั้งสองโหมด: ดนตรีเป็นก้อนเดียวใส่ตอนตัดต่อ ไม่ให้โมเดลสร้างเพลงแยกทุกฉาก
10. **Negative ชุดความต่อเนื่อง** ใส่ทุกฉาก: no change in outfit or hands, no new objects appearing, no lighting change, no face change, no location change
11. **ข้อความบนจอต่อเนื่อง** ใช้ TEXT STYLE เดียวกันทุกฉากและในปก (ฟอนต์ สี การเคลื่อนไหว ตำแหน่ง)

---

## 8. PHASE B: Storyboard Sheets (3 แผ่น แยก Scene ละ 1 แผ่น)

Phase B ต้องสร้าง Storyboard Sheet ให้ครบทั้ง 3 แผ่นก่อนเริ่ม Story-to-Video โดยทำต่อเนื่องภายใน Master Prompt เดียว ไม่รอการอนุมัติจากผู้ใช้

### ข้อกำหนดบังคับ
- สร้าง 3 ภาพแยกไฟล์/แยกผลลัพธ์: `STORYBOARD-SCENE-01`, `STORYBOARD-SCENE-02`, `STORYBOARD-SCENE-03`
- แต่ละภาพเป็นแนวตั้ง 9:16, 1080×1920, มี exactly 4 panels ใน grid 2×2
- แต่ละ Sheet แสดงลำดับช็อต 4 ช่วงภายใน Scene เดียวเท่านั้น ห้ามรวมหลาย Scene ลงใน Sheet เดียว
- แต่ละ Panel ต้องแสดง action/pose, product state, ตำแหน่งสินค้า, camera framing/angle และองค์ประกอบฉากอย่างชัดเจน
- Panels เรียงตามเวลาและเป็นเหตุการณ์ต่อเนื่องกัน ไม่ใช่ 4 แนวคิดหรือ 4 มุมทางเลือก
- ใช้ Global Timecode เพื่ออ้างอิงทั้งคลิป และ Local Timecode ภายใน Scene ให้ตรงกัน:
  - Scene 1: Global `00:00–00:02.5`, `00:02.5–00:05`, `00:05–00:07.5`, `00:07.5–00:10`; Local `00:00–00:02.5` ถึง `00:07.5–00:10`
  - Scene 2: Global `00:10–00:12.5`, `00:12.5–00:15`, `00:15–00:17.5`, `00:17.5–00:20`; Local `00:00–00:02.5` ถึง `00:07.5–00:10`
  - Scene 3: Global `00:20–00:22.5`, `00:22.5–00:25`, `00:25–00:27.5`, `00:27.5–00:30`; Local `00:00–00:02.5` ถึง `00:07.5–00:10`
- แสดงเลข Panel 1–4 และ timecode กำกับในแต่ละ panel อย่างอ่านง่าย; timecode เป็น storyboard annotation ไม่ใช่ video overlay
- YES VIDEO: วางภาพและจังหวะการแสดง/การบรรยาย ไม่ใส่บทพูดลงใน Sheet
- NO VIDEO: วางภาพและจังหวะ motion infographic; ข้อความจริงให้กำหนดใน Scene prompts ของ Phase C
- รักษา PRODUCT LOCK, Character/Hand Lock, Location, Lighting, Color, Camera Language และ Continuity Bible เดียวกันทั้ง 3 Sheets
- ห้ามสร้างรายละเอียดสินค้า ฉลาก โลโก้ หรือข้อความบนบรรจุภัณฑ์เพิ่มจาก reference

### Output ของ Phase B
สร้าง prompt แยก 3 บล็อก (หนึ่งบล็อกต่อหนึ่ง Sheet) และระบุให้เครื่องมือสร้าง/ส่งออกเป็น 3 ภาพแยกกัน จากนั้นไป Phase C ทันที

### แม่แบบ Storyboard Sheet Prompt (ใช้ซ้ำแยกกัน 3 ครั้ง)
```
[ASSET ID] STORYBOARD-SCENE-<01/02/03>
[REFERENCES] Attach the exact approved assets: PRODUCT-01, PROPS-01, CHAR-A, LOC-01 as applicable.
[CONTINUITY BIBLE] Use the exact same Bible for all three storyboard sheets and all video scenes.
[FORMAT] Create ONE separate vertical 9:16 storyboard sheet, 1080x1920, exactly four panels in a clean 2x2 grid. Do not combine scenes.
[SCENE SCOPE] This sheet covers Scene <1/2/3> only, global time <00:00-00:10 / 00:10-00:20 / 00:20-00:30>.
[PANEL 1] <global and local timecode>; opening composition and first action beat.
[PANEL 2] <global and local timecode>; next chronological beat, maintain spatial and object continuity.
[PANEL 3] <global and local timecode>; next chronological beat, show the action progression.
[PANEL 4] <global and local timecode>; final beat and exact end-frame composition for this scene.
[CONTINUITY] Same product identity, packaging, character/hand model, wardrobe, props, location, lighting, palette and screen direction. Each panel is the next moment in this same scene.
[LAYOUT] Four equal clearly separated panels, numbered 1-4, readable global and local timecodes, no extra panels, no title page.
[NEGATIVE] No product redesign, no invented label text, no extra products, no inconsistent character, no location or lighting changes, no watermark, no extra text except panel numbers and timecodes.
```

### Handoff ไป Phase C
- Scene 1 ใช้ `STORYBOARD-SCENE-01` เท่านั้น; Panel 1 เป็น opening target และ Panel 4 เป็น end-frame target
- Scene 2 ใช้ `STORYBOARD-SCENE-02` เท่านั้น; Panel 1 เป็น start-frame target และ Panel 4 เป็น end-frame target
- Scene 3 ใช้ `STORYBOARD-SCENE-03` เท่านั้น; Panel 1 เป็น start-frame target และ Panel 4 เป็น final-frame target
- END FRAME ของ Scene 1 ต้องตรงกับ START FRAME ของ Scene 2; END FRAME ของ Scene 2 ต้องตรงกับ START FRAME ของ Scene 3 โดยอาจใช้เฟรม handoff ร่วมกันหรือ match composition ให้ตรง
- หากเครื่องมือไม่รองรับการสร้างหลายภาพพร้อมกัน ให้สร้าง Sheet 01 → 02 → 03 ทีละภาพโดยอัตโนมัติ ห้ามรอคำว่า "Storyboard พร้อม" และห้ามขอให้ผู้ใช้พิมพ์ continue

### 8.4 Storyboard-to-Video Attachment Protocol (บังคับ)
- การอ้างชื่อ `STORYBOARD-SCENE-01/02/03` ใน prompt อย่างเดียว **ไม่ถือว่าแนบภาพแล้ว** ต้องนำไฟล์ภาพ Storyboard ที่สร้างจริงของ Scene นั้นไปแนบเป็น image input/reference ในงานสร้างวิดีโอของ Scene เดียวกัน
- Mapping ต้องตรงกัน: `STORYBOARD-SCENE-01` → Video Scene 1, `STORYBOARD-SCENE-02` → Video Scene 2, `STORYBOARD-SCENE-03` → Video Scene 3 ห้ามใช้ภาพผิด Scene
- ตรวจการยืนยันจากหน้าจอ/ผลลัพธ์ของเครื่องมือว่าไฟล์ถูกแนบจริงก่อนสั่ง Generate ห้ามกล่าวว่าแนบสำเร็จจากการเขียนชื่อไฟล์ใน prompt เพียงอย่างเดียว
- ให้โมเดลวิดีโอตีความ Panel 1→2→3→4 เป็นลำดับช็อตต่อเนื่อง ไม่ใช่ภาพ collage ที่ต้องปรากฏในวิดีโอ; output ต้องเป็นภาพเต็มเฟรม 9:16 และห้ามแสดงกรอบ 2×2 หรือ storyboard sheet ในคลิป
- หากเครื่องมือรองรับภาพเดียว: ใช้ storyboard sheet เป็น image input หลัก/Start Frame และใช้ Panel 1 เป็น opening target; ระบุ Panels 2–4 เป็น shot guidance ใน prompt หรือส่งภาพ panel แยกเป็น references เพิ่มเมื่อเครื่องมือรองรับ
- หากแนบภาพไม่สำเร็จ ให้ retry การแนบ 1 ครั้ง หากยังไม่รองรับ ให้ดำเนินงานต่อด้วย shot descriptions และระบุ `Storyboard attachment unavailable` ใน QA อย่างตรงไปตรงมา ห้ามอ้างว่าใช้ภาพอ้างอิงสำเร็จ

---

## 9. PHASE C: Story-to-Video (ทั้ง YES และ NO VIDEO)

ลำดับฟิลด์คงที่ ใส่เฉพาะที่จำเป็น ส่วนคำสั่งเป็นอังกฤษ ส่วน VOICEOVER และ ON-SCREEN TEXT เป็นไทยตามที่จะปรากฏจริง

```
[STORYBOARD REFERENCE] ACTUALLY ATTACH the matching scene-specific image file to the video-generation task (not filename-only or prompt-only); use only `STORYBOARD-SCENE-01/02/03` for its matching scene; follow Panels 1→2→3→4 as this scene’s shot map
[REFERENCES]       attach: PRODUCT-01, PROPS-01, CHAR-A, LOC-01 (เฉพาะที่ฉากนี้ใช้)
[CONTINUITY BIBLE] (วางเหมือนกันทุกฉาก)
[PRODUCT LOCK]     1-2 บรรทัด: ตรงกับ PRODUCT-01 ทุกประการ + จุดระบุตัวตนสำคัญ (สี โลโก้ ชิ้นส่วนเด่น)
[FORMAT]           9:16 vertical, 1080x1920, 10 seconds
[START FRAME]      เฟรมแรกของฉากนี้ (ตรงกับ END FRAME ฉากก่อน)
[SHOT LIST]        0-3s ... / 3-7s ... / 7-10s ...
[CAMERA]           การเคลื่อนกล้อง (ไม่เกิน 1-2 แบบต่อฉาก)
[END FRAME]        เฟรมสุดท้ายของฉากนี้ (เป็น START FRAME ของฉากถัดไป)
[VOICEOVER]        (YES VIDEO เท่านั้น) เฉพาะคำพูดไทยพร้อม tag เวลา [M:SS.s-M:SS.s] ต่อบรรทัด ไม่มีข้อความอื่น ตามหัวข้อ 10
[AUDIO]            (NO VIDEO เท่านั้น) No speech, no narration, no singing, no music; natural SFX only
[ON-SCREEN TEXT]   NO VIDEO (บังคับ): motion infographic คำสำคัญ 2–4 คำ พร้อม tag เวลาและการเคลื่อนไหว ตามหัวข้อ 10 | YES VIDEO: ข้อความบนจอ (ถ้ามี)
[SFX]              เสียงประกอบที่จำเป็น
[NEGATIVE]         ข้อห้ามสำคัญ + ชุดความต่อเนื่อง (หัวข้อ 7 ข้อ 10)
```

- Scene 1 อ้างอิง `STORYBOARD-SCENE-01` ทั้ง 4 Panels; Panel 1 เป็น opening frame และ Panel 4 เป็น end-frame target
- Scene 2 อ้างอิง `STORYBOARD-SCENE-02` ทั้ง 4 Panels; Panel 1 เป็น start-frame target และ Panel 4 เป็น end-frame target
- Scene 3 อ้างอิง `STORYBOARD-SCENE-03` ทั้ง 4 Panels; Panel 1 เป็น start-frame target และ Panel 4 เป็น final-frame target
- ฉากแรกไม่มี START FRAME จากฉากก่อน ให้ระบุเฟรมเปิดตาม Bible
- ฉากสุดท้ายให้ END FRAME เป็นเฟรมจบที่มี CTA

**กติกาตามโหมด**
- **YES VIDEO:** ใส่ VOICEOVER ทุกฉาก ฟิลด์นี้มีเฉพาะบรรทัดคำพูดพร้อม Local Timecode ของฉากนั้น (0:00–0:10) ลักษณะเสียง (off-screen narrator, เพศ, โทน) อยู่ที่ VOICE LOCK ใน Bible เท่านั้น ตั้งเป้าเริ่มพูด 0:00.3–0:00.5 และจบ 0:09.2–0:09.5 โดยยึดความเป็นธรรมชาติและห้ามตัดกลางคำ ถ้าให้ตัวละครพูดหน้ากล้อง ต้องใช้ CHAR-A และระบุ lip-sync ตามบท ถ้าเสียงไทยไม่ชัด ให้สลับเป็น NO VIDEO
- **NO VIDEO:** ไม่ใช้ฟิลด์ VOICEOVER ใส่ "No speech, no dialogue, no narration, no singing, no lip-sync" ใน NEGATIVE ถ้ามีตัวละครเห็นหน้า ให้ระบุ closed mouth หรือ natural mouth movement without speech ช็อตต้องเว้นจังหวะให้พากย์ตามไทม์โค้ดได้ และภาพต้องตรงกับ VO SCRIPT (หัวข้อ 10) ฟิลด์ ON-SCREEN TEXT บังคับ: ใส่ motion infographic คำสำคัญ 2–4 คำต่อฉาก และให้ NEGATIVE ระบุ "no text other than the specified keywords" แทน "No text overlay"

---

## 10. เสียงบรรยายและข้อความบนจอ

**Voiceover**
- ภาษาไทยธรรมชาติแบบเพื่อนบอกเพื่อน ไม่ขายตรง ไม่ตะโกน
- **เป้าหมายคือเสียงพูดต้องเต็มคลิป 30 วินาทีจริง ไม่ใช่จบก่อนเวลา** ห้ามเขียนบทสั้นจนเหลือช่วงเงียบยาว
- NO VIDEO: VO SCRIPT รวม 26–28 วินาทีของเวลาพูดจริง ภายในคลิป 30 วินาที เผื่อช่วงหายใจ/เว้นจังหวะรวมประมาณ 2–4 วินาที
- YES VIDEO: บทพูดในแต่ละคลิป 10 วินาทีควรเริ่มที่ 0:00.3–0:00.5 และจบที่ 0:09.2–0:09.5 ทำให้มีช่วงพูดประมาณ 8.7–9.2 วินาทีต่อฉาก โดยยึดเวลาที่อ่านได้จริงอย่างเป็นธรรมชาติ ไม่บังคับให้ครบตัวเลขหากทำให้พูดเร็วหรือผิดธรรมชาติ; ห้ามปล่อยเงียบ 3–5 วินาทีโดยไม่มีเหตุผล
- ปริมาณตั้งต้น 40–48 พยางค์ต่อฉาก หรือ 120–144 พยางค์รวม เป็นเพียง heuristic สำหรับร่างบทเท่านั้น ไม่ใช่ข้อบังคับและไม่ใช่ตัวตัดสินเวลา ให้ใช้การอ่านออกเสียง/การประเมินระยะเวลาพูดจริงเป็นหลัก
- ประเมินเวลาจากการอ่านภาษาไทยด้วยความเร็วธรรมชาติของเสียงที่เลือก ไม่ยึดอัตราพยางค์/วินาทีเป็นสูตรตายตัว หากสั้นให้เพิ่มเฉพาะรายละเอียดที่มีหลักฐาน เช่น วิธีใช้ จุดเด่นที่ผู้ใช้ให้ หรือสถานการณ์ใช้งาน; หากยาวให้ตัดคำฟุ่มเฟือย ห้ามเร่ง TTS เพื่อชดเชยบทที่ยาวเกิน
- 1 ประโยค 1 ประเด็น ใช้คำที่คนใช้จริง พูดลื่นแบบเพื่อนเล่าให้เพื่อนฟัง ไม่เร่งอ่านเพื่อให้ครบเวลา
- ชื่อแบรนด์ต่างประเทศให้ใส่คำอ่านไทยในบทพูด เช่น "โซแน็ก"
- การเลือกเพศเสียงต้องมีเหตุผลที่ตรวจสอบได้ เช่น ลักษณะการใช้งาน กลุ่มเป้าหมาย

**รูปแบบคำพูด (ใช้กับ VO SCRIPT ของ NO VIDEO และฟิลด์ [VOICEOVER] ของ YES VIDEO)**
- บล็อกคำพูดมี **เฉพาะคำพูดเท่านั้น** ไม่มีชื่อฉาก ไม่มี cue ไม่มีหมายเหตุ ไม่มีตั้งค่าเสียง ไม่มีเครื่องหมายคำพูดครอบ
- ทุกบรรทัดขึ้นต้นด้วย **tag เวลา** `[M:SS.s-M:SS.s]` ตามด้วย **emotional tag** ในวงเล็บเหลี่ยม เช่น `[curious]`, `[surprised]`, `[empathetic]`, `[excited]`, `[confident]`, `[friendly]`, `[reassuring]`, `[playful]`, `[serious]`, `[urgent]` แล้วจึงตามด้วยคำพูด 1 ประโยคหรือ 1 วลีต่อ 1 บรรทัด
- **บังคับใส่ emotional tag ทุกบรรทัด** เลือกให้ตรงกับความหมายของประโยคและจังหวะเรื่อง ไม่ใช้ tag เดียวทั้งคลิปโดยไม่จำเป็น และต้องรักษาบุคลิก/โทนเสียงหลักให้ต่อเนื่อง
- กำหนดอารมณ์ตามหน้าที่ของแต่ละช่วง: Hook ใช้ curious / surprised / urgent ตามเนื้อหา; ช่วงเล่าปัญหาใช้ empathetic / frustrated / concerned; ช่วงสาธิตใช้ interested / confident / reassuring; ช่วงสรุปหรือ CTA ใช้ friendly / excited / persuasive แบบไม่ยัดเยียด
- Emotional tag เป็นคำสั่งกำกับการแสดงเสียง **ห้ามอ่านออกเสียง** และห้ามนับรวมเป็นคำพูดหรือจำนวนพยางค์ VO
- ห้ามใส่อารมณ์เกินจริง ตะโกน หรือเปลี่ยนอารมณ์ฉับพลันโดยไม่มีเหตุผล ให้เป็นการแสดงอารมณ์ระดับธรรมชาติแบบคนพูดจริง
- ตัวอย่างรูปแบบ:

```text
[0:00.5-0:04.0] [curious] เคยเจอปัญหาแบบนี้กันไหม
[0:04.0-0:08.5] [empathetic] เราก็เคยหงุดหงิดกับเรื่องนี้เหมือนกัน
```

- **NO VIDEO:** เวลาเป็นไทม์ไลน์ทั้งคลิป (0:00–0:30) ส่งเป็นบล็อกเดียว คัดลอกไปเจนเสียงได้ทันที
- **YES VIDEO:** เวลาเป็น Local Timecode ของคลิปนั้น (0:00–0:10) ใส่ในฟิลด์ [VOICEOVER] ของแต่ละฉาก
- **NO VIDEO:** VO SCRIPT ใช้ Global Timecode ของวิดีโอทั้งชุด (0:00–0:30); ห้ามรีเซ็ตเวลาเป็น 0:00 เมื่อขึ้น Scene 2 หรือ Scene 3
- YES VIDEO: เริ่มพูดที่ 0:00.3–0:00.5 และจบที่ 0:09.2–0:09.5 เป็นเป้าหมายมาตรฐาน; ปรับได้เล็กน้อยตามจังหวะธรรมชาติและข้อจำกัดของเสียง แต่ห้ามตัดกลางคำ
- NO VIDEO: จัดช่วงพูดด้วย Global Timecode และเว้นหายใจรวมประมาณ 2–4 วินาทีตลอด 30 วินาที
- **VO Duration QA บังคับ:** หลังเขียนบท ให้ประเมินระยะเวลาพูดจากการอ่านจริง/ความเร็วธรรมชาติ (ใช้จำนวนพยางค์เป็น heuristic เท่านั้น; ไม่นับ emotional tag) ตรวจทุก Scene และเวลารวม หากสั้นกว่าเป้าหมายให้เขียนใหม่ให้ยาวขึ้นด้วยข้อมูลจริง; หากยาวเกินให้ตัดคำฟุ่มเฟือย ไม่เร่งความเร็วเสียงเพื่อกลบบทที่ผิดเวลา
- ชื่อแบรนด์ ตัวย่อ และตัวเลข เขียนเป็นคำอ่านไทยเต็ม (เช่น "โซแน็ก", "สามร้อยมิลลิลิตร") ทุกบรรทัดตรงกับภาพช่วงนั้น และไม่มีคำกล่าวอ้างต้องห้าม (หัวข้อ 12)
- ข้อมูลอื่นที่ไม่ใช่คำพูด ย้ายไปเป็น **หมายเหตุ 1–2 บรรทัดใต้บล็อก** เช่น เสียงที่แนะนำ (เพศ โทน) และตั้งค่า ElevenLabs Multilingual v2: Stability 45–55%, Similarity 75–85%, Style 20–35%, Speed 1.0x ±0.05 ส่วนจุด cue ของภาพอยู่ใน SHOT LIST
- tag เวลาและ emotional tag เป็น metadata สำหรับกำกับเสียง/ตัดต่อ ไม่ใช่คำพูด; ถ้าเครื่องมือเจนเสียงอ่านวงเล็บหรือ tag ออกเสียง ให้ลบ tag ทั้งสองชนิดก่อนส่งข้อความเข้า TTS แล้วตั้งอารมณ์ตาม tag แยกต่างหากถ้าเครื่องมือรองรับ

**NO VIDEO: Tagged VO + Clean TTS Script (บังคับทั้งคู่)**
- ส่ง 2 เวอร์ชันทุกครั้ง: (A) `TAGGED VO SCRIPT` มี Global Timecode และ emotional tag ทุกบรรทัด; (B) `CLEAN TTS SCRIPT` เป็นข้อความคำพูดล้วนสำหรับนำเข้า TTS
- `CLEAN TTS SCRIPT` ต้องมีคำพูดตรงกับ `TAGGED VO SCRIPT` ทุกคำ ตามลำดับเดิม ห้ามเขียนใหม่ สรุป เพิ่ม ลด สลับประโยค หรือแก้สำนวน; ลบออกเฉพาะ timestamp และ emotional tag เท่านั้น
- ก่อนส่ง ตรวจแบบเทียบคำต่อคำหลังถอด metadata แล้ว หากไม่ตรงให้แก้จนเหมือนกัน 100%
- Timestamps ใน Tagged VO เป็น Global Timecode 0:00–0:30; timestamps ของ Motion Infographic ใน prompt วิดีโอเป็น Local Timecode 0:00–0:10 ต่อ Scene และ KEYWORD TABLE ต้องแสดงทั้ง Local/Global Timecode

**Motion infographic คำสำคัญ (NO VIDEO: บังคับ)**
- คลิปไม่มีเสียงพูด จึงใช้ข้อความ motion infographic เล่าเรื่องแทน ฉากละ 2–4 คำสำคัญ เรียงตามเรื่อง (Hook: ปัญหา/ความต้องการ → Demo: ฟังก์ชัน/วิธีใช้ → CTA: ประโยชน์/ชวนกด)
- คำสำคัญเป็นไทย 1–4 พยางค์ (หรือวลีสั้นไม่เกิน 6 พยางค์ 2 บรรทัด) มาจากข้อมูลผู้ใช้หรือฉลาก และผ่านกฎหัวข้อ 12
- ทุกคำมี tag เวลาเข้า-ออก `[M:SS.s-M:SS.s]` โดยใช้ Local Timecode ของ Scene นั้น (0:00–0:10) พร้อมระบุ Global Timecode คู่กันใน KEYWORD TABLE เพื่อวางตัดต่อได้ตรงทั้งคลิป และระบุรูปแบบการเคลื่อนไหว เช่น kinetic typography เด้งเข้า, ไอคอนเส้นบางลอยประกอบ, callout ชี้จุดเด่น
- แต่ละคำค้างบนจออย่างน้อย 1.2 วินาที ไม่ทับกัน อยู่ในโซนปลอดภัย ไม่บังสินค้า ฉลาก หรือโลโก้ และใช้ `TEXT STYLE` เดียวกันทั้งคลิปและปก (กำหนดใน Bible)
- รูปแบบในพรอมต์ฉาก (ข้อความไทยเขียนตรงตัวอักษรในเครื่องหมายคำพูด):

```
[ON-SCREEN TEXT] motion infographic, TEXT STYLE per Bible. [0:01.0-0:03.0] "คำที่ 1" (pop-in, upper left); [0:04.0-0:06.5] "คำที่ 2" with thin-line icon (slide-in, right); [0:07.0-0:09.0] "คำที่ 3" (callout pointing at the feature)
```

- ส่ง **KEYWORD TABLE** ทุกครั้งหลัง Phase C โดยมีคอลัมน์: Scene | Local Timecode | Global Timecode | คำสำคัญ | การเคลื่อนไหว เพื่อใช้เป็นแผนสำรองตัดต่อ
- ถ้าโมเดลเขียนตัวอักษรไทยเพี้ยนหลังลองใหม่ 2 รอบ ให้เจนฉากเป็น clean plate (NEGATIVE: no text overlay) แล้วใส่คำสำคัญตาม KEYWORD TABLE ตอนตัดต่อ

**On-screen text**
- พาดหัวไม่เกิน 4–6 พยางค์ต่อบรรทัด ไม่เกิน 2 บรรทัดต่อช็อต
- ตัวใหญ่ คอนทราสต์สูง อยู่ในโซนปลอดภัยของ 9:16 (เว้นขอบบน/ล่างสำหรับ UI แพลตฟอร์ม)
- ไม่บังโลโก้และฉลากสินค้า ใช้เฉพาะข้อมูลที่ตรวจสอบได้
- ถ้าผู้ใช้ห้ามข้อความบนจอ ให้ลบ ON-SCREEN TEXT ทั้งหมดและเพิ่ม "No text overlay" ใน NEGATIVE

---

## 11. Motion และเสียงประกอบ

- Motion ที่ใช้: camera push-in, smooth orbit, parallax, kinetic typography, infographic callout, match cut
- ทุกการเคลื่อนไหวต้องมีเหตุผล (เน้นจุดเด่น/นำสายตา)
- SFX ตรงกับจังหวะภาพ ไม่ใส่ทุกจุด
- หลีกเลี่ยง: กราฟิกแน่น, เอฟเฟกต์บังสินค้า, ตัดเร็วเกินจนอ่านข้อความไม่ทัน

---

## 12. ความปลอดภัยของคำกล่าวอ้าง (Claim Safety)

**ใช้ได้:** คุณสมบัติที่เห็นจากฉลาก/ข้อมูลผู้ใช้, ขนาดและราคาที่ผู้ใช้ให้

**ห้าม**
- ตัวเลขประสิทธิภาพ เวลา เปอร์เซ็นต์ที่ไม่มีข้อมูล เช่น "เห็นผลใน 5 วินาที", "99%"
- คำสัมบูรณ์ เช่น "ดีที่สุด" "ชัวร์ 100%" "หายขาด" เว้นแต่ผู้ใช้ให้หลักฐาน
- รีวิว คะแนน ยอดขาย ป้าย Best Seller ที่ผู้ใช้ไม่ได้ให้ (ป้ายบนภาพสินค้าของร้านอื่นไม่ใช่ข้อมูลที่ใช้ซ้ำได้)
- การกล่าวอ้างทางการแพทย์/สุขภาพ/ความงาม เช่น รักษา ลดน้ำหนัก ขาวใน X วัน
- การเปรียบเทียบเชิงลบกับแบรนด์อื่น
- ฉากที่ขัดกับคำเตือนบนฉลาก เช่น สเปรย์ติดไฟใกล้เปลวไฟ

**ถ้าผู้ใช้ขอข้อความที่เสี่ยง:** บอกสั้น ๆ ว่าเสี่ยงอะไร เสนอข้อความทางเลือกที่ปลอดภัย แล้วทำต่อ ไม่ปฏิเสธทั้งงาน

---

## 13. PHASE E: Thumbnail (ขั้นสุดท้ายเสมอ)

สร้างให้อัตโนมัติท้ายทุกงาน ไม่ต้องรอผู้ใช้สั่ง (สั่ง `/thumbnail` หรือ `/trumpnail` เพื่อขอเพิ่มหรือแก้ได้) ถ้าโปรเจกต์มี ART AFFILIATE HOOK SYSTEM ให้ใช้กฎนั้นกำกับเพิ่มเติม

- แนวตั้ง 9:16 (หรือสัดส่วนที่ผู้ใช้ระบุ)
- อ้างอิง `PRODUCT-01` (และ `CHAR-A` / `LOC-01` ถ้าใช้ในวิดีโอ) และวาง Continuity Bible ชุดเดียวกัน เพื่อให้ปกตรงกับตัวคลิป
- เห็นสินค้าชัด ขนาดประมาณ 40–60% ของความสูงเฟรม และมีบริบทการใช้งานถ้าเหมาะ
- **มี TITLE TEXT บนปกทุกครั้ง** ข้อความไทยสั้น 1–2 บรรทัด (รวมไม่เกินประมาณ 10 พยางค์) เป็นจุดขายหลักเดียว ตัวใหญ่ อ่านออกในขนาดเล็ก ตรงกับข้อมูลผู้ใช้/ฉลาก เขียนตรงตัวอักษรในเครื่องหมายคำพูด ใช้ TEXT STYLE เดียวกับ Bible อยู่ในโซนปลอดภัย ไม่บังสินค้าหรือโลโก้ มีข้อความรอง (SUB) ได้ไม่เกิน 1 บรรทัด เช่น ขนาด/แพ็ก ถ้าผู้ใช้ให้ข้อมูลนั้น
- จุดโฟกัสเดียว คอนทราสต์สูง เว้นโซนปลอดภัยบน/ล่างสำหรับ UI
- ห้ามใส่คำกล่าวอ้าง คุณสมบัติ หรือโปรโมชันที่ผู้ใช้ไม่ได้ให้
- ถ้าโมเดลเขียนตัวอักษรไทยเพี้ยนหลังลองใหม่ 2 รอบ ให้เจนปกเป็น clean plate (เว้นพื้นที่ title ไว้) แล้วส่ง TITLE TEXT พร้อมตำแหน่งให้ใส่ตอนตัดต่อ

```
[REFERENCES]  attach: PRODUCT-01 (+ CHAR-A, LOC-01 ถ้าใช้)
[CONTINUITY BIBLE] (ชุดเดียวกับวิดีโอ)
[PRODUCT LOCK] ตรงกับ PRODUCT-01 ทุกประการ
[FORMAT]      9:16 vertical, 1080x1920, single image
[COMPOSITION] จุดโฟกัสและตำแหน่งสินค้า/ตัวละคร
[TITLE TEXT]  "ข้อความหัวข้อ" (ตำแหน่ง ขนาด สไตล์ตาม TEXT STYLE) + [SUB TEXT] "..." (ถ้ามี)
[NEGATIVE]    ไม่มีข้อความอื่นนอกจาก TITLE/SUB, ไม่บังโลโก้, ไม่มีราคา/ส่วนลดที่ผู้ใช้ไม่ได้ให้
```

---

## 14. รูปแบบ Output และคำสั่งคัดลอก

### 14.1 YES VIDEO
หลังผู้ใช้เลือก YES VIDEO ให้ส่ง **Master Prompt เดียวในบล็อกโค้ดเดียว** ครอบคลุม Assets → Continuity Bible → Storyboard Sheets แยก Scene → Story-to-Video 3 ฉาก → เสียงพูด/VOICE LOCK → Thumbnail (Phase E) → Title/Hashtags → QA โดยเลือกเสียงชายหรือหญิงให้เหมาะกับสินค้าโดยอัตโนมัติ ไม่ถามยืนยันเสียงเพิ่ม

### 14.2 NO VIDEO
หลังผู้ใช้เลือก NO VIDEO ให้ส่ง **Master Prompt เดียวในบล็อกโค้ดเดียว** ครอบคลุม Assets → Continuity Bible → Storyboard Sheets แยก Scene → Story-to-Video 3 ฉาก (ไม่มีเสียงพูดและเพลง) → Motion Infographic → KEYWORD TABLE → Tagged VO SCRIPT + Clean TTS SCRIPT (คำพูดตรงกันทุกคำ) → Thumbnail (Phase E) → Title/Hashtags → QA

### 14.3 รูปแบบ Storyboard Sheets (ข้อบังคับใหม่)
- วิดีโอมาตรฐานมี 3 Scenes ดังนั้นต้องสร้าง Storyboard Sheet **3 แผ่นแยกจากกัน**
- `STORYBOARD-SCENE-01` ใช้เฉพาะ Scene 1; `STORYBOARD-SCENE-02` ใช้เฉพาะ Scene 2; `STORYBOARD-SCENE-03` ใช้เฉพาะ Scene 3
- แต่ละแผ่นเป็นภาพแนวตั้ง 9:16 แยกเป็น 4 Panels แบบ 2×2 ภายในแผ่นนั้น
- Panels ทั้ง 4 แสดงลำดับช็อต/การเคลื่อนไหวภายใน Scene เดียวกัน ไม่ใช่เอา 4 ช่วงเวลาของทั้งคลิป 30 วินาทีมารวมกัน
- ใส่เลข Panel 1–4 พร้อมทั้ง Global Timecode และ Local Timecode ให้ชัดตามตารางเวลาในหัวข้อ 8; ห้ามใช้ timecode 00:00/00:10/00:20/00:30 เป็นตัวแทน 4 Panels ภายใน Scene เดียว
- ห้ามรวม Storyboard ของหลาย Scene ลงในภาพเดียว และห้ามส่ง Sheet เดียวใช้แทนทุก Scene
- Video Scene n ต้องอ้างอิง Storyboard Sheet n เท่านั้น และใช้ Panels 1→2→3→4 เป็น shot map ของ Scene นั้น
- ทุก Sheet ต้องรักษา Product Lock, Character/Hand Lock, Location, Lighting, Color, Camera Language และ Continuity Bible เดียวกัน

### 14.4 คำสั่ง
| ผู้ใช้พิมพ์ | ส่งมอบ |
|---|---|
| `Code copy` / `/scene` | พรอมต์ฉากตามที่ร้องขอ; หากไม่ได้ระบุ ให้ใช้ Master Prompt เดียวตามค่าเริ่มต้น |
| `Code copy prompt เดียว` / `/single` | Master Prompt ครบทุก Phase ในบล็อกเดียว |
| `/assets` | เฉพาะส่วน Assets ที่ร้องขอ |
| `/storyboard` | Storyboard Sheets แยก Scene ละ 1 Sheet (ค่าเริ่มต้น 3 แผ่น) |
| `/vo` | VO SCRIPT ใหม่หรือแก้ไข |
| `/kw` | KEYWORD TABLE ใหม่หรือแก้ไข (NO VIDEO) |
| `/thumbnail` / `/trumpnail` | พรอมต์ Thumbnail |

- ค่าเริ่มต้นหลังเลือกโหมดคือ **Master Prompt เดียวจบงาน** ไม่แบ่งส่งเป็น Phase และไม่หยุดรอผู้ใช้
- ถ้าแพลตฟอร์มจำกัดจำนวนภาพ/วิดีโอต่อครั้ง ให้สั่งสร้างทีละรายการตามลำดับโดยอัตโนมัติใน workflow เดียว ห้ามให้ผู้ใช้พิมพ์ continue
- ก่อน QA ให้บันทึกสถานะ Storyboard attachment แยก Scene: ATTACHED / NOT SUPPORTED / FAILED; ใช้ ATTACHED ได้ต่อเมื่อเครื่องมือยืนยันการแนบจริงเท่านั้น
- ในโหมดคัดลอก ให้ส่งบล็อกโค้ดที่คัดลอกใช้งานได้ พร้อมหมายเหตุสั้น ๆ เท่าที่จำเป็น

## 15. ตรวจคุณภาพก่อนส่งมอบ (QA Checklist)

ตรวจในใจทุกครั้ง ไม่ต้องแสดงรายการเว้นแต่พบปัญหา

**ทั่วไป**
- [ ] ผ่าน Gate 1: ผู้ใช้เลือก YES VIDEO / NO VIDEO แล้ว; หลังจากนั้นทำงานต่อครบทุก Phase โดยไม่มี approval gate ระหว่างทาง
- [ ] มี Storyboard Sheet แยก 1 แผ่นต่อ 1 Scene รวม 3 แผ่น; แต่ละแผ่นเป็น 9:16 แบบ 4 panels (2×2), มี Global + Local Timecode ตามหัวข้อ 8 และตรงกับ Assets + Continuity Bible
- [ ] Story-to-Video ทั้ง 3 scenes อ้างอิง Storyboard Sheet ของ Scene นั้นโดยเฉพาะ และใช้ Panel 1→2→3→4 เป็น shot map ภายใน Scene
- [ ] ตรวจยืนยันว่า Storyboard image ของแต่ละ Scene ถูกแนบเป็น image input/reference จริงใน video task; ถ้า tool ไม่รองรับ ต้องระบุ limitation ใน QA และห้ามอ้างว่าแนบสำเร็จ
- [ ] เวลารวมถูกต้อง (ฉากละ 10s, รวม 30s) และบทพูดกินเวลาตามเป้าหมาย: YES เริ่ม 0:00.3–0:00.5 จบ 0:09.2–0:09.5 โดยยังฟังเป็นธรรมชาติ; NO เวลาพูดจริงรวม 26–28s
- [ ] VO Duration QA ผ่าน: ประเมินพยางค์/ความเร็วพูด ตรวจทุก timecode และแก้บทที่สั้นหรือยาวเกินก่อนส่ง
- [ ] YES VIDEO: ทุกฉากมี VOICEOVER และ VOICE LOCK เดียวกัน | NO VIDEO: ไม่มีฟิลด์ VOICEOVER, NEGATIVE มี no speech และมี VO SCRIPT ตรงกับไทม์โค้ดและภาพ
- [ ] NO VIDEO: ทุกฉากมี motion infographic คำสำคัญ 2–4 คำ พร้อม tag เวลา ตรง KEYWORD TABLE, ข้อความไทยเขียนตรงตัวอักษร และมี TEXT STYLE ใน Bible
- [ ] บล็อกคำพูด (VO SCRIPT / VOICEOVER) ทุกบรรทัดมี tag เวลาและ emotional tag ครบ; tag ไม่ถูกอ่านออกเสียง และไม่มี cue หมายเหตุ หรือชื่อฉากปนอยู่
- [ ] YES VIDEO: VO เริ่มและจบตามเป้าหมาย 0:00.3–0:00.5 ถึง 0:09.2–0:09.5 โดยไม่เร่งเสียงผิดธรรมชาติ | NO VIDEO: Tagged VO ใช้ Global Timecode 0:00–0:30 และ Clean TTS Script ตรงกับคำพูดทุกคำหลังถอด metadata
- [ ] KEYWORD TABLE มีทั้ง Local และ Global Timecode ถูกต้องตาม Scene
- [ ] ปกมี TITLE TEXT 1 ชุด ตรงข้อมูลจริง ไม่บังสินค้าและโลโก้
- [ ] ไม่มีข้อมูลที่ผู้ใช้ไม่ได้ให้ (ราคา รีวิว ตัวเลข) และไม่มีคำกล่าวอ้างต้องห้าม
- [ ] ข้อห้ามของผู้ใช้ถูกปฏิบัติ (เช่น ไม่เอาข้อความบนฉาก)
- [ ] กราฟิกไม่แน่น ไม่บังสินค้าและโลโก้

**ความต่อเนื่อง**
- [ ] CONTINUITY BIBLE เหมือนกันทุกคำในทุกฉากและในปก
- [ ] ทุกฉากที่มีสินค้ามี REFERENCES และ PRODUCT LOCK ตรง PRODUCT-01
- [ ] END FRAME ฉาก n ตรงกับ START FRAME ฉาก n+1 (ตำแหน่งสินค้า มือ ของในฉาก แสง)
- [ ] สถานะวัตถุต่อกัน (ก่อน → หลัง) ไม่ย้อนหรือกระโดด
- [ ] สถานที่ ชุด มือ/ตัวละคร ทิศแสง และทิศการเคลื่อนที่ไม่เปลี่ยน
- [ ] ทุกฉากมี NEGATIVE ชุดความต่อเนื่อง

---

## 16. กรณีพิเศษ

| สถานการณ์ | การจัดการ |
|---|---|
| ไม่มีภาพอ้างอิงสินค้า | ห้ามถามหรือหยุด workflow; ใช้ข้อมูลข้อความที่มี ทำภาพสินค้าแบบ generic เท่าที่จำเป็น ห้ามแต่งโลโก้ ฉลาก สี รูปทรง หรือรายละเอียดที่ไม่มีหลักฐาน และระบุข้อจำกัดใน QA |
| มีภาพอ้างอิงหลายมุม | ใช้ภาพด้านหน้าเป็นหลัก ภาพอื่นเป็นรายละเอียดเสริมสำหรับ PRODUCT-01 |
| สินค้ามีหลายขนาด | PRODUCT-01 ใช้ขนาดหลัก 1 ขนาด ขนาดอื่นระบุเป็นสัดส่วน ไม่เปลี่ยนดีไซน์ |
| หลายสินค้าในชุดเดียว | ทำ PRODUCT-01, PRODUCT-02 แยกกัน และระบุตำแหน่ง/ลำดับในเฟรม |
| ผู้ใช้ไม่ระบุตัวละคร | ใช้ hands-only ตามค่าเริ่มต้น |
| ผู้ใช้อัปโหลด assets ที่เจนแล้ว | ทำ Asset QA แล้วสร้าง Phase B Storyboard Sheet |
| ผู้ใช้อัปโหลด Storyboard Sheet | ตรวจว่าเป็น Sheet ของ Scene ใด มี 4 panels และ timecode ถูกต้อง แล้วใช้กับ Scene นั้นเท่านั้น |
| ผู้ใช้ขอแก้เฉพาะ asset | ส่งเฉพาะพรอมต์ asset นั้น และแจ้งว่าฉากที่อ้างอิง asset นี้ต้องใช้ภาพใหม่ |
| ผู้ใช้ขอแก้เฉพาะบางฉาก | ส่งเฉพาะฉากนั้น พร้อมตรวจ START/END FRAME ที่เชื่อมกับฉากข้างเคียง |
| ผู้ใช้เปลี่ยนความยาว | ปรับจำนวนฉากและเวลา รักษา Hook → Demo → CTA และการเชื่อมเฟรม |
| ผู้ใช้ไม่เอาเสียงพูดเลย (ไม่พากย์ด้วย) | ใช้ NO VIDEO ไม่ทำ VO SCRIPT และเพิ่มคำสำคัญเป็น 3–4 คำต่อฉากเพื่อเล่าเรื่องแทนเสียง |
| YES VIDEO แล้วเสียงไทยเพี้ยน/ไม่ชัด | สลับเป็น NO VIDEO (ฉากนั้นหรือทั้งชุด) แล้วพากย์ตอนตัดต่อ |
| ผู้ใช้เปลี่ยนโหมดกลางงาน | ใช้ assets และ Bible เดิม ปรับ Phase C (สลับ VOICE LOCK / เพิ่ม-ตัด VO SCRIPT) |
| ผู้ใช้ไม่เอาข้อความบนจอ | ตัด ON-SCREEN TEXT และ TEXT STYLE ทั้งหมด (NO VIDEO ให้เล่าเรื่องด้วยภาพ + VO SCRIPT) ปกยังมี TITLE TEXT เว้นแต่ผู้ใช้สั่งห้ามด้วย |
| โมเดลเขียนตัวอักษรไทยเพี้ยน (ในคลิปหรือปก) | ลองใหม่ 2 รอบ ถ้ายังเพี้ยนให้เจนเป็น clean plate แล้วใส่ข้อความตาม KEYWORD TABLE / TITLE TEXT ตอนตัดต่อ |
| แนบ Storyboard image เข้า video task ไม่ได้ | retry การแนบ 1 ครั้ง; หากยังทำไม่ได้ให้ใช้ shot description ต่อ และระบุข้อจำกัดใน QA; ห้ามอ้างว่าแนบภาพสำเร็จ |
| เครื่องมือสร้างภาพ/วิดีโอทำงานล้มเหลว | retry 1 ครั้งด้วย prompt ที่สั้นและชัดขึ้น; หากยังล้มเหลว ให้ส่งมอบส่วนที่ทำได้ด้วย fallback ที่รองรับ และระบุ output ที่สร้างไม่ได้ใน QA โดยไม่กล่าวอ้างว่าสำเร็จ |
| ข้อมูลสินค้าขัดแย้งกัน | ยึดข้อมูลล่าสุดที่ผู้ใช้ระบุชัดเจน; หากยังแยกไม่ได้ให้ละเว้นจุดขัดแย้งและทำส่วนอื่นต่อ ห้ามถามคั่น workflow |
| สินค้ามีคำเตือนความปลอดภัย | ไม่แสดงการใช้ที่ขัดกับคำเตือน |

**ความต่างตามแพลตฟอร์ม (แนวทาง)**
- TikTok / Reels: Hook มาใน 1–2 วินาที จังหวะเร็ว
- Shopee Video: เน้นความชัดของสินค้าและรายละเอียด CTA แนว "ไปที่ร้าน/ตะกร้า"
- ไม่ระบุแพลตฟอร์ม: CTA กลาง เช่น "กดดูรายละเอียดด้านล่าง"

---

## 17. ข้อห้ามสรุป

1. ห้ามสร้าง Output เต็มก่อนผู้ใช้เลือก YES VIDEO / NO VIDEO
2. หลังผู้ใช้เลือกโหมดแล้ว ให้เลือกเสียง YES VIDEO โดยอัตโนมัติและล็อก VOICE LOCK ไม่ถามยืนยันเสียงเพิ่ม
3. ห้ามหยุดรอระหว่าง Phase; Master Prompt ต้องสั่งทำ Assets, Storyboard Sheets แยก Scene, Story-to-Video และงานปิดท้ายต่อเนื่องจนครบ
4. ห้ามเขียน Continuity Bible ไม่เหมือนกันระหว่างฉาก
5. ห้ามรวม Storyboard หลาย Scene ลง Sheet เดียว; ต้องสร้าง 1 Sheet ต่อ 1 Scene โดยแต่ละ Sheet มี 4 Panels และ timecode ถูกต้อง
6. ห้ามสร้างข้อมูลสินค้า ราคา ส่วนลด รีวิว คะแนน หรือผลลัพธ์ขึ้นเอง
7. ห้ามเปลี่ยนสินค้า ฉลาก โลโก้ หรือภาษาบนฉลากจากภาพอ้างอิง และห้ามเติมรายละเอียดฉลากที่มองไม่เห็น
8. ห้ามใช้ Text Overlay หากผู้ใช้กำหนดว่าไม่เอา
9. ห้ามใส่รายละเอียดเกินจำเป็นหรือเอฟเฟกต์ที่บังสินค้า
10. ห้ามแต่งข้อมูลสินค้าเอง; หากข้อมูลไม่พอให้ละเว้นจุดนั้น ใช้ค่าเริ่มต้นที่ปลอดภัย และทำงานส่วนที่เหลือต่อ ห้ามถามระหว่าง Phase
11. ห้ามกล่าวอ้างตามที่ระบุในหัวข้อ 12
12. ห้ามจบงานโดยไม่มี Thumbnail (Phase E) เว้นแต่ผู้ใช้สั่งไม่ให้สร้างปก
13. NO VIDEO ห้ามใส่บทพูด เสียงบรรยาย หรือการขยับปากเป็นประโยคในพรอมต์วิดีโอ เสียงพูดทั้งหมดอยู่ใน VO SCRIPT
14. YES VIDEO ห้ามเปลี่ยนเพศ โทน หรือความเร็วเสียงระหว่างฉาก (ใช้ VOICE LOCK เดียว)
15. NO VIDEO ห้ามส่งพรอมต์ฉากที่ไม่มี motion infographic คำสำคัญ (เว้นผู้ใช้สั่งห้ามข้อความบนจอ)
16. ทุกบรรทัดคำพูดต้องมี tag เวลา [M:SS.s-M:SS.s] และ emotional tag [emotion] ก่อนคำพูด; ห้ามขาด tag และห้ามให้ TTS อ่าน tag ออกเสียง
17. ปกต้องมี TITLE TEXT เสมอ (เว้นผู้ใช้สั่งห้ามข้อความบนจอ)
18. ห้ามถามผู้ใช้ระหว่าง Phase, ห้ามขออนุมัติ, ห้ามรอ Assets/Storyboard พร้อม และห้ามสั่งให้ผู้ใช้พิมพ์ continue
19. ห้ามส่ง Master Prompt แยกหลายบล็อก; ค่าเริ่มต้นต้องเป็น Prompt เดียวที่สั่ง Agent ทำงานจนจบ
20. ห้ามส่ง VO Script ที่สั้นกว่าระยะเวลาคลิปอย่างชัดเจน; ต้องผ่าน VO Duration QA ก่อนส่ง
21. ห้ามถือว่าการพิมพ์ชื่อ Storyboard ใน prompt คือการแนบภาพ; ต้องตรวจการแนบ image input จริง และห้ามอ้างความสำเร็จโดยไม่มีหลักฐานจากเครื่องมือ
22. NO VIDEO ห้ามส่ง Clean TTS Script ที่มีคำพูดต่างจาก Tagged VO Script; ถอดได้เฉพาะ timestamp และ emotional tag
23. ห้ามบังคับจำนวนพยางค์หรือเร่ง TTS จนเสียงพูดผิดธรรมชาติ; ความยาวคำพูดจริงและความเป็นธรรมชาติมาก่อน heuristic

---

## 18. บันทึกการเปลี่ยนแปลง

**v2.9**
- เพิ่ม Storyboard-to-Video Attachment Protocol: ต้องแนบไฟล์ภาพ Storyboard ของ Scene นั้นเข้ากับงานสร้างวิดีโอจริง ไม่ใช่แค่เขียนชื่อไฟล์ใน prompt; กำหนดการ retry และ fallback พร้อม QA ตามสถานะการแนบจริง
- แก้ VO timing ของ YES VIDEO ให้เป็นเป้าหมายเริ่ม 0:00.3–0:00.5 และจบ 0:09.2–0:09.5 ต่อคลิป 10 วินาที พร้อมย้ำว่าความเร็วพูดธรรมชาติมาก่อนจำนวนพยางค์
- ปรับจำนวนพยางค์และอัตราพูดให้เป็น heuristic ไม่ใช่สูตรบังคับ
- NO VIDEO เพิ่ม Clean TTS Script ที่ถอดเฉพาะ timestamp/emotional tag ออกจาก Tagged VO โดยคำพูดต้องตรงกันทุกคำ
- แยกเวลา NO VIDEO VO เป็น Global Timecode 0:00–0:30 และเวลา Motion Infographic เป็น Local Timecode 0:00–0:10 ต่อ Scene; เพิ่ม Global Timecode ใน KEYWORD TABLE
- แก้ cross-reference ของ VOICEOVER และ ON-SCREEN TEXT ให้ชี้ไปหัวข้อ 10
- ปรับกรณีไม่มีภาพสินค้าให้ทำงานต่อจากข้อมูลข้อความโดยไม่ถาม และห้ามแต่งรูปลักษณ์ที่ไม่มีหลักฐาน
- เพิ่ม fallback สำหรับการแนบ storyboard หรือการสร้างภาพ/วิดีโอที่เครื่องมือไม่รองรับหรือทำงานล้มเหลว

**v2.8**
- เพิ่ม Emotional Tag บังคับในทุกบรรทัดของ VO SCRIPT และ VOICEOVER เช่น [curious], [surprised], [empathetic], [excited], [confident], [friendly]
- กำหนดแนวทางเลือกอารมณ์ตามช่วง Hook / Problem / Demo / CTA โดยไม่แสดงอารมณ์เกินจริง
- ระบุชัดว่า emotional tag เป็น metadata ไม่ใช่คำพูด ห้ามอ่านออกเสียงและไม่นับรวมเวลา/จำนวนพยางค์
- เพิ่ม QA ตรวจ emotional tag ให้ครบทุกบรรทัด และอัปเดตตัวอย่างรูปแบบบทพูด

**v2.7**
- เพิ่ม VO Duration Lock: YES VIDEO ต้องพูดประมาณ 8–9 วินาทีต่อฉาก; NO VIDEO ต้องมีเวลาพูดจริงรวม 26–28 วินาทีในคลิป 30 วินาที
- เพิ่มเป้าหมายปริมาณบทพูด 40–48 พยางค์ต่อฉาก (ปรับตามการออกเสียงจริง) และ VO Duration QA ให้เขียนใหม่หากบทสั้นหรือยาวเกิน
- ปรับจังหวะเริ่ม/จบบทพูดให้ใช้เวลาส่วนใหญ่ของแต่ละฉาก ไม่ปล่อยช่วงเงียบยาวโดยไม่จำเป็น
- เพิ่ม Autonomous Rule: หลังทราบโหมดแล้ว Agent ห้ามถาม ห้ามขออนุมัติ ห้ามรอคำว่า Assets/Storyboard พร้อม และต้องใช้ค่าเริ่มต้นที่ปลอดภัยเมื่อข้อมูลไม่ครบ
- ย้ำ Single Prompt Rule: Master Prompt เดียวสั่งทำงานครบทุก Phase และสร้างชิ้นงานจริงเท่าที่เครื่องมือรองรับ
- เปลี่ยนกรณีข้อมูลขัดแย้ง/ไม่ครบจากการถามผู้ใช้เป็นการใช้ข้อมูลล่าสุดหรือเว้นประเด็นนั้น แล้วทำงานส่วนอื่นต่อ

**v2.6**
- ลบ approval gates เก่าที่ให้ผู้ใช้พิมพ์ "Assets พร้อม" และ "Storyboard พร้อม"; Master Prompt เดียวทำงานต่อเนื่องครบทุก Phase
- แทน Storyboard Sheet แบบเดิมที่ใช้ 4 keyframes ครอบคลุม 30 วินาที ด้วย 3 Sheets แยกกัน แผ่นละ 1 Scene และ 4 Panels ภายใน Scene
- กำหนด Global + Local Timecode ให้ครบทั้ง 3 Scenes และล็อกการอ้างอิง Sheet ให้ตรงกับ Scene
- ปรับ Handoff ของ Story-to-Video ให้ใช้ Panel 1→2→3→4 ของ Sheet ประจำ Scene
- แก้ Phase Thumbnail จาก D เป็น E ให้ตรงกับ Pipeline
- แก้ Continuity Bible ให้แยกนโยบายเสียง YES VIDEO / NO VIDEO ชัดเจน
- แก้ cross-reference หัวข้อ Claim Safety, QA และเลขข้อห้ามซ้ำ
- ปรับ QA ให้ตรวจ 3 Sheets แยก Scene และ Global/Local Timecode

**v2.5**
- เปลี่ยน Storyboard จาก 1 Sheet ครอบคลุม 3 Scenes เป็น 1 Sheet ต่อ 1 Scene (วิดีโอ 3 Scenes = 3 Sheets)
- แต่ละ Sheet เป็นแนวตั้ง 9:16 แบบ 4 Panels (2×2) และแสดง shot progression ภายใน Scene เดียว
- Video Scene n ต้องอ้างอิง Storyboard Sheet n เท่านั้น
- เปลี่ยน Pipeline เป็น Master Prompt เดียว ทำงานต่อเนื่องครบทุก Phase โดยไม่หยุดรอ Assets พร้อม / Storyboard พร้อม และไม่ถามยืนยันเสียงเพิ่ม
- เพิ่มกติกาสร้าง assets/sheets/clips ทีละรายการอัตโนมัติ หากแพลตฟอร์มมีข้อจำกัด

**v2.4**
- เพิ่ม Phase B: Storyboard Sheets แนวตั้ง 9:16 แยก Scene ละ 1 Sheet โดยแต่ละ Sheet มี 4 Panel (2×2) พร้อม timecode 00:00 / 00:10 / 00:20 / 00:30 โดย 4 keyframes ครอบคลุม 3 scenes
- เพิ่ม Gate 4 รอผู้ใช้เจน/ยืนยัน Storyboard ก่อนเริ่ม Story-to-Video
- เปลี่ยน Phase B เดิมเป็น Phase C: Story-to-Video และเลื่อน Thumbnail เป็น Phase D ขั้นตอนสุดท้าย
- NO VIDEO เพิ่ม motion infographic คำสำคัญบนจอ (ฉากละ 2–4 คำ พร้อม tag เวลา) เล่าเรื่องแทนเสียง + KEYWORD TABLE สำรอง + บรรทัด TEXT STYLE ใน Continuity Bible
- Thumbnail (Trumpnail) มี TITLE TEXT บังคับ ใช้ TEXT STYLE เดียวกับคลิป
- รูปแบบคำพูดใหม่: บล็อกมีเฉพาะคำพูด ทุกบรรทัดมี tag เวลา [M:SS.s-M:SS.s] ข้อมูลอื่นย้ายไปหมายเหตุใต้บล็อก ใช้กับทั้ง VO SCRIPT (NO VIDEO) และ [VOICEOVER] (YES VIDEO)
- เพิ่มคำสั่ง `/kw`, `/trumpnail` เป็นชื่อสำรองของ `/thumbnail`, แผนสำรองเมื่อโมเดลเขียนไทยเพี้ยน, อัปเดต QA และข้อห้าม

**v2.2**
- NO VIDEO เปลี่ยนจากชุดภาพนิ่ง เป็นวิดีโอที่ไม่มีเสียงพูด พากย์ใส่ทีหลัง พร้อม VO SCRIPT แยก (ไทม์โค้ด, cue, ตั้งค่า ElevenLabs)
- YES VIDEO ใช้เสียงที่เจนมากับวิดีโอเลย เพิ่ม VOICE LOCK ใน Continuity Bible
- เพิ่มตารางนิยามสองโหมด, ทางสลับ YES → NO เมื่อเสียงไทยเพี้ยน, คำสั่ง `/vo`
- อัปเดต QA, กรณีพิเศษ และข้อห้ามให้ตรงสองโหมด

**v2.1**
- เพิ่ม PHASE A: Assets Pack (PRODUCT-01, PROPS-01, CHAR-A, LOC-01) พร้อมแม่แบบพรอมต์และ Asset QA
- เพิ่ม Gate 3 (รอ "Assets พร้อม") และทางลัดข้าม assets
- เพิ่ม Continuity Bible และระบบความต่อเนื่อง 10 ข้อ (frame handoff, shot list มีไทม์โค้ด, screen direction, match cut, เสียงต่อเนื่อง)
- เปลี่ยนโครงพรอมต์ฉากเป็น REFERENCES → BIBLE → LOCK → START FRAME → SHOT LIST → END FRAME
- Thumbnail เป็น PHASE C ขั้นสุดท้ายเสมอ และใช้ assets + Bible ชุดเดียวกับวิดีโอ
- ตั้งค่าเริ่มต้นตัวละครเป็น hands-only เพื่อลดความเสี่ยงหน้าไม่ต่อเนื่อง
- เพิ่มคำสั่ง `/assets` และอัปเดต `/single`, QA Checklist, กรณีพิเศษ

**v2.0**
- เพิ่ม Gate System, ตารางเลือกแนวภาพ, Product Lock, กฎ Voiceover, Claim Safety, NO VIDEO ที่นิยามชัด, คำสั่งคัดลอก และ QA Checklist

---

## Output Storage (Google Drive Sync)

ทุกครั้งที่สร้างชุดงานเสร็จ (Master Prompt `.md`, Assets, Storyboard Sheets, VO Script, Keyword Table, Thumbnail หรือไฟล์ประกอบอื่น ๆ):

1. บันทึกไฟล์ผลลัพธ์ไว้ใน `/home/antigravity/shc08032545/motion-infographic-affiliate/outputs/<product_slug>_<YYYYMMDD>/`
2. อัปโหลดไฟล์ทั้งหมดขึ้น Google Drive โฟลเดอร์ปลายทาง:
   - **Drive Path:** `My Drive / 04_AI_โปรเจกต์และโน้ต / โปรเจกต์และเอกสาร_AI / motion-infographic-affiliate`
   - **Parent Folder ID:** `1DaX-ltIh5DHTt-qGrK3rRZxmdz-M5nXW`
   - **Link:** `https://drive.google.com/drive/folders/1DaX-ltIh5DHTt-qGrK3rRZxmdz-M5nXW`
3. สามารถรันสคริปต์ช่วยอัปโหลดได้ทันที:
   ```bash
   /home/antigravity/shc08032545/motion-infographic-affiliate/scripts/upload_to_drive.sh "<product_folder_name>" "<local_output_dir>"
   ```
   สคริปต์จะสร้างโฟลเดอร์ย่อยตามชื่อสินค้าใน Google Drive และอัปโหลดทุกไฟล์ขึ้นไปโดยอัตโนมัติ พร้อมแสดงลิงก์โฟลเดอร์ Drive กลับมาให้ผู้ใช้
