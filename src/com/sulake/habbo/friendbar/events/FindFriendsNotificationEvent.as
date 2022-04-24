// by nota

//com.sulake.habbo.friendbar.events.FindFriendsNotificationEvent

package com.sulake.habbo.friendbar.events
{
    import flash.events.Event;

    public class FindFriendsNotificationEvent extends Event 
    {

        public static const TYPE:String = "FIND_FRIENDS_RESULT";

        private var _SafeStr_5449:Boolean;

        public function FindFriendsNotificationEvent(_arg_1:Boolean)
        {
            _SafeStr_5449 = _arg_1;
            super("FIND_FRIENDS_RESULT");
        }

        public function get success():Boolean
        {
            return (_SafeStr_5449);
        }


    }
}//package com.sulake.habbo.friendbar.events

// _SafeStr_5449 = "_-od" (String#17885, DoABC#4)


