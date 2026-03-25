# 🔐 WiFi Audit Tool

A powerful and automated WiFi auditing script designed for **educational** and **cybersecurity learning purposes**.
This tool simplifies wireless network analysis, handshake capture, deauthentication testing, and password auditing using the **aircrack-ng suite**.

---

## 🚀 Features

* 📡 Scan nearby WiFi networks
* 🤝 Capture WPA/WPA2 handshake
* 📴 Deauthenticate connected devices
* 🔓 Crack captured handshake using wordlists
* 🔄 Restore network settings automatically
* 🎨 Clean terminal UI with colors and banners

---

## 🛠️ Requirements

* Linux (Kali Linux recommended)
* Root access
* Wireless adapter with **monitor mode support**

### Required Tools:

* `aircrack-ng`
* `iwconfig`
* `figlet`

---

## ⚙️ Installation

```bash
git clone https://github.com/your-username/wifi-audit-tool.git
cd wifi-audit-tool
chmod +x wifi-audit.sh
```

---

## ▶️ Usage

Run the script as root:

```bash
sudo ./wifi-audit.sh
```

---

## 📋 Workflow

1. Enable monitor mode
2. Scan nearby networks
3. Select target (BSSID & Channel)
4. Capture handshake
5. Deauthenticate devices (optional)
6. Crack password using wordlist

---

## ⚠️ Disclaimer

This tool is created strictly for **educational purposes only**.

* Do NOT use this tool on networks without proper authorization
* Unauthorized access to networks is illegal
* The developer is not responsible for any misuse

---

## 👨‍💻 Author

**Alok Thakur**
Cybersecurity Enthusiast

---

## ⭐ Support

If you like this project:

* ⭐ Star this repository
* 🍴 Fork it
* 📢 Share with others

---

## 🚧 Future Improvements

* Auto interface detection
* Logging system
* GUI version
* Advanced attack modules

---

## 🛡️ License

This project is licensed under the MIT License.
