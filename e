#!/bin/bash
# تثبيت خدمة التوقيع الإلكتروني لمنصة ألواح (الجلسة 15) — يعمل في الخلفية ولا يتوقف إن انقطع الاتصال
cd /root || exit 1
curl -fsSL -o alwah-s15.zip https://raw.githubusercontent.com/abtkare/Alowah/main/alwah-platform-zz-session15.zip || { echo "✗ تعذّر تنزيل الملف"; exit 1; }
rm -rf alwah-s15 && python3 -m zipfile -e alwah-s15.zip alwah-s15 || { echo "✗ تعذّر فك الملف"; exit 1; }
setsid bash -c 'PAIR=PAIR81ac0a85d680ef98ba4bc20c bash /root/alwah-s15/alwah-esign/deploy-vps.sh' > /root/esign-deploy.log 2>&1 < /dev/null &
sleep 3
echo "== بدأ التثبيت (5-10 دقائق). يمكنك إغلاق الصفحة — يكمل وحده =="
tail -f /root/esign-deploy.log
