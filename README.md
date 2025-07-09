
# XUI Ping Script 🚀

این اسکریپت به طور پیوسته پنل XUI را پینگ کرده و در صورتی که پنل قطع شود، به تلگرام پیام ارسال می‌کند و دلیل قطع شدن (مانند 404 یا خطای اتصال) را اطلاع می‌دهد.

## ویژگی‌ها:
- پینگ کردن پنل XUI هر ثانیه
- ارسال پیام به تلگرام در صورت قطع شدن
- گزارش دلیل قطع شدن پنل

---

### نصب سریع

برای نصب سریع اسکریپت، تنها کافیست این دستورها را اجرا کنید:
1. ریپازیتوری را کلون کنید:
   ```
   git clone https://github.com/Aliannezhadi/xui-ping.git
   cd xui-ping
   ```

2. پیش نیاز ها را نصب کنید:
   ```
   sudo apt install curl python3 python3-pip
   pip3 install requests
   ```

3. برای راه‌اندازی سریع:
   ```
   ./install_ping_xui.sh
   ```

---

### README فارسی

# اسکریپت پینگ XUI

این اسکریپت به طور پیوسته هر ثانیه پنل XUI را پینگ کرده و در صورت قطع شدن پنل، پیامی به تلگرام ارسال می‌کند که دلیل قطع شدن (مانند 404 یا خطای اتصال) را نیز شامل می‌شود.

#### نصب و راه‌اندازی

1. ریپازیتوری را کلون کنید:
   ```
   git clone https://github.com/Aliannezhadi/xui-ping.git
   cd xui-ping
   ```

2. پیشنیاز ها را نصب کنید:
   ```
   sudo apt install curl python3 python3-pip
   pip3 install requests
   ```

3. توکن ربات تلگرام و شناسه چت خود را وارد کنید:
   - هنگام اجرای اسکریپت، از شما خواسته می‌شود که توکن ربات تلگرام و شناسه چت خود را وارد کنید.

#### استفاده

برای اجرای اسکریپت:
```
./install_ping_xui.sh
```

این اسکریپت شروع به پینگ کردن پنل XUI کرده و در صورت قطع شدن پنل، پیام هشدار را به تلگرام ارسال می‌کند.

#### مجوز

این پروژه تحت مجوز **CC BY-ND 4.0** منتشر شده است. برای جزئیات بیشتر به فایل [LICENSE](LICENSE) مراجعه کنید.

---

### English README

# XUI Ping Script

This script continuously pings the XUI panel every second and sends a notification to Telegram if the panel goes down, including the reason for the failure (such as 404 or connection error).

#### Installation and Setup

1. Clone the repository:
   ```
   git clone https://github.com/Aliannezhadi/xui-ping.git
   cd xui-ping
   ```

2. Install dependencies:
   ```
   sudo apt install curl python3 python3-pip
   pip3 install requests
   ```

3. Enter your Telegram Bot Token and Chat ID:
   - The script will prompt you to enter your Telegram Bot Token and Chat ID during execution.

#### Usage

To run the script:
```
./install_ping_xui.sh
```

The script will start pinging the XUI panel and send a notification to Telegram if the panel goes down.

#### License

This project is licensed under the **CC BY-ND 4.0** License. See the [LICENSE](LICENSE) file for details.
