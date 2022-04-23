// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.events.RoomWidgetEcotronBoxDataUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    import flash.display.BitmapData;

    public class RoomWidgetEcotronBoxDataUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const UPDATE_PACKAGEINFO:String = "RWEBDUE_PACKAGEINFO";
        public static const _SafeStr_8991:String = "RWEBDUE_CONTENTS";

        private var _SafeStr_4157:int = -1;
        private var _text:String;
        private var _furniTypeName:String;
        private var _SafeStr_4360:Boolean;
        private var _SafeStr_5631:BitmapData;

        public function RoomWidgetEcotronBoxDataUpdateEvent(_arg_1:String, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:Boolean=false, _arg_6:BitmapData=null, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(_arg_1, _arg_7, _arg_8);
            _SafeStr_4157 = _arg_2;
            _text = _arg_3;
            _furniTypeName = _arg_4;
            _SafeStr_4360 = _arg_5;
            _SafeStr_5631 = _arg_6;
        }

        public function get objectId():int
        {
            return (_SafeStr_4157);
        }

        public function get text():String
        {
            return (_text);
        }

        public function get controller():Boolean
        {
            return (_SafeStr_4360);
        }

        public function get iconBitmapData():BitmapData
        {
            return (_SafeStr_5631);
        }

        public function get furniTypeName():String
        {
            return (_furniTypeName);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_5631 = "_-O1C" (String#9795, DoABC#4)
// _SafeStr_8991 = "_-Mx" (String#30129, DoABC#4)


