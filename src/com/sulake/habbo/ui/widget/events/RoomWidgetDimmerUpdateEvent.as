// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.events.RoomWidgetDimmerUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetDimmerUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const _SafeStr_8990:String = "RWDUE_PRESETS";
        public static const DIMMER_HIDE:String = "RWDUE_HIDE";

        private var _SafeStr_4233:int = 0;
        private var _SafeStr_4022:Array = [];

        public function RoomWidgetDimmerUpdateEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        public function get selectedPresetId():int
        {
            return (_SafeStr_4233);
        }

        public function get presetCount():int
        {
            return (_SafeStr_4022.length);
        }

        public function get presets():Array
        {
            return (_SafeStr_4022);
        }

        public function set selectedPresetId(_arg_1:int):void
        {
            _SafeStr_4233 = _arg_1;
        }

        public function storePreset(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):void
        {
            var _local_5:RoomWidgetDimmerUpdateEventPresetItem = new RoomWidgetDimmerUpdateEventPresetItem(_arg_1, _arg_2, _arg_3, _arg_4);
            _SafeStr_4022[(_arg_1 - 1)] = _local_5;
        }

        public function getPreset(_arg_1:int):RoomWidgetDimmerUpdateEventPresetItem
        {
            if (((_arg_1 < 0) || (_arg_1 >= _SafeStr_4022.count)))
            {
                return (null);
            };
            return (_SafeStr_4022[_arg_1]);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_4022 = "_-3L" (String#3262, DoABC#4)
// _SafeStr_4233 = "_-Tw" (String#10103, DoABC#4)
// _SafeStr_8990 = "_-v1m" (String#34161, DoABC#4)


