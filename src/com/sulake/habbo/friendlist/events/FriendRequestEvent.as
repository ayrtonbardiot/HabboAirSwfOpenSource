// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendlist.events.FriendRequestEvent

package com.sulake.habbo.friendlist.events
{
    import flash.events.Event;

    public class FriendRequestEvent extends Event 
    {

        public static const ACCEPTED:String = "FRE_ACCEPTED";
        public static const DECLINED:String = "FRE_DECLINED";

        private var _SafeStr_4313:int;

        public function FriendRequestEvent(_arg_1:String, _arg_2:int, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            _SafeStr_4313 = _arg_2;
        }

        public function get requestId():int
        {
            return (_SafeStr_4313);
        }


    }
}//package com.sulake.habbo.friendlist.events

// _SafeStr_4313 = "_-B7" (String#2703, DoABC#4)


