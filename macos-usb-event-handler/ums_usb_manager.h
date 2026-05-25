struct ums_usb_device_info
{
    char vid;
    char pid;
    char uma;
    char upr;
    char use;
    char sve;
    char smo;
    char sre;
};

struct ums_usb_device_info_list
{
    struct ums_usb_device_info* device_info;
    unsigned char len;
};


struct ums_usb_device_info_list ums_list_usb_storage_devices(void);

struct ums_usb_device_info ums_get_device_info(void);

