// by nota

//com.sulake.habbo.quest.events.UnseenAchievementsCountUpdateEvent

package com.sulake.habbo.quest.events
{
    import flash.events.Event;

    public class UnseenAchievementsCountUpdateEvent extends Event 
    {

        public static const TYPE:String = "qe_uacue";

        private var _SafeStr_5259:int;

        public function UnseenAchievementsCountUpdateEvent(_arg_1:int, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super("qe_uacue", _arg_2, _arg_3);
            _SafeStr_5259 = _arg_1;
        }

        public function get count():int
        {
            return (_SafeStr_5259);
        }


    }
}//package com.sulake.habbo.quest.events

// _SafeStr_5259 = "_-61s" (String#20040, DoABC#4)


