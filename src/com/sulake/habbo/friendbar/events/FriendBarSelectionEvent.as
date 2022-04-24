// by nota

//com.sulake.habbo.friendbar.events.FriendBarSelectionEvent

package com.sulake.habbo.friendbar.events
{
    import flash.events.Event;

    public class FriendBarSelectionEvent extends Event 
    {

        public static const FRIEND_SELECTED:String = "FBVE_FRIEND_SELECTED";

        private var _SafeStr_5407:int;
        private var _friendName:String;

        public function FriendBarSelectionEvent(_arg_1:int, _arg_2:String)
        {
            super("FBVE_FRIEND_SELECTED");
            _SafeStr_5407 = _arg_1;
            _friendName = _arg_2;
        }

        public function get friendId():int
        {
            return (_SafeStr_5407);
        }

        public function get friendName():String
        {
            return (_friendName);
        }


    }
}//package com.sulake.habbo.friendbar.events

// _SafeStr_5407 = "_-c3" (String#6830, DoABC#4)


