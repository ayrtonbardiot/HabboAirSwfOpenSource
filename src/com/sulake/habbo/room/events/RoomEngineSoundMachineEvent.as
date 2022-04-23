// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.events.RoomEngineSoundMachineEvent

package com.sulake.habbo.room.events
{
    public class RoomEngineSoundMachineEvent extends RoomEngineObjectEvent 
    {

        public static const SOUND_MACHINE_INIT:String = "ROSM_SOUND_MACHINE_INIT";
        public static const SOUND_MACHINE_SWITCHED_ON:String = "ROSM_SOUND_MACHINE_SWITCHED_ON";
        public static const SOUND_MACHINE_SWITCHED_OFF:String = "ROSM_SOUND_MACHINE_SWITCHED_OFF";
        public static const SOUND_MACHINE_DISPOSE:String = "ROSM_SOUND_MACHINE_DISPOSE";
        public static const JUKEBOX_INIT:String = "ROSM_JUKEBOX_INIT";
        public static const _SafeStr_8713:String = "ROSM_JUKEBOX_SWITCHED_ON";
        public static const _SafeStr_8714:String = "ROSM_JUKEBOX_SWITCHED_OFF";
        public static const _SafeStr_8715:String = "ROSM_JUKEBOX_DISPOSE";

        public function RoomEngineSoundMachineEvent(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6);
        }

    }
}//package com.sulake.habbo.room.events

// _SafeStr_8713 = "_-p1b" (String#38874, DoABC#4)
// _SafeStr_8714 = "_-ZK" (String#32038, DoABC#4)
// _SafeStr_8715 = "_-AC" (String#31282, DoABC#4)


