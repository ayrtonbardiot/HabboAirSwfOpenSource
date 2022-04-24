// by nota

//com.sulake.habbo.session.events.RoomSessionDimmerPresetsEvent

package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionDimmerPresetsEvent extends RoomSessionEvent 
    {

        public static const ROOM_DIMMER_PRESETS:String = "RSDPE_PRESETS";

        private var _SafeStr_4233:int = 0;
        private var _SafeStr_4022:Array = [];

        public function RoomSessionDimmerPresetsEvent(_arg_1:String, _arg_2:IRoomSession, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
        }

        public function get selectedPresetId():int
        {
            return (_SafeStr_4233);
        }

        public function get presetCount():int
        {
            return (_SafeStr_4022.length);
        }

        public function set selectedPresetId(_arg_1:int):void
        {
            _SafeStr_4233 = _arg_1;
        }

        public function storePreset(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):void
        {
            var _local_5:RoomSessionDimmerPresetsEventPresetItem = new RoomSessionDimmerPresetsEventPresetItem(_arg_1, _arg_2, _arg_3, _arg_4);
            _SafeStr_4022[(_arg_1 - 1)] = _local_5;
        }

        public function getPreset(_arg_1:int):RoomSessionDimmerPresetsEventPresetItem
        {
            if (((_arg_1 < 0) || (_arg_1 >= _SafeStr_4022.count)))
            {
                return (null);
            };
            return (_SafeStr_4022[_arg_1]);
        }


    }
}//package com.sulake.habbo.session.events

// _SafeStr_4022 = "_-3L" (String#3262, DoABC#4)
// _SafeStr_4233 = "_-Tw" (String#10103, DoABC#4)


