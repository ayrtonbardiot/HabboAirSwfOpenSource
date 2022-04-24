// by nota

//com.sulake.habbo.room.object.visualization.furniture.FurniturePartyBeamerVisualization

package com.sulake.habbo.room.object.visualization.furniture
{
    import flash.geom.Point;

    public class FurniturePartyBeamerVisualization extends AnimatedFurnitureVisualization 
    {

        private static const UPDATE_INTERVAL:int = 2;
        private static const AREA_DIAMETER_SMALL:int = 15;
        private static const AREA_DIAMETER_LARGE:int = 31;
        private static const ANIM_SPEED_FAST:int = 2;
        private static const _SafeStr_8751:int = 1;

        private var _SafeStr_5123:Array;
        private var _SafeStr_5124:Array;
        private var _SafeStr_5121:Array;
        private var _SafeStr_5125:Array;
        private var _SafeStr_5122:Array = [];


        override protected function updateAnimation(_arg_1:Number):int
        {
            var _local_3:* = null;
            var _local_2:* = null;
            if (_SafeStr_5121 == null)
            {
                initItems(_arg_1);
            };
            _local_3 = getSprite(2);
            if (_local_3 != null)
            {
                _SafeStr_5122[0] = getNewPoint(_arg_1, 0);
            };
            _local_3 = getSprite(3);
            if (_local_3 != null)
            {
                _SafeStr_5122[1] = getNewPoint(_arg_1, 1);
            };
            return (super.updateAnimation(_arg_1));
        }

        override protected function getSpriteXOffset(_arg_1:int, _arg_2:int, _arg_3:int):int
        {
            if (((_arg_3 == 2) || (_arg_3 == 3)))
            {
                if (_SafeStr_5122.length == 2)
                {
                    return (_SafeStr_5122[(_arg_3 - 2)].x);
                };
            };
            return (super.getSpriteXOffset(_arg_1, _arg_2, _arg_3));
        }

        override protected function getSpriteYOffset(_arg_1:int, _arg_2:int, _arg_3:int):int
        {
            if (((_arg_3 == 2) || (_arg_3 == 3)))
            {
                if (_SafeStr_5122.length == 2)
                {
                    return (_SafeStr_5122[(_arg_3 - 2)].y);
                };
            };
            return (super.getSpriteYOffset(_arg_1, _arg_2, _arg_3));
        }

        private function getNewPoint(_arg_1:Number, _arg_2:int):Point
        {
            var _local_8:int;
            var _local_10:Number = _SafeStr_5123[_arg_2];
            var _local_3:int = _SafeStr_5124[_arg_2];
            var _local_5:int = _SafeStr_5121[_arg_2];
            var _local_6:Number = _SafeStr_5125[_arg_2];
            var _local_11:* = 1;
            if (_arg_1 == 32)
            {
                _local_8 = 15;
                _local_11 = 0.5;
            }
            else
            {
                _local_8 = 31;
            };
            var _local_7:Number = (_local_10 + (_local_3 * _local_5));
            if (Math.abs(_local_7) >= _local_8)
            {
                if (_local_3 > 0)
                {
                    _local_10 = (_local_10 - (_local_7 - _local_8));
                }
                else
                {
                    _local_10 = (_local_10 + (-(_local_8) - _local_7));
                };
                _local_3 = -(_local_3);
                _SafeStr_5124[_arg_2] = _local_3;
            };
            var _local_4:Number = ((_local_8 - Math.abs(_local_10)) * _local_6);
            var _local_9:Number = ((_local_3 * Math.sin(Math.abs((_local_10 / 4)))) * _local_4);
            if (_local_3 > 0)
            {
                _local_9 = (_local_9 - _local_4);
            }
            else
            {
                _local_9 = (_local_9 + _local_4);
            };
            _local_10 = (_local_10 + ((_local_3 * _local_5) * _local_11));
            _SafeStr_5123[_arg_2] = _local_10;
            if (_local_9 == 0)
            {
                _SafeStr_5125[_arg_2] = getRandomAmplitudeFactor();
            };
            return (new Point(_local_10, _local_9));
        }

        private function initItems(_arg_1:Number):void
        {
            var _local_2:int;
            if (_arg_1 == 32)
            {
                _local_2 = 15;
            }
            else
            {
                _local_2 = 31;
            };
            _SafeStr_5123 = [];
            _SafeStr_5123.push(((Math.random() * _local_2) * 1.5));
            _SafeStr_5123.push(((Math.random() * _local_2) * 1.5));
            _SafeStr_5124 = [];
            _SafeStr_5124.push(1);
            _SafeStr_5124.push(-1);
            _SafeStr_5121 = [];
            _SafeStr_5121.push(2);
            _SafeStr_5121.push(1);
            _SafeStr_5125 = [];
            _SafeStr_5125.push(getRandomAmplitudeFactor());
            _SafeStr_5125.push(getRandomAmplitudeFactor());
        }

        private function getRandomAmplitudeFactor():Number
        {
            return (((Math.random() * 30) / 100) + 0.15);
        }


    }
}//package com.sulake.habbo.room.object.visualization.furniture

// _SafeStr_5121 = "_-7n" (String#10360, DoABC#4)
// _SafeStr_5122 = "_-k1T" (String#8121, DoABC#4)
// _SafeStr_5123 = "_-22b" (String#10351, DoABC#4)
// _SafeStr_5124 = "_-Zn" (String#10318, DoABC#4)
// _SafeStr_5125 = "_-D1R" (String#10935, DoABC#4)
// _SafeStr_8751 = "_-fj" (String#31813, DoABC#4)


