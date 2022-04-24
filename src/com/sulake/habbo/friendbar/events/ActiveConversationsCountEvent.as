// by nota

//com.sulake.habbo.friendbar.events.ActiveConversationsCountEvent

package com.sulake.habbo.friendbar.events
{
    import flash.events.Event;

    public class ActiveConversationsCountEvent extends Event 
    {

        public static const ACTIVE_MESSENGER_CONVERSATION_EVENT:String = "AMC_EVENT";

        private var _SafeStr_4937:int;

        public function ActiveConversationsCountEvent(_arg_1:int=-1)
        {
            _SafeStr_4937 = _arg_1;
            super("AMC_EVENT");
        }

        public function get activeConversationsCount():int
        {
            return (_SafeStr_4937);
        }


    }
}//package com.sulake.habbo.friendbar.events

// _SafeStr_4937 = "_-iz" (String#9223, DoABC#4)


