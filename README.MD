
# usb-modeswitch-macos

Easily install [usb-modeswitch](https://www.draisberghof.de/usb_modeswitch/) on macOS using a simple script.

## What is usb-modeswitch?

usb-modeswitch is a tool for controlling "multi-mode" USB devices, such as 3G/4G modems or Wi-Fi adapters, that present themselves as a storage device before switching to modem mode. This script automates the installation process for macOS users.

## Features

- Installs usb-modeswitch and its dependencies on macOS
- Uses Homebrew for dependency management
- Downloads and builds the latest usb-modeswitch release

## Installation

1. Clone this repository or download the `install.sh` script.
2. Open Terminal and run:

	```sh
	chmod +x install.sh
	sudo ./install.sh
	```

The script will:
- Check for Homebrew and install it if missing
- Install `libusb` and `pkg-config`
- Download and install usb-modeswitch

## Usage

After installation, you can use `usb_modeswitch` from the command line. For device configuration, see the [usb-modeswitch documentation](https://www.draisberghof.de/usb_modeswitch/).

To add or update device configurations, download the latest config data from:

- [usb-modeswitch-data](https://www.draisberghof.de/usb_modeswitch/usb-modeswitch-data-20191128.tar.bz2)

## Example

```bash

# Generate config file with my wifi adapter id
cat <<EOF | tee ./UgreenAdapterConfig 
# UGREEN AX1800 
DefaultVendor= 0x0bda 
DefaultProduct= 0x1a2b 
StandardEject= 1 
EOF

# Call change USB mode
sudo ./usb_modeswitch -c ./UgreenAdapterConfig
```

## I'm scared and don't know what vendor/product id is.

You can use more friendly app (but with less functionality) 
- [usb_eject](https://github.com/MyLittleCrab/usb_eject)

## Links

- [usb-modeswitch homepage](https://www.draisberghof.de/usb_modeswitch/)
- [usb-modeswitch-data](https://www.draisberghof.de/usb_modeswitch/usb-modeswitch-data-20191128.tar.bz2)

## License

This project is not affiliated with the original usb-modeswitch authors. See their site for licensing details.


---

# usb-modeswitch-macos (на русском)

Простой способ установить [usb-modeswitch](https://www.draisberghof.de/usb_modeswitch/) на macOS с помощью скрипта.

## Что такое usb-modeswitch?

usb-modeswitch — это инструмент для управления USB-устройствами с несколькими режимами работы, такими как 3G/4G модемы или Wi-Fi адаптеры, которые сначала определяются как накопитель, а затем могут переключаться в режим модема. Этот скрипт автоматизирует процесс установки для пользователей macOS.

## Возможности

- Устанавливает usb-modeswitch и все необходимые зависимости на macOS
- Использует Homebrew для управления зависимостями
- Загружает и собирает последнюю версию usb-modeswitch

## Установка

1. Клонируйте этот репозиторий или скачайте скрипт `install.sh`.
2. Откройте Терминал и выполните:

	```sh
	chmod +x install.sh
	sudo ./install.sh
	```

Скрипт выполнит:
- Проверку наличия Homebrew и установку при необходимости
- Установку `libusb` и `pkg-config`
- Загрузку и установку usb-modeswitch

## Использование

После установки вы можете использовать `usb_modeswitch` из командной строки. Для настройки устройств смотрите [документацию usb-modeswitch](https://www.draisberghof.de/usb_modeswitch/).

Чтобы добавить или обновить конфигурации устройств, скачайте последние данные конфигураций по ссылке:

- [usb-modeswitch-data](https://www.draisberghof.de/usb_modeswitch/usb-modeswitch-data-20191128.tar.bz2)

## Пример

```bash

# Сгенерировать конфиг для моего Wi-Fi адаптера
cat <<EOF | tee ./UgreenAdapterConfig 
# UGREEN AX1800 
DefaultVendor= 0x0bda 
DefaultProduct= 0x1a2b 
StandardEject= 1 
EOF

# Переключить режим USB
sudo ./usb_modeswitch -c ./UgreenAdapterConfig
```

## Я не знаю, что такое vendor/product id

Вы можете воспользоваться более дружелюбным приложением (но с меньшей функциональностью):
- [usb_eject](https://github.com/MyLittleCrab/usb_eject)

## Ссылки

- [usb-modeswitch homepage](https://www.draisberghof.de/usb_modeswitch/)
- [usb-modeswitch-data](https://www.draisberghof.de/usb_modeswitch/usb-modeswitch-data-20191128.tar.bz2)

## Лицензия

Этот проект не аффилирован с оригинальными авторами usb-modeswitch. Подробности о лицензии смотрите на их сайте.

