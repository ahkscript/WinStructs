/*
WinStructs - A class to hold Window Structure Definitions

STYLE GUIDE
===========
ALWAYS Put a link to the MSDN page for the STRUCT
ALWAYS Use the same name as the Struct.
ALWAYS Strip all lower case letters from the start of item names - eg "hDevice" becomes "Device"

ToDo
====
* Revert back to names as they appear in MSDN.
  Some names cannot have the lowercase characters removed, eg KBDLLHOOKSTRUCT has vkCode and scanCode, both are DWORDs
*/

Class WinStructs {
	; Define locations - used to check validity of Structures by looking up the actual size from the specified windows header file.
	; Set to 1 for default header file of "Windows.h"
	; Set to -1 to not check (un-named sub-structs etc)
	static Defines := { KBDLLHOOKSTRUCT: 1
		, POINT: 1
		, MSLLHOOKSTRUCT: 1
		, RAWINPUTDEVICELIST: 1
		, RID_DEVICE_INFO_MOUSE: 1
		, RID_DEVICE_INFO_KEYBOARD: 1
		, RID_DEVICE_INFO_HID: 1
		, RID_DEVICE_INFO: 1
		, HIDP_CAPS: ["Hidusage.h", "Hidpi.h"]
		, RAWINPUTDEVICE: 1
		, HIDP_BUTTON_CAPS_Range: -1
		, HIDP_BUTTON_CAPS_NotRange: -1
		, HIDP_BUTTON_CAPS: ["Hidusage.h", "Hidpi.h"]
		, RAWMOUSE: 1
		, RAWKEYBOARD: 1
		, RAWHID: 1
		, RAWINPUTHEADER: 1
		, RAWINPUT: 1 }
	
	; TESTED, WORKING ==========================================================================================================================================================
	; https://msdn.microsoft.com/en-us/library/windows/desktop/ms645568%28v=vs.85%29.aspx
	;Defines["RAWINPUTDEVICELIST"] := "aaa"
	static RAWINPUTDEVICELIST := "
	(
		HANDLE Device;	// A handle to the raw input device.
		DWORD Type;		// The type of device. This can be one of the following values
						// RIM_TYPEHID 			2 - The device is an HID that is not a keyboard and not a mouse
						// RIM_TYPEKEYBOARD 	1 - The device is a keyboard.
						// RIM_TYPEMOUSE 		0 - The device is a mouse.
	)"

	; https://msdn.microsoft.com/en-us/library/windows/desktop/ms645589(v=vs.85).aspx
	static RID_DEVICE_INFO_MOUSE := "
	(
		DWORD Id;
		DWORD NumberOfButtons;
		DWORD SampleRate;
		BOOL HasHorizontalWheel;
	)"
	
	; https://msdn.microsoft.com/en-us/library/windows/desktop/ms645587(v=vs.85).aspx
	static RID_DEVICE_INFO_KEYBOARD := "
	(
		DWORD Type;
		DWORD SubType;
		DWORD KeyboardMode;
		DWORD NumberOfFunctionKeys;
		DWORD NumberOfIndicators;
		DWORD NumberOfKeysTotal;
	)"
	
	; https://msdn.microsoft.com/en-us/library/windows/desktop/ms645584%28v=vs.85%29.aspx
	static RID_DEVICE_INFO_HID := "
	(
		DWORD VendorId;
		DWORD ProductId;
		DWORD VersionNumber;
		USHORT UsagePage;
		USHORT Usage;
	)"

	; https://msdn.microsoft.com/en-us/library/windows/desktop/ms645581%28v=vs.85%29.aspx
	static RID_DEVICE_INFO := "
	(
		DWORD Size;
		DWORD Type;
		{
			WinStructs.RID_DEVICE_INFO_MOUSE mouse;
			WinStructs.RID_DEVICE_INFO_KEYBOARD keyboard;
			WinStructs.RID_DEVICE_INFO_HID hid;
		}
	)"
	
	; https://msdn.microsoft.com/en-us/library/windows/hardware/ff539697(v=vs.85).aspx
	static HIDP_CAPS := "
	(
		USHORT Usage;
		USHORT UsagePage;
		USHORT InputReportByteLength;
		USHORT OutputReportByteLength;
		USHORT FeatureReportByteLength;
		USHORT Reserved[17];
		USHORT NumberLinkCollectionNodes;
		USHORT NumberInputButtonCaps;
		USHORT NumberInputValueCaps;
		USHORT NumberInputDataIndices;
		USHORT NumberOutputButtonCaps;
		USHORT NumberOutputValueCaps;
		USHORT NumberOutputDataIndices;
		USHORT NumberFeatureButtonCaps;
		USHORT NumberFeatureValueCaps;
		USHORT NumberFeatureDataIndices;
	)"
	
	; UNPROVEN ==========================================================================================================================================================

	; https://msdn.microsoft.com/en-us/library/windows/desktop/ms645565(v=vs.85).aspx
	static RAWINPUTDEVICE := "
	(
		USHORT UsagePage;
		USHORT Usage;
		DWORD  Flags;
		HWND   Target;
	)"
	
	; https://msdn.microsoft.com/en-gb/library/windows/hardware/ff539693(v=vs.85).aspx
	static HIDP_BUTTON_CAPS_Range := "
	(
		USHORT  UsageMin;
		USHORT  UsageMax;
		USHORT StringMin;
		USHORT StringMax;
		USHORT DesignatorMin;
		USHORT DesignatorMax;
		USHORT DataIndexMin;
		USHORT DataIndexMax;
	)"
	
	static HIDP_BUTTON_CAPS_NotRange := "
	(
		USHORT  Usage;
		USHORT  Reserved1;
		USHORT StringIndex;
		USHORT Reserved2;
		USHORT DesignatorIndex;
		USHORT Reserved3;
		USHORT DataIndex;
		USHORT Reserved4;
	)"
	
	static HIDP_BUTTON_CAPS := "
	(
		USHORT  UsagePage;
		UCHAR   ReportID;
		BOOLEAN IsAlias;
		USHORT  BitField;
		USHORT  LinkCollection;
		USHORT  LinkUsage;
		USHORT  LinkUsagePage;
		BOOLEAN IsRange;
		BOOLEAN IsStringRange;
		BOOLEAN IsDesignatorRange;
		BOOLEAN IsAbsolute;
		ULONG   Reserved[10];
		{
			WinStructs.HIDP_BUTTON_CAPS_Range Range;
			WinStructs.HIDP_BUTTON_CAPS_NotRange NotRange;
		};
	)"
	

	; https://msdn.microsoft.com/en-us/library/windows/desktop/ms645578(v=vs.85).aspx
	static RAWMOUSE := "
	(
		USHORT Flags;
		{
			ULONG  Buttons;
			{
				USHORT ButtonFlags;
				USHORT ButtonData;
			};
		};
		ULONG  RawButtons;
		LONG   LastX;
		LONG   LastY;
		ULONG  ExtraInformation;
	)"
	
	; https://msdn.microsoft.com/en-us/library/windows/desktop/ms645575(v=vs.85).aspx
	static RAWKEYBOARD := "
	(
		USHORT MakeCode;
		USHORT Flags;
		USHORT Reserved;
		USHORT VKey;
		UINT   Message;
		ULONG  ExtraInformation;
	)"
	
	; https://msdn.microsoft.com/en-us/library/windows/desktop/ms645549(v=vs.85).aspx
	static RAWHID := "
	(
		DWORD SizeHid;
		DWORD Count;
		BYTE  RawData[1];
	)"
	
	; https://msdn.microsoft.com/en-us/library/windows/desktop/ms645571(v=vs.85).aspx
	static RAWINPUTHEADER := "
	(
		DWORD  Type;
		DWORD  Size;
		HANDLE Device;
		WPARAM wParam;
	)"
	
	; https://msdn.microsoft.com/en-us/library/windows/desktop/ms645562(v=vs.85).aspx
	static RAWINPUT := "
	(
		WinStructs.RAWINPUTHEADER header;
		{
			WinStructs.RAWMOUSE    mouse;
			WinStructs.RAWKEYBOARD keyboard;
			WinStructs.RAWHID      hid;
		}
	)"

	; https://msdn.microsoft.com/en-us/library/windows/desktop/ms644967(v=vs.85).aspx
	static KBDLLHOOKSTRUCT := "
	(
		DWORD     vkCode;
		DWORD     scanCode;
		DWORD     flags;
		DWORD     time;
		ULONG_PTR dwExtraInfo;
	)"
	
	; https://msdn.microsoft.com/en-us/library/windows/desktop/dd162805(v=vs.85).aspx
	static POINT := "
	(
		LONG x;
		LONG y;
	)"
	
	; https://msdn.microsoft.com/en-us/library/windows/desktop/ms644970(v=vs.85).aspx
	static MSLLHOOKSTRUCT := "
	(
		WinStructs.POINT     pt;
		DWORD     mouseData;
		DWORD     flags;
		DWORD     time;
		ULONG_PTR dwExtraInfo;
	)"
}