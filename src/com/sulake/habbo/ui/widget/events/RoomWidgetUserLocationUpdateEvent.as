// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.events.RoomWidgetUserLocationUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    import flash.geom.Rectangle;
    import flash.geom.Point;

    public class RoomWidgetUserLocationUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const USER_LOCATION_UPDATE:String = "RWULUE_USER_LOCATION_UPDATE";

        private var _SafeStr_4128:int;
        private var _SafeStr_6389:Rectangle;
        private var _screenLocation:Point;

        public function RoomWidgetUserLocationUpdateEvent(_arg_1:int, _arg_2:Rectangle, _arg_3:Point, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super("RWULUE_USER_LOCATION_UPDATE", _arg_4, _arg_5);
            _SafeStr_4128 = _arg_1;
            _SafeStr_6389 = _arg_2;
            _screenLocation = _arg_3;
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get rectangle():Rectangle
        {
            return (_SafeStr_6389);
        }

        public function get screenLocation():Point
        {
            return (_screenLocation);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_6389 = "_-C1U" (String#2446, DoABC#4)


