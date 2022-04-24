// by nota

//com.sulake.habbo.friendbar.groupforums.UnseenForumsCountUpdatedEvent

package com.sulake.habbo.friendbar.groupforums
{
    import flash.events.Event;

    public class UnseenForumsCountUpdatedEvent extends Event 
    {

        public static const TYPE:String = "UNSEEN_FORUMS_COUNT";

        private var _SafeStr_4629:int;

        public function UnseenForumsCountUpdatedEvent(_arg_1:String, _arg_2:int)
        {
            super(_arg_1);
            _SafeStr_4629 = _arg_2;
        }

        public function get unseenForumsCount():int
        {
            return (_SafeStr_4629);
        }


    }
}//package com.sulake.habbo.friendbar.groupforums

// _SafeStr_4629 = "_-r1y" (String#9683, DoABC#4)


