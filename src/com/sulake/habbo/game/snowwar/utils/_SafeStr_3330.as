// by nota

//com.sulake.habbo.game.snowwar.utils._SafeStr_3330

package com.sulake.habbo.game.snowwar.utils
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.game.snowwar.arena.IGameObject;

    public /*dynamic*/ interface _SafeStr_3330 extends _SafeStr_13 
    {

        function distanceTo(_arg_1:_SafeStr_3330):int;
        function directionTo(_arg_1:_SafeStr_3330):Direction8;
        function getNodeAt(_arg_1:Direction8):_SafeStr_3330;
        function directionIsBlocked(_arg_1:Direction8, _arg_2:IGameObject):Boolean;
        function getPathCost(_arg_1:Direction8, _arg_2:IGameObject):int;
        function set nodeDirection(_arg_1:Direction8):void;
        function get nodeDirection():Direction8;
        function set parentNode(_arg_1:_SafeStr_3330):void;
        function get parentNode():_SafeStr_3330;
        function set nodeCostFromStart(_arg_1:int):void;
        function get nodeCostFromStart():int;
        function set nodeCostToGoal(_arg_1:int):void;
        function get nodeCostToGoal():int;

    }
}//package com.sulake.habbo.game.snowwar.utils

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3330 = "_-S1s" (String#4225, DoABC#4)


