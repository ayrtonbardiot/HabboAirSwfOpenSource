// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.animation.AddDataContainer

package com.sulake.habbo.avatar.animation
{
    public class AddDataContainer 
    {

        private var _SafeStr_3820:String;
        private var _SafeStr_6441:String;
        private var _SafeStr_5650:String;
        private var _SafeStr_6412:String;
        private var _SafeStr_4427:Number = 1;

        public function AddDataContainer(_arg_1:XML)
        {
            _SafeStr_3820 = String(_arg_1.@id);
            _SafeStr_6441 = String(_arg_1.@align);
            _SafeStr_5650 = String(_arg_1.@base);
            _SafeStr_6412 = String(_arg_1.@ink);
            var _local_2:String = String(_arg_1.@blend);
            if (_local_2.length > 0)
            {
                _SafeStr_4427 = _local_2;
                if (_SafeStr_4427 > 1)
                {
                    _SafeStr_4427 = (_SafeStr_4427 / 100);
                };
            };
        }

        public function get id():String
        {
            return (_SafeStr_3820);
        }

        public function get align():String
        {
            return (_SafeStr_6441);
        }

        public function get base():String
        {
            return (_SafeStr_5650);
        }

        public function get ink():String
        {
            return (_SafeStr_6412);
        }

        public function get blend():Number
        {
            return (_SafeStr_4427);
        }

        public function get isBlended():Boolean
        {
            return (!(_SafeStr_4427 == 1));
        }


    }
}//package com.sulake.habbo.avatar.animation

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4427 = "_-x1" (String#2030, DoABC#4)
// _SafeStr_5650 = "_-u1r" (String#6565, DoABC#4)
// _SafeStr_6412 = "_-hl" (String#4387, DoABC#4)
// _SafeStr_6441 = "_-e1T" (String#5203, DoABC#4)


