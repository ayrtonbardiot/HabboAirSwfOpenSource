// by nota

//com.sulake.habbo.navigator.cache.NavigatorCache

package com.sulake.habbo.navigator.cache
{
    import flash.utils.Dictionary;
    import flash.utils.getTimer;
    import _-21f._SafeStr_3197;

    public class NavigatorCache 
    {

        private static const EXPIRATION_TIME:Number = 4000;

        private var _entriesByKey:Dictionary;

        public function NavigatorCache()
        {
            _entriesByKey = new Dictionary();
        }

        public function put(_arg_1:String, _arg_2:_SafeStr_3197):void
        {
            removeExpiredEntries();
            var _local_3:Number = getTimer();
            _entriesByKey[_arg_1] = new NavigatorCacheEntry(_arg_1, _arg_2, _local_3, expiresAt(_local_3));
        }

        public function getEntry(_arg_1:String):_SafeStr_3197
        {
            var _local_2:NavigatorCacheEntry = _entriesByKey[_arg_1];
            if (_local_2 != null)
            {
                if (_local_2.hasExpired(getTimer()))
                {
                    delete _entriesByKey[_arg_1];
                    return (null);
                };
                return (_local_2.payload);
            };
            return (null);
        }

        public function removeEntry(_arg_1:String):void
        {
            delete _entriesByKey[_arg_1]; //not popped
        }

        private function removeExpiredEntries():void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            for (var _local_1:Object in _entriesByKey)
            {
                _local_3 = String(_local_1);
                _local_2 = _entriesByKey[_local_3];
                if (((_local_2 == null) || (_local_2.hasExpired(getTimer()))))
                {
                    delete _entriesByKey[_local_3];
                };
            };
        }

        private function expiresAt(_arg_1:Number):Number
        {
            return (_arg_1 + 4000);
        }


    }
}//package com.sulake.habbo.navigator.cache

// _SafeStr_3197 = "_-fs" (String#4924, DoABC#4)


