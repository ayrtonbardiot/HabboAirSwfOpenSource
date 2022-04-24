// by nota

//com.sulake.habbo.ui.widget.events.RoomWidgetPresentDataUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    import flash.display.BitmapData;

    public class RoomWidgetPresentDataUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const UPDATE_PACKAGEINFO:String = "RWPDUE_PACKAGEINFO";
        public static const _SafeStr_8991:String = "RWPDUE_CONTENTS";
        public static const _SafeStr_9000:String = "RWPDUE_CONTENTS_CLUB";
        public static const _SafeStr_9001:String = "RWPDUE_CONTENTS_FLOOR";
        public static const UPDATE_CONTENTS_LANDSCAPE:String = "RWPDUE_CONTENTS_LANDSCAPE";
        public static const UPDATE_CONTENTS_WALLPAPER:String = "RWPDUE_CONTENTS_WALLPAPER";
        public static const UPDATE_CONTENTS_IMAGE:String = "RWPDUE_CONTENTS_IMAGE";

        private var _SafeStr_4157:int = -1;
        private var _SafeStr_4862:int = 0;
        private var _SafeStr_4110:String = "";
        private var _text:String;
        private var _SafeStr_4360:Boolean;
        private var _SafeStr_5631:BitmapData;
        private var _purchaserName:String;
        private var _SafeStr_5632:String;
        private var _SafeStr_4951:int = -1;
        private var _SafeStr_4953:String = "";
        private var _placedInRoom:Boolean;

        public function RoomWidgetPresentDataUpdateEvent(_arg_1:String, _arg_2:int, _arg_3:String, _arg_4:Boolean=false, _arg_5:BitmapData=null, _arg_6:String=null, _arg_7:String=null, _arg_8:Boolean=false, _arg_9:Boolean=false)
        {
            super(_arg_1, _arg_8, _arg_9);
            _SafeStr_4157 = _arg_2;
            _text = _arg_3;
            _SafeStr_4360 = _arg_4;
            _SafeStr_5631 = _arg_5;
            _purchaserName = _arg_6;
            _SafeStr_5632 = _arg_7;
        }

        public function get objectId():int
        {
            return (_SafeStr_4157);
        }

        public function get classId():int
        {
            return (_SafeStr_4862);
        }

        public function set classId(_arg_1:int):void
        {
            _SafeStr_4862 = _arg_1;
        }

        public function get itemType():String
        {
            return (_SafeStr_4110);
        }

        public function set itemType(_arg_1:String):void
        {
            _SafeStr_4110 = _arg_1;
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

        public function get purchaserName():String
        {
            return (_purchaserName);
        }

        public function get purchaserFigure():String
        {
            return (_SafeStr_5632);
        }

        public function get placedItemId():int
        {
            return (_SafeStr_4951);
        }

        public function set placedItemId(_arg_1:int):void
        {
            _SafeStr_4951 = _arg_1;
        }

        public function get placedInRoom():Boolean
        {
            return (_placedInRoom);
        }

        public function set placedInRoom(_arg_1:Boolean):void
        {
            _placedInRoom = _arg_1;
        }

        public function get placedItemType():String
        {
            return (_SafeStr_4953);
        }

        public function set placedItemType(_arg_1:String):void
        {
            _SafeStr_4953 = _arg_1;
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_4110 = "_-BF" (String#2380, DoABC#4)
// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_4862 = "_-Q1H" (String#2645, DoABC#4)
// _SafeStr_4951 = "_-A7" (String#2579, DoABC#4)
// _SafeStr_4953 = "_-s13" (String#3835, DoABC#4)
// _SafeStr_5631 = "_-O1C" (String#9795, DoABC#4)
// _SafeStr_5632 = "_-O1f" (String#21269, DoABC#4)
// _SafeStr_8991 = "_-Mx" (String#30129, DoABC#4)
// _SafeStr_9000 = "_-r1P" (String#41027, DoABC#4)
// _SafeStr_9001 = "_-mO" (String#32430, DoABC#4)


