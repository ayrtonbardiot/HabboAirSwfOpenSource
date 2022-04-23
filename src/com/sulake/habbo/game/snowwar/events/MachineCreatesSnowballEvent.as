// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.game.snowwar.events.MachineCreatesSnowballEvent

package com.sulake.habbo.game.snowwar.events
{
    import com.sulake.habbo.game.snowwar.gameobjects.SnowballMachineGameObject;
    import com.sulake.habbo.game.snowwar.arena._SafeStr_3309;

    public class MachineCreatesSnowballEvent extends _SafeStr_3329 
    {

        private var _SafeStr_6528:SnowballMachineGameObject;

        public function MachineCreatesSnowballEvent(_arg_1:SnowballMachineGameObject)
        {
            _SafeStr_6528 = _arg_1;
        }

        override public function dispose():void
        {
            super.dispose();
            _SafeStr_6528 = null;
        }

        override public function apply(_arg_1:_SafeStr_3309):void
        {
            if (_SafeStr_6528)
            {
                _SafeStr_6528.createSnowball();
            }
            else
            {
                HabboGamesCom.log("Too early for this stuff..");
            };
        }


    }
}//package com.sulake.habbo.game.snowwar.events

// _SafeStr_3309 = "_-tx" (String#2281, DoABC#4)
// _SafeStr_3329 = "_-S1J" (String#4049, DoABC#4)
// _SafeStr_6528 = "_-Y1v" (String#5722, DoABC#4)


