// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.actions.ActionType

package com.sulake.habbo.avatar.actions
{
    public class ActionType 
    {

        private var _SafeStr_3820:int;
        private var _SafeStr_4525:int;
        private var _SafeStr_6288:Array = [];
        private var _SafeStr_6289:Boolean = true;
        private var _SafeStr_6679:Boolean = true;

        public function ActionType(_arg_1:XML)
        {
            _SafeStr_3820 = parseInt(_arg_1.@value);
            _SafeStr_4525 = parseInt(_arg_1.@value);
            var _local_3:String = String(_arg_1.@prevents);
            if (_local_3 != "")
            {
                _SafeStr_6288 = _local_3.split(",");
            };
            _SafeStr_6289 = (String(_arg_1.@preventheadturn) == "true");
            var _local_2:String = String(_arg_1.@animated);
            if (_local_2 == "")
            {
                _SafeStr_6679 = true;
            }
            else
            {
                _SafeStr_6679 = (_local_2 == "true");
            };
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get value():int
        {
            return (_SafeStr_4525);
        }

        public function get prevents():Array
        {
            return (_SafeStr_6288);
        }

        public function get preventHeadTurn():Boolean
        {
            return (_SafeStr_6289);
        }

        public function get isAnimated():Boolean
        {
            return (_SafeStr_6679);
        }


    }
}//package com.sulake.habbo.avatar.actions

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4525 = "_-8S" (String#1037, DoABC#4)
// _SafeStr_6288 = "_-z1T" (String#6219, DoABC#4)
// _SafeStr_6289 = "_-32V" (String#8412, DoABC#4)
// _SafeStr_6679 = "_-z12" (String#12127, DoABC#4)


