
#!/bin/bash

# درخواست توکن ربات تلگرام و شناسه چت از کاربر
echo "Please Enter your Telegram Token:"
read TELEGRAM_TOKEN  # دریافت توکن ربات تلگرام از کاربر

echo "Please Enter Your Telegram CHAT ID:"
read CHAT_ID  # دریافت شناسه چت تلگرام از کاربر

XUI_URL="http://127.0.0.1:3000"  # به آدرس پنل XUI خود تغییر دهید

# ارسال پیام به تلگرام
send_telegram_message() {
    local message="$1"
    curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_TOKEN/sendMessage"          -d chat_id="$CHAT_ID"          -d text="$message"
}

# بروزرسانی پکیج‌ها
echo "بروزرسانی پکیج‌ها..."
sudo apt update && sudo apt upgrade -y

# نصب وابستگی‌ها
echo "نصب وابستگی‌ها..."
sudo apt install -y curl python3 python3-pip

# نصب کتابخانه‌های Python
echo "نصب کتابخانه‌های Python..."
pip3 install requests

# ایجاد اسکریپت پینگ XUI
echo "ایجاد اسکریپت پینگ XUI..."
cat > /usr/local/bin/ping_xui.sh << EOL
#!/bin/bash

# پینگ پنل XUI
while true; do
    # پینگ پنل XUI
    response=\$(curl --silent --head --fail "\$XUI_URL")
    
    if [ \$? -eq 0 ]; then
        echo "XUI در حال اجرا است."
    else
        # بررسی دلیل قطع شدن
        if [[ "\$response" == *"404 Not Found"* ]]; then
            send_telegram_message "XUI ghat shode ast! Daliresh: 404 Not Found."
        elif [[ "\$response" == *"Connection refused"* ]]; then
            send_telegram_message "XUI ghat shode ast! Daliresh: Connection refused."
        else
            send_telegram_message "XUI ghat shode ast! Daliresh: Gheyre movafagh be dastras."
        fi
        break  # در صورت قطع شدن XUI، از حلقه خارج می‌شود
    fi
    sleep 1
done
EOL

# اعطای مجوز اجرا به اسکریپت
sudo chmod +x /usr/local/bin/ping_xui.sh

# اجرای اسکریپت
echo "اجرای اسکریپت..."
/usr/local/bin/ping_xui.sh &
echo "اسکریپت در حال اجرا است..."

# تکمیل فرآیند نصب
echo "تمام مراحل نصب و پیکربندی تکمیل شد."
