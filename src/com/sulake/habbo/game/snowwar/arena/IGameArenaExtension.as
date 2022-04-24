// by nota

//com.sulake.habbo.game.snowwar.arena.IGameArenaExtension

package com.sulake.habbo.game.snowwar.arena
{
    import com.sulake.core.runtime._SafeStr_13;

    public /*dynamic*/ interface IGameArenaExtension extends _SafeStr_13 
    {

        function createGameStage():_SafeStr_3308;
        function set gameArena(_arg_1:SynchronizedGameArena):void;
        function pulse():void;
        function getPulseInterval():int;
        function getNumberOfSubTurns():int;

    }
}//package com.sulake.habbo.game.snowwar.arena

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3308 = "_-DZ" (String#13313, DoABC#4)


