/*
WinStructs - A class to hold Window Structure Definitions

STYLE GUIDE
===========
ALWAYS Put a link to the MSDN page for the STRUCT
ALWAYS Use the same name as the Struct.
ALWAYS Strip all lower case letters from the start of item names - eg "hDevice" becomes "Device"

*/

Class WinStructs {
	; TESTED, WORKING ==========================================================================================================================================================
	; https://msdn.microsoft.com/en-us/library/windows/desktop/ms645568%28v=vs.85%29.aspx
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
	
	;https://msdn.microsoft.com/en-us/library/windows/hardware/ff539697(v=vs.85).aspx
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
		USHORT usFlags;
		{
			ULONG  ulButtons;
			struct {
				USHORT usButtonFlags;
				USHORT usButtonData;
			};
		};
		ULONG  ulRawButtons;
		LONG   lLastX;
		LONG   lLastY;
		ULONG  ulExtraInformation;
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
		DWORD dwSizeHid;
		DWORD dwCount;
		BYTE  bRawData[1];
	)"
	
	; https://msdn.microsoft.com/en-us/library/windows/desktop/ms645571(v=vs.85).aspx
	static RAWINPUTHEADER := "
	(
		DWORD  dwType;
		DWORD  dwSize;
		HANDLE hDevice;
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

}