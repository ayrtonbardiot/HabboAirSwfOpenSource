// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.quest.events.QuestsListEvent

package com.sulake.habbo.quest.events
{
    import flash.events.Event;

    public class QuestsListEvent extends Event 
    {

        public static const QUESTS_SEASONAL:String = "qe_quests_seasonal";
        public static const QUESTS:String = "qu_quests";

        private var _SafeStr_6003:Array;
        private var _SafeStr_6004:Boolean;

        public function QuestsListEvent(_arg_1:String, _arg_2:Array, _arg_3:Boolean, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(_arg_1, _arg_4, _arg_5);
            _SafeStr_6003 = _arg_2;
        }

        public function get quests():Array
        {
            return (_SafeStr_6003);
        }

        public function get openWindow():Boolean
        {
            return (_SafeStr_6004);
        }


    }
}//package com.sulake.habbo.quest.events

// _SafeStr_6003 = "_-LL" (String#3423, DoABC#4)
// _SafeStr_6004 = "_-iw" (String#30936, DoABC#4)


