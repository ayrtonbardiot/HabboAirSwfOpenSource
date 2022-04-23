// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.game.snowwar._SafeStr_3352

package com.sulake.habbo.game.snowwar
{
    import com.sulake.habbo.game.snowwar.arena.IGameArenaExtension;
    import com.sulake.habbo.game.snowwar.arena.SynchronizedGameArena;
    import com.sulake.habbo.game.snowwar.arena._SafeStr_3308;

    public class _SafeStr_3352 implements IGameArenaExtension 
    {

        private var _SafeStr_5062:SynchronizedGameArena;
        private var _SafeStr_4036:Boolean = false;


        public function dispose():void
        {
            _SafeStr_4036 = true;
            _SafeStr_5062 = null;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function set gameArena(_arg_1:SynchronizedGameArena):void
        {
            _SafeStr_5062 = _arg_1;
        }

        public function getPulseInterval():int
        {
            return (50);
        }

        public function getNumberOfSubTurns():int
        {
            return (3);
        }

        public function createGameStage():_SafeStr_3308
        {
            return (new _SafeStr_3310());
        }

        public function pulse():void
        {
        }

        public function isDeathMatch():Boolean
        {
            return (_SafeStr_5062.numberOfTeams == 1);
        }


    }
}//package com.sulake.habbo.game.snowwar

// _SafeStr_3308 = "_-DZ" (String#13313, DoABC#4)
// _SafeStr_3310 = "_-M1m" (String#2514, DoABC#4)
// _SafeStr_3352 = "_-32E" (String#7620, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_5062 = "_-81r" (String#2028, DoABC#4)


