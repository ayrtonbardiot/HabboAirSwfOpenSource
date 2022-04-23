// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.events.SessionDataPreferencesEvent

package com.sulake.habbo.session.events
{
    import flash.events.Event;

    public class SessionDataPreferencesEvent extends Event 
    {

        public static const _SafeStr_8917:String = "APUE_UPDATED";

        private var _SafeStr_3822:int;

        public function SessionDataPreferencesEvent(_arg_1:int, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            _SafeStr_3822 = _arg_1;
            super("APUE_UPDATED", _arg_2, _arg_3);
        }

        public function get uiFlags():int
        {
            return (_SafeStr_3822);
        }


    }
}//package com.sulake.habbo.session.events

// _SafeStr_3822 = "_-I1Z" (String#4142, DoABC#4)
// _SafeStr_8917 = "_-G1v" (String#39483, DoABC#4)


