// by nota

//com.sulake.habbo.quest.events.QuestCompletedEvent

package com.sulake.habbo.quest.events
{
    import flash.events.Event;
    import _-41O._SafeStr_1607;

    public class QuestCompletedEvent extends Event 
    {

        public static const QUEST_SEASONAL:String = "qce_seasonal";

        private var _SafeStr_5972:_SafeStr_1607;

        public function QuestCompletedEvent(_arg_1:String, _arg_2:_SafeStr_1607, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            _SafeStr_5972 = _arg_2;
        }

        public function get questData():_SafeStr_1607
        {
            return (_SafeStr_5972);
        }


    }
}//package com.sulake.habbo.quest.events

// _SafeStr_1607 = "_-oH" (String#1847, DoABC#4)
// _SafeStr_5972 = "_-OW" (String#18610, DoABC#4)


