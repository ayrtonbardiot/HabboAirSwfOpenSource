// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.messages.RoomWidgetDimmerPreviewMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetDimmerPreviewMessage extends RoomWidgetMessage 
    {

        public static const PREVIEW:String = "RWDPM_PREVIEW_DIMMER_PRESET";

        private var _color:uint;
        private var _SafeStr_4025:int;
        private var _SafeStr_4486:Boolean;

        public function RoomWidgetDimmerPreviewMessage(_arg_1:uint, _arg_2:int, _arg_3:Boolean)
        {
            super("RWDPM_PREVIEW_DIMMER_PRESET");
            _color = _arg_1;
            _SafeStr_4025 = _arg_2;
            _SafeStr_4486 = _arg_3;
        }

        public function get color():uint
        {
            return (_color);
        }

        public function get brightness():int
        {
            return (_SafeStr_4025);
        }

        public function get bgOnly():Boolean
        {
            return (_SafeStr_4486);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_4025 = "_-TO" (String#3020, DoABC#4)
// _SafeStr_4486 = "_-K1" (String#6454, DoABC#4)


