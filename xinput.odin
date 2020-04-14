package xinput
/*
 *  @Name:     xinput
 *  
 *  @Author:   Mikkel Hjortshoej
 *  @Email:    hjortshoej@handmade.network
 *  @Creation: 02-05-2017 21:38:35
 *
 *  @Last By:   Joe Sycalik
 *  @Last Time: 14-4-2020 13:06:00
 *  
 *  @Description:
 *      This is a XInput wrapper which uses late-binding.
 */
import "core:sys/win32"
 
XINPUT_GAMEPAD_LEFT_THUMB_DEADZONE  :: 7849;
XINPUT_GAMEPAD_RIGHT_THUMB_DEADZONE :: 8689;
XINPUT_GAMEPAD_TRIGGER_THRESHOLD    :: 30;
XUSER_MAX_COUNT                     :: 4;
XINPUT_FLAG_GAMEPAD                 :: 0x00000001;
 
Error :: u32;
ERROR_SUCCESS              : Error : 0;
ERROR_DEVICE_NOT_CONNECTED : Error : 1167;
ERROR_EMPTY                : Error : 4306;
 
XINPUT_BATTERY_INFORMATION :: struct {
    BatteryType  : Battery_Type,
    BatteryLevel : Battery_Level,
}
 
Battery_Type :: enum u8 {
    BATTERY_TYPE_DISCONNECTED = 0x00,
    BATTERY_TYPE_WIRED        = 0x01,
    BATTERY_TYPE_ALKALINE     = 0x02,
    BATTERY_TYPE_NIMH         = 0x03,
    BATTERY_TYPE_UNKNOWN      = 0xFF,
}
 
Battery_Level :: enum u8 {
    BATTERY_LEVEL_EMPTY  = 0x00,
    BATTERY_LEVEL_LOW    = 0x01,
    BATTERY_LEVEL_MEDIUM = 0x02,
    BATTERY_LEVEL_FULL   = 0x03,
}
 
XINPUT_CAPABILITIES :: struct {
    Type      : u8,
    SubType   : Controller_SubType,
    Flags     : Capabilities_Flags,
    Gamepad   : XINPUT_GAMEPAD,
    Vibration : XINPUT_VIBRATION,
}
 
XINPUT_DEVTYPE_GAMEPAD :: 0x01;
 
Controller_SubType :: enum u8 {
    XINPUT_DEVSUBTYPE_UNKNOWN          = 0x00,
    XINPUT_DEVSUBTYPE_GAMEPAD          = 0x01,
    XINPUT_DEVSUBTYPE_WHEEL            = 0x02,
    XINPUT_DEVSUBTYPE_ARCADE_STICK     = 0x03,
    XINPUT_DEVSUBTYPE_FLIGHT_STICK     = 0x04,
    XINPUT_DEVSUBTYPE_DANCE_PAD        = 0x05,
    XINPUT_DEVSUBTYPE_GUITAR           = 0x06,
    XINPUT_DEVSUBTYPE_GUITAR_ALTERNATE = 0x07,
    XINPUT_DEVSUBTYPE_GUITAR_BASS      = 0x0B,
    XINPUT_DEVSUBTYPE_DRUM_KIT         = 0x08,
    XINPUT_DEVSUBTYPE_ARCADE_PAD       = 0x13,
}
 
Capabilities_Flags :: enum u16 {
    XINPUT_CAPS_VOICE_SUPPORTED = 0x0004,
    XINPUT_CAPS_FFB_SUPPORTED   = 0x0001,
    XINPUT_CAPS_WIRELESS        = 0x0002,
    XINPUT_CAPS_PMD_SUPPORTED   = 0x0008,
    XINPUT_CAPS_NO_NAVIGATION   = 0x0010,
}
 
XINPUT_GAMEPAD :: struct {
    wButtons      : Buttons,
    bLeftTrigger  : u8,
    bRightTrigger : u8,
    sThumbLX      : i16,
    sThumbLY      : i16,
    sThumbRX      : i16,
    sThumbRY      : i16,
}
 
