// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.events.RoomObjectBadgeAssetEvent

package com.sulake.habbo.room.events
{
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectBadgeAssetEvent extends RoomObjectEvent 
    {

        public static const LOAD_BADGE:String = "ROGBE_LOAD_BADGE";

        private var _SafeStr_4615:String;
        private var _SafeStr_4936:Boolean;

        public function RoomObjectBadgeAssetEvent(_arg_1:String, _arg_2:IRoomObject, _arg_3:String, _arg_4:Boolean=true, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_5, _arg_6);
            _SafeStr_4615 = _arg_3;
            _SafeStr_4936 = _arg_4;
        }

        public function get badgeId():String
        {
            return (_SafeStr_4615);
        }

        public function get groupBadge():Boolean
        {
            return (_SafeStr_4936);
        }


    }
}//package com.sulake.habbo.room.events

// _SafeStr_4615 = "_-91W" (String#2170, DoABC#4)
// _SafeStr_4936 = "_-nO" (String#8969, DoABC#4)


