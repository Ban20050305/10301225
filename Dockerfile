# เริ่มต้นจาก base image ของ Python
FROM python:3.10

# ตั้งค่าตำแหน่ง directory ของโปรเจกต์ใน container
WORKDIR /app

# คัดลอก requirements.txt เพื่อทำการติดตั้ง dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# คัดลอกโค้ดทั้งหมดของโปรเจกต์
COPY . /app/

# กำหนดพอร์ตที่ใช้ (เช่นพอร์ต 8000)
EXPOSE 8000

# รันเซิร์ฟเวอร์ Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
