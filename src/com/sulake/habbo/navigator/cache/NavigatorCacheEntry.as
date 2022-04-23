// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.cache.NavigatorCacheEntry

package com.sulake.habbo.navigator.cache
{
    import _-21f._SafeStr_3197;

    public class NavigatorCacheEntry 
    {

        private var _key:String;
        private var _SafeStr_6328:_SafeStr_3197;
        private var _SafeStr_8655:Number;
        private var _SafeStr_6327:Number;

        public function NavigatorCacheEntry(_arg_1:String, _arg_2:_SafeStr_3197, _arg_3:Number, _arg_4:Number)
        {
            _key = _arg_1;
            _SafeStr_6328 = _arg_2;
            _SafeStr_8655 = _arg_3;
            _SafeStr_6327 = _arg_4;
        }

        public function hasExpired(_arg_1:Number):Boolean
        {
            return (_arg_1 >= _SafeStr_6327);
        }

        public function get key():String
        {
            return (_key);
        }

        public function get payload():_SafeStr_3197
        {
            return (_SafeStr_6328);
        }


    }
}//package com.sulake.habbo.navigator.cache

// _SafeStr_3197 = "_-fs" (String#4924, DoABC#4)
// _SafeStr_6327 = "_-l1Y" (String#21500, DoABC#4)
// _SafeStr_6328 = "_-K1s" (String#22494, DoABC#4)
// _SafeStr_8655 = "_-Lg" (String#23826, DoABC#4)


