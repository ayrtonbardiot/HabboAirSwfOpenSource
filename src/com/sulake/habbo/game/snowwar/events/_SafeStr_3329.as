// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.game.snowwar.events._SafeStr_3329

package com.sulake.habbo.game.snowwar.events
{
    import com.sulake.habbo.game.snowwar.arena.ISynchronizedGameEvent;
    import com.sulake.habbo.game.snowwar.arena._SafeStr_3309;

    public class _SafeStr_3329 implements ISynchronizedGameEvent 
    {

        private var _SafeStr_4036:Boolean = false;


        public function apply(_arg_1:_SafeStr_3309):void
        {
        }

        public function dispose():void
        {
            _SafeStr_4036 = true;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }


    }
}//package com.sulake.habbo.game.snowwar.events

// _SafeStr_3309 = "_-tx" (String#2281, DoABC#4)
// _SafeStr_3329 = "_-S1J" (String#4049, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)


