// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.game.snowwar.utils._SafeStr_3331

package com.sulake.habbo.game.snowwar.utils
{
    import com.sulake.habbo.game.snowwar.arena.IGameObject;

    public class _SafeStr_3331 implements _SafeStr_3330 
    {

        private var _referenceNumber:int = -1;
        private var _nodeDirection8:Direction8;
        private var _SafeStr_5937:_SafeStr_3330;
        private var _SafeStr_5938:int;
        private var _SafeStr_5939:int;
        private var _SafeStr_4036:Boolean = false;


        public function dispose():void
        {
            _nodeDirection8 = null;
            _SafeStr_5937 = null;
            _SafeStr_5938 = 0;
            _SafeStr_5939 = 0;
            _SafeStr_4036 = true;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function get nodeDirection():Direction8
        {
            return (_nodeDirection8);
        }

        public function set nodeDirection(_arg_1:Direction8):void
        {
            _nodeDirection8 = _arg_1;
        }

        public function get parentNode():_SafeStr_3330
        {
            return (_SafeStr_5937);
        }

        public function set parentNode(_arg_1:_SafeStr_3330):void
        {
            this._SafeStr_5937 = _arg_1;
        }

        public function get nodeCostToGoal():int
        {
            return (_SafeStr_5938);
        }

        public function set nodeCostToGoal(_arg_1:int):void
        {
            this._SafeStr_5938 = _arg_1;
        }

        public function get nodeCostFromStart():int
        {
            return (_SafeStr_5939);
        }

        public function set nodeCostFromStart(_arg_1:int):void
        {
            this._SafeStr_5939 = _arg_1;
        }

        public function compareTo(_arg_1:_SafeStr_3331):int
        {
            var _local_3:int = (_SafeStr_5939 + _SafeStr_5938);
            var _local_2:int = (_arg_1._SafeStr_5939 + _arg_1._SafeStr_5938);
            if (_local_3 < _local_2)
            {
                return (-1);
            };
            if (_local_3 > _local_2)
            {
                return (1);
            };
            return (0);
        }

        public function distanceTo(_arg_1:_SafeStr_3330):int
        {
            return (0);
        }

        public function directionTo(_arg_1:_SafeStr_3330):Direction8
        {
            return (null);
        }

        public function getNodeAt(_arg_1:Direction8):_SafeStr_3330
        {
            return (null);
        }

        public function directionIsBlocked(_arg_1:Direction8, _arg_2:IGameObject):Boolean
        {
            return (false);
        }

        public function getPathCost(_arg_1:Direction8, _arg_2:IGameObject):int
        {
            return (0);
        }


    }
}//package com.sulake.habbo.game.snowwar.utils

// _SafeStr_3330 = "_-S1s" (String#4225, DoABC#4)
// _SafeStr_3331 = "_-S1V" (String#12367, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_5937 = "_-l1W" (String#14800, DoABC#4)
// _SafeStr_5938 = "_-z1p" (String#10522, DoABC#4)
// _SafeStr_5939 = "_-c6" (String#10407, DoABC#4)


