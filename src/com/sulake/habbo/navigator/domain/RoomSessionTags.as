// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.domain.RoomSessionTags

package com.sulake.habbo.navigator.domain
{
    import _-M1k._SafeStr_817;

    public class RoomSessionTags 
    {

        private var _tag1:String;
        private var _tag2:String;

        public function RoomSessionTags(_arg_1:String, _arg_2:String)
        {
            _tag1 = _arg_1;
            _tag2 = _arg_2;
        }

        public function getMsg():_SafeStr_817
        {
            return (new _SafeStr_817(_tag1, _tag2));
        }


    }
}//package com.sulake.habbo.navigator.domain

// _SafeStr_817 = "_-kr" (String#24599, DoABC#4)