Buttons :: enum u16 {
    XINPUT_GAMEPAD_DPAD_UP        = 0x0001,
    XINPUT_GAMEPAD_DPAD_DOWN      = 0x0002,
    XINPUT_GAMEPAD_DPAD_LEFT      = 0x0004,
    XINPUT_GAMEPAD_DPAD_RIGHT     = 0x0008,
    XINPUT_GAMEPAD_START          = 0x0010,
    XINPUT_GAMEPAD_BACK           = 0x0020,
    XINPUT_GAMEPAD_LEFT_THUMB     = 0x0040,
    XINPUT_GAMEPAD_RIGHT_THUMB    = 0x0080,
    XINPUT_GAMEPAD_LEFT_SHOULDER  = 0x0100,
    XINPUT_GAMEPAD_RIGHT_SHOULDER = 0x0200,
    XINPUT_GAMEPAD_A              = 0x1000,
    XINPUT_GAMEPAD_B              = 0x2000,
    XINPUT_GAMEPAD_X              = 0x4000,
    XINPUT_GAMEPAD_Y              = 0x8000
}
 
XINPUT_VIBRATION :: struct {
    wLeftMotorSpeed  : u16,
    wRightMotorSpeed : u16,
}
 
XINPUT_STATE :: struct {
    dwPacketNumber : u32,
    Gamepad       : XINPUT_GAMEPAD,
}
 
XINPUT_KEYSTROKE :: struct {
    virtual_key : Virtual_Keys,
    unicode     : u16,
    flags       : Keystroke_Flags,
    user_index  : u8,
    hid_code    : u8
}
 
Virtual_Keys :: enum u16 {
    VK_PAD_A                = 0x5800,
    VK_PAD_B                = 0x5801,
    VK_PAD_X                = 0x5802,
    VK_PAD_Y                = 0x5803,
    VK_PAD_RSHOULDER        = 0x5804,
    VK_PAD_LSHOULDER        = 0x5805,
    VK_PAD_LTRIGGER         = 0x5806,
    VK_PAD_RTRIGGER         = 0x5807,
 
    VK_PAD_DPAD_UP          = 0x5810,
    VK_PAD_DPAD_DOWN        = 0x5811,
    VK_PAD_DPAD_LEFT        = 0x5812,
    VK_PAD_DPAD_RIGHT       = 0x5813,
    VK_PAD_START            = 0x5814,
    VK_PAD_BACK             = 0x5815,
    VK_PAD_LTHUMB_PRESS     = 0x5816,
    VK_PAD_RTHUMB_PRESS     = 0x5817,
 
    VK_PAD_LTHUMB_UP        = 0x5820,
    VK_PAD_LTHUMB_DOWN      = 0x5821,
    VK_PAD_LTHUMB_RIGHT     = 0x5822,
    VK_PAD_LTHUMB_LEFT      = 0x5823,
    VK_PAD_LTHUMB_UPLEFT    = 0x5824,
    VK_PAD_LTHUMB_UPRIGHT   = 0x5825,
    VK_PAD_LTHUMB_DOWNRIGHT = 0x5826,
    VK_PAD_LTHUMB_DOWNLEFT  = 0x5827,
 
    VK_PAD_RTHUMB_UP        = 0x5830,
    VK_PAD_RTHUMB_DOWN      = 0x5831,
    VK_PAD_RTHUMB_RIGHT     = 0x5832,
    VK_PAD_RTHUMB_LEFT      = 0x5833,
    VK_PAD_RTHUMB_UPLEFT    = 0x5834,
    VK_PAD_RTHUMB_UPRIGHT   = 0x5835,
    VK_PAD_RTHUMB_DOWNRIGHT = 0x5836,
    VK_PAD_RTHUMB_DOWNLEFT  = 0x5837,
}
 
Keystroke_Flags :: enum u16 {
    XINPUT_KEYSTROKE_KEYDOWN = 0x0001,
    XINPUT_KEYSTROKE_KEYUP   = 0x0002,
    XINPUT_KEYSTROKE_REPEAT  = 0x0004,
}
 
Battery_Devtype :: enum u8 {
    BATTERY_DEVTYPE_GAMEPAD = 0x00,
    BATTERY_DEVTYPE_HEADSET = 0x01,
}
 
XInput_Version :: enum {
    NotLoaded,
    Version1_4,
    Version1_3,
    Version9_1_0,
    Error
}
 
Version := XInput_Version.NotLoaded;
 
