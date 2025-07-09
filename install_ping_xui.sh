
#!/bin/bash

# Requesting Telegram Bot Token and Chat ID from the user
echo "Please enter your Telegram Bot Token:"
read TELEGRAM_TOKEN  # Getting the Telegram bot token from the user

echo "Please enter your Telegram Chat ID:"
read CHAT_ID  # Getting the chat ID from the user

XUI_URL="http://127.0.0.1:3000"  # Change to your XUI panel URL

# Send message to Telegram in English
send_telegram_message() {
    local message="$1"
    curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_TOKEN/sendMessage"          -d chat_id="$CHAT_ID"          -d text="$message"
}

# Updating packages
echo "Updating packages..."
sudo apt update && sudo apt upgrade -y

# Installing dependencies
echo "Installing dependencies..."
sudo apt install -y curl python3 python3-pip

# Installing Python libraries
echo "Installing Python libraries..."
pip3 install requests

# Creating the XUI ping script
echo "Creating XUI ping script..."
cat > /usr/local/bin/ping_xui.sh << EOL
#!/bin/bash

# Ping the XUI panel
while true; do
    # Ping the XUI panel
    response=\$(curl --silent --head --fail "\$XUI_URL")
    
    if [ \$? -eq 0 ]; then
        echo "XUI is running."
    else
        # Check the failure reason
        if [[ "\$response" == *"404 Not Found"* ]]; then
            send_telegram_message "XUI is down! Reason: 404 Not Found."
        elif [[ "\$response" == *"Connection refused"* ]]; then
            send_telegram_message "XUI is down! Reason: Connection refused."
        else
            send_telegram_message "XUI is down! Reason: Failed to access."
        fi
        break  # Exit the loop if XUI is down
    fi
    sleep 1
done
EOL

# Granting execute permission to the script
sudo chmod +x /usr/local/bin/ping_xui.sh

# Running the script
echo "Running the script..."
/usr/local/bin/ping_xui.sh &
echo "Script is running..."

# Completing the installation
echo "All installation and configuration steps are complete."
