// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.events.RoomWidgetRoomViewUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    import flash.geom.Rectangle;
    import flash.geom.Point;

    public class RoomWidgetRoomViewUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const ROOM_VIEW_SIZE_CHANGED:String = "RWRVUE_ROOM_VIEW_SIZE_CHANGED";
        public static const ROOM_VIEW_SCALE_CHANGED:String = "RWRVUE_ROOM_VIEW_SCALE_CHANGED";
        public static const ROOM_VIEW_POSITION_CHANGED:String = "RWRVUE_ROOM_VIEW_POSITION_CHANGED";

        private var _SafeStr_6486:Rectangle;
        private var _SafeStr_6487:Point;
        private var _SafeStr_4045:Number = 0;

        public function RoomWidgetRoomViewUpdateEvent(_arg_1:String, _arg_2:Rectangle=null, _arg_3:Point=null, _arg_4:Number=0, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(_arg_1, _arg_5, _arg_6);
            _SafeStr_6486 = _arg_2;
            _SafeStr_6487 = _arg_3;
            _SafeStr_4045 = _arg_4;
        }

        public function get rect():Rectangle
        {
            if (_SafeStr_6486 != null)
            {
                return (_SafeStr_6486.clone());
            };
            return (null);
        }

        public function get positionDelta():Point
        {
            if (_SafeStr_6487 != null)
            {
                return (_SafeStr_6487.clone());
            };
            return (null);
        }

        public function get scale():Number
        {
            return (_SafeStr_4045);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_4045 = "_-22r" (String#725, DoABC#4)
// _SafeStr_6486 = "_-FA" (String#14134, DoABC#4)
// _SafeStr_6487 = "_-KJ" (String#14653, DoABC#4)


