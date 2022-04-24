// by nota

//com.sulake.habbo.avatar.cache.AvatarImageActionCache

package com.sulake.habbo.avatar.cache
{
    import com.sulake.core.utils._SafeStr_24;
    import flash.utils.getTimer;

    public class AvatarImageActionCache 
    {

        private var _cache:_SafeStr_24;
        private var _lastAccessTime:int;

        public function AvatarImageActionCache()
        {
            _cache = new _SafeStr_24();
            setLastAccessTime(getTimer());
        }

        public function dispose():void
        {
            debugInfo("[dispose]");
            if (_cache == null)
            {
                return;
            };
            for each (var _local_1:AvatarImageDirectionCache in _cache)
            {
                _local_1.dispose();
            };
            _cache.dispose();
        }

        public function getDirectionCache(_arg_1:int):AvatarImageDirectionCache
        {
            var _local_2:String = _arg_1.toString();
            return (_cache.getValue(_local_2) as AvatarImageDirectionCache);
        }

        public function updateDirectionCache(_arg_1:int, _arg_2:AvatarImageDirectionCache):void
        {
            var _local_3:String = _arg_1.toString();
            _cache.add(_local_3, _arg_2);
        }

        public function setLastAccessTime(_arg_1:int):void
        {
            _lastAccessTime = _arg_1;
        }

        public function getLastAccessTime():int
        {
            return (_lastAccessTime);
        }

        private function debugInfo(_arg_1:String):void
        {
        }


    }
}//package com.sulake.habbo.avatar.cache

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)


