// by nota

//com.sulake.habbo.game.snowwar.events.HumanLeftGameEvent

package com.sulake.habbo.game.snowwar.events
{
    import com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject;
    import com.sulake.habbo.game.snowwar.arena._SafeStr_3309;

    public class HumanLeftGameEvent extends _SafeStr_3329 
    {

        private var _SafeStr_6591:HumanGameObject;

        public function HumanLeftGameEvent(_arg_1:HumanGameObject)
        {
            _SafeStr_6591 = _arg_1;
        }

        override public function dispose():void
        {
            super.dispose();
            _SafeStr_6591 = null;
        }

        override public function apply(_arg_1:_SafeStr_3309):void
        {
            _arg_1.putGameObjectOnDeleteList(_SafeStr_6591);
            _SafeStr_6591.onRemove();
        }


    }
}//package com.sulake.habbo.game.snowwar.events

// _SafeStr_3309 = "_-tx" (String#2281, DoABC#4)
// _SafeStr_3329 = "_-S1J" (String#4049, DoABC#4)
// _SafeStr_6591 = "_-jM" (String#2167, DoABC#4)


