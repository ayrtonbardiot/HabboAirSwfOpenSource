// by nota

//com.sulake.habbo.avatar.animation.SpriteDataContainer

package com.sulake.habbo.avatar.animation
{
    public class SpriteDataContainer implements ISpriteDataContainer 
    {

        private var _animation:IAnimation;
        private var _SafeStr_3820:String;
        private var _SafeStr_6412:int;
        private var _SafeStr_6712:String;
        private var _SafeStr_6713:Boolean;
        private var _SafeStr_6714:Boolean;
        private var _SafeStr_5651:Array;
        private var _SafeStr_5652:Array;
        private var _SafeStr_5653:Array;

        public function SpriteDataContainer(_arg_1:IAnimation, _arg_2:XML)
        {
            var _local_4:int;
            super();
            _animation = _arg_1;
            _SafeStr_3820 = String(_arg_2.@id);
            _SafeStr_6412 = parseInt(_arg_2.@ink);
            _SafeStr_6712 = String(_arg_2.@member);
            _SafeStr_6714 = parseInt(_arg_2.@staticY);
            _SafeStr_6713 = parseInt(_arg_2.@directions);
            _SafeStr_5651 = [];
            _SafeStr_5652 = [];
            _SafeStr_5653 = [];
            for each (var _local_3:XML in _arg_2.direction)
            {
                _local_4 = parseInt(_local_3.@id);
                _SafeStr_5651[_local_4] = parseInt(_local_3.@dx);
                _SafeStr_5652[_local_4] = parseInt(_local_3.@dy);
                _SafeStr_5653[_local_4] = parseInt(_local_3.@dz);
            };
        }

        public function getDirectionOffsetX(_arg_1:int):int
        {
            if (_arg_1 < _SafeStr_5651.length)
            {
                return (_SafeStr_5651[_arg_1]);
            };
            return (0);
        }

        public function getDirectionOffsetY(_arg_1:int):int
        {
            if (_arg_1 < _SafeStr_5652.length)
            {
                return (_SafeStr_5652[_arg_1]);
            };
            return (0);
        }

        public function getDirectionOffsetZ(_arg_1:int):int
        {
            if (_arg_1 < _SafeStr_5653.length)
            {
                return (_SafeStr_5653[_arg_1]);
            };
            return (0);
        }

        public function get animation():IAnimation
        {
            return (_animation);
        }

        public function get id():String
        {
            return (_SafeStr_3820);
        }

        public function get ink():int
        {
            return (_SafeStr_6412);
        }

        public function get member():String
        {
            return (_SafeStr_6712);
        }

        public function get hasDirections():Boolean
        {
            return (_SafeStr_6713);
        }

        public function get hasStaticY():Boolean
        {
            return (_SafeStr_6714);
        }


    }
}//package com.sulake.habbo.avatar.animation

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_5651 = "_-D1T" (String#7828, DoABC#4)
// _SafeStr_5652 = "_-h1z" (String#7680, DoABC#4)
// _SafeStr_5653 = "_-K1y" (String#7249, DoABC#4)
// _SafeStr_6412 = "_-hl" (String#4387, DoABC#4)
// _SafeStr_6712 = "_-f0" (String#19002, DoABC#4)
// _SafeStr_6713 = "_-b1d" (String#16007, DoABC#4)
// _SafeStr_6714 = "_-cm" (String#19115, DoABC#4)


