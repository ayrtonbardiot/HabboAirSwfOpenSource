// by nota

//com.sulake.habbo.quest.AchievementCategories

package com.sulake.habbo.quest
{
    import flash.utils.Dictionary;
    import __AS3__.vec.Vector;
    import _-p1o._SafeStr_1618;

    public class AchievementCategories 
    {

        private static const ACHIEVEMENT_DISABLED:int = 0;
        private static const ACHIEVEMENT_ENABLED:int = 1;
        private static const ACHIEVEMENT_ARCHIVED:int = 2;
        private static const ACHIEVEMENT_OFF_SEASON:int = 3;
        private static const ACHIEVEMENT_CATEGORY_ARCHIVED:String = "archive";

        private var _SafeStr_5478:Dictionary = new Dictionary();
        private var _SafeStr_5479:Vector.<AchievementCategory> = new Vector.<AchievementCategory>(0);

        public function AchievementCategories(_arg_1:Array)
        {
            var _local_4:* = null;
            var _local_5:* = null;
            super();
            var _local_2:AchievementCategory = new AchievementCategory("archive");
            _SafeStr_5478["archive"] = _local_2;
            for each (var _local_3:_SafeStr_1618 in _arg_1)
            {
                if (_local_3.category != "")
                {
                    if (_local_3.state == 2)
                    {
                        _local_5 = _SafeStr_5478["archive"];
                    }
                    else
                    {
                        _local_5 = _SafeStr_5478[_local_3.category];
                    };
                    if (_local_5 == null)
                    {
                        _local_5 = new AchievementCategory(_local_3.category);
                        _SafeStr_5478[_local_3.category] = _local_5;
                        if (_local_3.category != "misc")
                        {
                            _SafeStr_5479.push(_local_5);
                        }
                        else
                        {
                            _local_4 = _local_5;
                        };
                    };
                    _local_5.add(_local_3);
                };
            };
            if (_local_4 != null)
            {
                _SafeStr_5479.push(_local_4);
            };
            _SafeStr_5479.push(_local_2);
        }

        public function update(_arg_1:_SafeStr_1618):void
        {
            if (_arg_1.category == "")
            {
                return;
            };
            var _local_2:AchievementCategory = _SafeStr_5478[_arg_1.category];
            _local_2.update(_arg_1);
        }

        public function get categoryList():Vector.<AchievementCategory>
        {
            return (_SafeStr_5479);
        }

        public function getMaxProgress():int
        {
            var _local_1:int;
            for each (var _local_2:AchievementCategory in _SafeStr_5479)
            {
                _local_1 = (_local_1 + _local_2.getMaxProgress());
            };
            return (_local_1);
        }

        public function getProgress():int
        {
            var _local_1:int;
            for each (var _local_2:AchievementCategory in _SafeStr_5479)
            {
                _local_1 = (_local_1 + _local_2.getProgress());
            };
            return (_local_1);
        }

        public function getCategoryByCode(_arg_1:String):AchievementCategory
        {
            for each (var _local_2:AchievementCategory in _SafeStr_5479)
            {
                if (_local_2.code == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }


    }
}//package com.sulake.habbo.quest

// _SafeStr_1618 = "_-N2" (String#3339, DoABC#4)
// _SafeStr_5478 = "_-fd" (String#10086, DoABC#4)
// _SafeStr_5479 = "_-I1y" (String#7110, DoABC#4)


