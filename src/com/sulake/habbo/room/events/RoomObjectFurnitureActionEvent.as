// by nota

//com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent

package com.sulake.habbo.room.events
{
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectFurnitureActionEvent extends RoomObjectEvent 
    {

        public static const _SafeStr_8716:String = "ROFCAE_DICE_OFF";
        public static const _SafeStr_8717:String = "ROFCAE_DICE_ACTIVATE";
        public static const USE_HABBOWHEEL:String = "ROFCAE_USE_HABBOWHEEL";
        public static const STICKIE:String = "ROFCAE_STICKIE";
        public static const _SafeStr_8718:String = "ROFCAE_ENTER_ONEWAYDOOR";
        public static const SOUND_MACHINE_INIT:String = "ROFCAE_SOUND_MACHINE_INIT";
        public static const SOUND_MACHINE_START:String = "ROFCAE_SOUND_MACHINE_START";
        public static const SOUND_MACHINE_STOP:String = "ROFCAE_SOUND_MACHINE_STOP";
        public static const SOUND_MACHINE_DISPOSE:String = "ROFCAE_SOUND_MACHINE_DISPOSE";
        public static const JUKEBOX_INIT:String = "ROFCAE_JUKEBOX_INIT";
        public static const _SafeStr_8719:String = "ROFCAE_JUKEBOX_START";
        public static const _SafeStr_8720:String = "ROFCAE_JUKEBOX_MACHINE_STOP";
        public static const _SafeStr_8715:String = "ROFCAE_JUKEBOX_DISPOSE";
        public static const CURSOR_REQUEST_BUTTON:String = "ROFCAE_MOUSE_BUTTON";
        public static const CURSOR_REQUEST_ARROW:String = "ROFCAE_MOUSE_ARROW";

        public function RoomObjectFurnitureActionEvent(_arg_1:String, _arg_2:IRoomObject, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
        }

    }
}//package com.sulake.habbo.room.events

// _SafeStr_8715 = "_-AC" (String#31282, DoABC#4)
// _SafeStr_8716 = "_-21d" (String#34269, DoABC#4)
// _SafeStr_8717 = "_-iM" (String#32313, DoABC#4)
// _SafeStr_8718 = "_-Bw" (String#39704, DoABC#4)
// _SafeStr_8719 = "_-d8" (String#31831, DoABC#4)
// _SafeStr_8720 = "_-wv" (String#34572, DoABC#4)


