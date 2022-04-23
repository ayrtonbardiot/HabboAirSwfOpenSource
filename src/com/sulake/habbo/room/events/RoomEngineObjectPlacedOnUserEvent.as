// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.events.RoomEngineObjectPlacedOnUserEvent

package com.sulake.habbo.room.events
{
    public class RoomEngineObjectPlacedOnUserEvent extends RoomEngineObjectEvent 
    {

        private var _SafeStr_4159:int;
        private var _SafeStr_4160:int;

        public function RoomEngineObjectPlacedOnUserEvent(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_7, _arg_8);
            _SafeStr_4159 = droppedObjectId;
            _SafeStr_4160 = _arg_6;
        }

        public function get droppedObjectId():int
        {
            return (_SafeStr_4159);
        }

        public function get droppedObjectCategory():int
        {
            return (_SafeStr_4160);
        }


    }
}//package com.sulake.habbo.room.events

// _SafeStr_4159 = "_-T1T" (String#21873, DoABC#4)
// _SafeStr_4160 = "_-zG" (String#18560, DoABC#4)


