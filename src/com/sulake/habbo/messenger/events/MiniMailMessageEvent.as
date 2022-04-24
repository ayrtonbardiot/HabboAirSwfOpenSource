// by nota

//com.sulake.habbo.messenger.events.MiniMailMessageEvent

package com.sulake.habbo.messenger.events
{
    import flash.events.Event;

    public class MiniMailMessageEvent extends Event 
    {

        public static const _SafeStr_8640:String = "MMME_new";
        public static const _SafeStr_8641:String = "MMME_unread";

        private var _SafeStr_5378:int;

        public function MiniMailMessageEvent(_arg_1:String, _arg_2:int=-1)
        {
            super(_arg_1);
            _SafeStr_5378 = _arg_2;
        }

        public function get unreadCount():int
        {
            return (_SafeStr_5378);
        }


    }
}//package com.sulake.habbo.messenger.events

// _SafeStr_5378 = "_-VV" (String#19149, DoABC#4)
// _SafeStr_8640 = "_-22e" (String#29319, DoABC#4)
// _SafeStr_8641 = "_-b1e" (String#37415, DoABC#4)


