// by nota

//com.sulake.habbo.game.snowwar.events.HumanGetsSnowballsFromMachineEvent

package com.sulake.habbo.game.snowwar.events
{
    import com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject;
    import com.sulake.habbo.game.snowwar.gameobjects.SnowballGivingGameObject;
    import com.sulake.habbo.game.snowwar.SnowWarEngine;
    import com.sulake.habbo.game.snowwar.arena._SafeStr_3309;

    public class HumanGetsSnowballsFromMachineEvent extends _SafeStr_3329 
    {

        private var _SafeStr_6591:HumanGameObject;
        private var _SafeStr_6528:SnowballGivingGameObject;

        public function HumanGetsSnowballsFromMachineEvent(_arg_1:HumanGameObject, _arg_2:SnowballGivingGameObject)
        {
            _SafeStr_6591 = _arg_1;
            _SafeStr_6528 = _arg_2;
        }

        override public function dispose():void
        {
            super.dispose();
            _SafeStr_6591 = null;
            _SafeStr_6528 = null;
        }

        override public function apply(_arg_1:_SafeStr_3309):void
        {
            var _local_3:int;
            var _local_2:* = null;
            var _local_4:int = _SafeStr_6591.getRemainingSnowballCapacity();
            if (_local_4 > 0)
            {
                _local_3 = _SafeStr_6528.pickupSnowballs(1);
                if (_local_3 > 0)
                {
                    _SafeStr_6591.addSnowballs(_local_3);
                    _local_2 = (_arg_1.getGameObject(_SafeStr_6591.ghostObjectId) as HumanGameObject);
                    if (_local_2)
                    {
                        _local_2.addSnowballs(_local_3);
                    };
                    SnowWarEngine.playSound("HBSTG_snowwar_get_snowball");
                };
            };
        }

        public function get human():HumanGameObject
        {
            return (_SafeStr_6591);
        }


    }
}//package com.sulake.habbo.game.snowwar.events

// _SafeStr_3309 = "_-tx" (String#2281, DoABC#4)
// _SafeStr_3329 = "_-S1J" (String#4049, DoABC#4)
// _SafeStr_6528 = "_-Y1v" (String#5722, DoABC#4)
// _SafeStr_6591 = "_-jM" (String#2167, DoABC#4)


