
# XUI Ping Script

This script continuously pings the XUI panel every second and sends a notification to Telegram if the panel goes down, including the reason for the failure (such as 404 or connection error).

## Installation and Setup

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

## Usage

To run the script:
```
./install_ping_xui.sh
```

The script will start pinging the XUI panel and send a notification to Telegram if the panel goes down.

## License

This project is licensed under the **CC BY-ND 4.0** License. See the [LICENSE](LICENSE) file for details.
