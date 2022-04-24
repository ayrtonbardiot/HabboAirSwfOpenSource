// by nota

//com.sulake.habbo.game.snowwar.arena.ISynchronizedGameObject

package com.sulake.habbo.game.snowwar.arena
{
    import com.sulake.core.runtime._SafeStr_13;

    public /*dynamic*/ interface ISynchronizedGameObject extends IGameObject, _SafeStr_13 
    {

        function get isActive():Boolean;
        function set isActive(_arg_1:Boolean):void;
        function get numberOfVariables():int;
        function getVariable(_arg_1:int):int;
        function subturn(_arg_1:_SafeStr_3309):void;
        function onRemove():void;

    }
}//package com.sulake.habbo.game.snowwar.arena

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3309 = "_-tx" (String#2281, DoABC#4)


