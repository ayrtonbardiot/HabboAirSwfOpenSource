// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.messages.RoomWidgetDimmerSavePresetMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage 
    {

        public static const WIDGET_MESSAGE_SAVE_DIMMER_PRESET:String = "RWSDPM_SAVE_PRESET";

        private var _presetNumber:int;
        private var _SafeStr_6510:int;
        private var _color:uint;
        private var _SafeStr_4025:int;
        private var _SafeStr_6511:Boolean;

        public function RoomWidgetDimmerSavePresetMessage(_arg_1:int, _arg_2:int, _arg_3:uint, _arg_4:int, _arg_5:Boolean)
        {
            super("RWSDPM_SAVE_PRESET");
            _presetNumber = _arg_1;
            _SafeStr_6510 = _arg_2;
            _color = _arg_3;
            _SafeStr_4025 = _arg_4;
            _SafeStr_6511 = _arg_5;
        }

        public function get presetNumber():int
        {
            return (_presetNumber);
        }

        public function get effectTypeId():int
        {
            return (_SafeStr_6510);
        }

        public function get color():uint
        {
            return (_color);
        }

        public function get brightness():int
        {
            return (_SafeStr_4025);
        }

        public function get apply():Boolean
        {
            return (_SafeStr_6511);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_4025 = "_-TO" (String#3020, DoABC#4)
// _SafeStr_6510 = "_-i15" (String#16462, DoABC#4)
// _SafeStr_6511 = "_-51y" (String#19829, DoABC#4)


