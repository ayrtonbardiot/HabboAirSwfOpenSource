// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.game.snowwar.events.HumanThrowsSnowballAtPositionEvent

package com.sulake.habbo.game.snowwar.events
{
    import com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject;
    import com.sulake.habbo.game.snowwar.SnowWarEngine;
    import com.sulake.habbo.game.snowwar.arena._SafeStr_3309;

    public class HumanThrowsSnowballAtPositionEvent extends _SafeStr_3329 
    {

        private var _SafeStr_6591:HumanGameObject;
        private var _SafeStr_6637:int;
        private var _SafeStr_6638:int;
        private var _SafeStr_6248:int;

        public function HumanThrowsSnowballAtPositionEvent(_arg_1:HumanGameObject, _arg_2:int, _arg_3:int, _arg_4:int)
        {
            this._SafeStr_6591 = _arg_1;
            this._SafeStr_6637 = _arg_2;
            this._SafeStr_6638 = _arg_3;
            this._SafeStr_6248 = _arg_4;
        }

        override public function dispose():void
        {
            super.dispose();
            _SafeStr_6591 = null;
        }

        override public function apply(_arg_1:_SafeStr_3309):void
        {
            human.throwSnowball(targetX, targetY);
            human.startThrowTimer();
            SnowWarEngine.playSound("HBSTG_snowwar_throw");
        }

        public function get human():HumanGameObject
        {
            return (_SafeStr_6591);
        }

        public function get targetX():int
        {
            return (_SafeStr_6637);
        }

        public function get targetY():int
        {
            return (_SafeStr_6638);
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
// _SafeStr_6637 = "_-K11" (String#13173, DoABC#4)
// _SafeStr_6638 = "_-kM" (String#13429, DoABC#4)


