// by nota

//com.sulake.habbo.messenger.events.ActiveConversationEvent

package com.sulake.habbo.messenger.events
{
    import flash.events.Event;

    public class ActiveConversationEvent extends Event 
    {

        public static const ACTIVE_CONVERSATION_COUNT_CHANGED:String = "ACCE_changed";

        private var _SafeStr_4937:int;

        public function ActiveConversationEvent(_arg_1:String, _arg_2:int=-1)
        {
            super(_arg_1);
            _SafeStr_4937 = _arg_2;
        }

        public function get activeConversationsCount():int
        {
            return (_SafeStr_4937);
        }


    }
}//package com.sulake.habbo.messenger.events

// _SafeStr_4937 = "_-iz" (String#9223, DoABC#4)


