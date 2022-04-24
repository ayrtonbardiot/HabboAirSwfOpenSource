// by nota

//com.sulake.habbo.quest.AchievementCategory

package com.sulake.habbo.quest
{
    import __AS3__.vec.Vector;
    import _-p1o._SafeStr_1618;

    public class AchievementCategory 
    {

        private var _SafeStr_4404:String;
        private var _SafeStr_4403:Vector.<_SafeStr_1618> = new Vector.<_SafeStr_1618>(0);

        public function AchievementCategory(_arg_1:String)
        {
            _SafeStr_4404 = _arg_1;
        }

        public function add(_arg_1:_SafeStr_1618):void
        {
            _SafeStr_4403.push(_arg_1);
        }

        public function update(_arg_1:_SafeStr_1618):void
        {
            var _local_3:int;
            var _local_2:* = null;
            _local_3 = 0;
            while (_local_3 < _SafeStr_4403.length)
            {
                _local_2 = _SafeStr_4403[_local_3];
                if (_local_2.achievementId == _arg_1.achievementId)
                {
                    _SafeStr_4403[_local_3] = _arg_1;
                };
                _local_3++;
            };
        }

        public function getProgress():int
        {
            var _local_1:int;
            for each (var _local_2:_SafeStr_1618 in _SafeStr_4403)
            {
                _local_1 = (_local_1 + ((_local_2.finalLevel) ? _local_2.level : (_local_2.level - 1)));
            };
            return (_local_1);
        }

        public function getMaxProgress():int
        {
            var _local_1:int;
            for each (var _local_2:_SafeStr_1618 in _SafeStr_4403)
            {
                _local_1 = (_local_1 + _local_2.levelCount);
            };
            return (_local_1);
        }

        public function get code():String
        {
            return (_SafeStr_4404);
        }

        public function get achievements():Vector.<_SafeStr_1618>
        {
            return (_SafeStr_4403);
        }


    }
}//package com.sulake.habbo.quest

// _SafeStr_1618 = "_-N2" (String#3339, DoABC#4)
// _SafeStr_4403 = "_-RC" (String#4634, DoABC#4)
// _SafeStr_4404 = "_-S1r" (String#21589, DoABC#4)