_XInputEnable                :: distinct #type proc "stdcall" (i32); //BOOL param
XInputEnableStub : _XInputEnable : proc "stdcall" (enable : i32) { }
// TODO: XInputGetAudioDeviceIds - https://docs.microsoft.com/en-us/windows/win32/api/xinput/nf-xinput-xinputgetaudiodeviceids
_XInputGetBatteryInformation :: distinct #type proc "stdcall" (u32, Battery_Devtype, ^XINPUT_BATTERY_INFORMATION) -> u32;
XInputGetBatteryInformationStub : _XInputGetBatteryInformation : proc "stdcall" (dwUserIndex : u32,
                                                                                 devType : Battery_Devtype,
                                                                                 pBatteryInformation : ^XINPUT_BATTERY_INFORMATION)  -> (Error : u32) {
    return 1167; //ERROR_DEVICE_NOT_CONNECTED
}
_XInputGetCapabilities       :: distinct #type proc "stdcall" (u32, u32, ^XINPUT_CAPABILITIES) -> u32;
XInputGetCapabilitiesStub : _XInputGetCapabilities : proc "stdcall" (dwUserIndex : u32,
                                                                     dwFlags : u32,
                                                                     pCapabilities : ^XINPUT_CAPABILITIES)  -> (Error : u32) {
    return 1167; //ERROR_DEVICE_NOT_CONNECTED
}
// TODO: XInputGetDSoundAudioDeviceGuids - https://docs.microsoft.com/en-us/windows/win32/api/xinput/nf-xinput-xinputgetdsoundaudiodeviceguids
_XInputGetKeystroke          :: distinct #type proc "stdcall" (u32, u32, ^XINPUT_KEYSTROKE) -> u32;
XInputGetKeystrokeStub : _XInputGetKeystroke : proc "stdcall" (dwUserIndex : u32,
                                                               dwReserved : u32,
                                                               pKeystroke : ^XINPUT_KEYSTROKE)  -> (Error : u32) {
    return 1167; //ERROR_DEVICE_NOT_CONNECTED
}
_XInputGetState              :: distinct #type proc "stdcall" (u32, ^XINPUT_STATE) -> u32;
XInputGetStateStub : _XInputGetState : proc "stdcall" (dwUserIndex : u32,
                                                       pState : ^XINPUT_STATE)  -> (Error : u32) {
    return 1167; //ERROR_DEVICE_NOT_CONNECTED
}
_XInputSetState              :: distinct #type proc "stdcall" (u32, ^XINPUT_VIBRATION) -> u32;
XInputSetStateStub : _XInputSetState : proc "stdcall" (dwUserIndex : u32,
                                                       pVibration : ^XINPUT_VIBRATION)  -> (Error : u32) {
    return 1167; //ERROR_DEVICE_NOT_CONNECTED
}

XInputEnable                := XInputEnableStub;
XInputGetBatteryInformation := XInputGetBatteryInformationStub;
XInputGetCapabilities       := XInputGetCapabilitiesStub;
XInputGetKeystroke          := XInputGetKeystrokeStub;
XInputGetState              := XInputGetStateStub;
XInputSetState              := XInputSetStateStub;
 
init :: proc(initialState : bool = true) -> bool {
    xinput_library := win32.load_library_a("XInput1_4.dll");
    using XInput_Version;
    Version = Version1_4;
 
    if xinput_library == nil {
        xinput_library := win32.load_library_a("XInput1_3.dll");
        Version = Version1_3;
    }
 
    if xinput_library == nil {
        xinput_library := win32.load_library_a("XInput9_1_0.dll");
        Version = Version9_1_0;
    }
 
    if xinput_library == nil {
        Version = Error;
        // TODO: Logging
        return false;
    }
 
    XInputGetCapabilities = cast(_XInputGetCapabilities)win32.get_proc_address(xinput_library, "XInputGetCapabilities");
    XInputGetState        = cast(_XInputGetState)win32.get_proc_address(xinput_library, "XInputGetState");
    XInputSetState        = cast(_XInputSetState)win32.get_proc_address(xinput_library, "XInputSetState");
 
    if Version == Version1_4 || Version == Version1_3 {
        XInputEnable       = cast(_XInputEnable)win32.get_proc_address(xinput_library, "XInputEnable");
        XInputGetKeystroke = cast(_XInputGetKeystroke)win32.get_proc_address(xinput_library, "XInputGetKeystroke");
        XInputEnable(i32(initialState));
    }

    if Version == Version1_4 {
        XInputGetBatteryInformation = cast(_XInputGetBatteryInformation)win32.get_proc_address(xinput_library, "XInputGetBatteryInformation");
        // TODO: XInputGetAudioDeviceIds
        // TODO: XInputGetDSoundAudioDeviceGuids
    }
 
 
    return true;
}