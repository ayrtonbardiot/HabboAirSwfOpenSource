// by nota

//com.sulake.habbo.game.snowwar.events.HumanThrowsSnowballAtHumanEvent

package com.sulake.habbo.game.snowwar.events
{
    import com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject;
    import com.sulake.habbo.game.snowwar.SnowWarEngine;
    import com.sulake.habbo.game.snowwar.arena._SafeStr_3309;

    public class HumanThrowsSnowballAtHumanEvent extends _SafeStr_3329 
    {

        private var _SafeStr_6591:HumanGameObject;
        private var _SafeStr_6882:HumanGameObject;
        private var _SafeStr_6248:int;

        public function HumanThrowsSnowballAtHumanEvent(_arg_1:HumanGameObject, _arg_2:HumanGameObject, _arg_3:int)
        {
            _SafeStr_6591 = _arg_1;
            _SafeStr_6882 = _arg_2;
            _SafeStr_6248 = _arg_3;
        }

        override public function dispose():void
        {
            super.dispose();
            _SafeStr_6591 = null;
            _SafeStr_6882 = null;
            _SafeStr_6248 = 0;
        }

        override public function apply(_arg_1:_SafeStr_3309):void
        {
            human.throwSnowball(_SafeStr_6882.currentLocation.x, _SafeStr_6882.currentLocation.y);
            human.startThrowTimer();
            SnowWarEngine.playSound("HBSTG_snowwar_throw");
        }

        public function get human():HumanGameObject
        {
            return (_SafeStr_6591);
        }

        public function get targetHuman():HumanGameObject
        {
            return (_SafeStr_6882);
        }

        public function get trajectory():int
        {
            return (_SafeStr_6248);
        }


    }
}//package com.sulake.habbo.game.snowwar.events

// _SafeStr_3309 = "_-tx" (String#2281, DoABC#4)
// _SafeStr_3329 = "_-S1J" (String#4049, DoABC#4)
// _SafeStr_6248 = "_-E1U" (String#2585, DoABC#4)
// _SafeStr_6591 = "_-jM" (String#2167, DoABC#4)
// _SafeStr_6882 = "_-pt" (String#9820, DoABC#4)


