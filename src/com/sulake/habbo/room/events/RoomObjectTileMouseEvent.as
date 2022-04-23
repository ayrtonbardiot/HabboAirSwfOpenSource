// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.events.RoomObjectTileMouseEvent

package com.sulake.habbo.room.events
{
    import com.sulake.room.events.RoomObjectMouseEvent;
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectTileMouseEvent extends RoomObjectMouseEvent 
    {

        private var _SafeStr_5231:Number;
        private var _SafeStr_5232:Number;
        private var _SafeStr_5233:Number;

        public function RoomObjectTileMouseEvent(_arg_1:String, _arg_2:IRoomObject, _arg_3:String, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Boolean=false, _arg_8:Boolean=false, _arg_9:Boolean=false, _arg_10:Boolean=false, _arg_11:Boolean=false, _arg_12:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11, _arg_12);
            _SafeStr_5231 = _arg_4;
            _SafeStr_5232 = _arg_5;
            _SafeStr_5233 = _arg_6;
        }

        public function get tileX():Number
        {
            return (_SafeStr_5231);
        }

        public function get tileY():Number
        {
            return (_SafeStr_5232);
        }

        public function get tileZ():Number
        {
            return (_SafeStr_5233);
        }

        public function get tileXAsInt():int
        {
            return (_SafeStr_5231 + 0.499);
        }

        public function get tileYAsInt():int
        {
            return (_SafeStr_5232 + 0.499);
        }

        public function get tileZAsInt():int
        {
            return (_SafeStr_5233 + 0.499);
        }


    }
}//package com.sulake.habbo.room.events

// _SafeStr_5231 = "_-U1W" (String#15396, DoABC#4)
// _SafeStr_5232 = "_-2n" (String#15312, DoABC#4)
// _SafeStr_5233 = "_-rG" (String#13968, DoABC#4)


