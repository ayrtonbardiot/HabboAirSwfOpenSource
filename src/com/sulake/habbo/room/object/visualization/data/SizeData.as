﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.data.SizeData

package com.sulake.habbo.room.object.visualization.data
{
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.room.utils._SafeStr_1675;

    public class SizeData 
    {

        public static const LAYER_LIMIT:int = 1000;
        public static const DEFAULT_DIRECTION:int = 0;

        private var _SafeStr_4169:int = 0;
        private var _SafeStr_5764:int = 360;
        private var _defaultDirection:DirectionData = null;
        private var _directions:_SafeStr_24;
        private var _colors:_SafeStr_24;
        private var _SafeStr_5765:DirectionData = null;
        private var _lastDirection:int = -1;

        public function SizeData(_arg_1:int, _arg_2:int)
        {
            if (_arg_1 < 0)
            {
                _arg_1 = 0;
            };
            if (_arg_1 > 1000)
            {
                _arg_1 = 1000;
            };
            _SafeStr_4169 = _arg_1;
            if (_arg_2 < 1)
            {
                _arg_2 = 1;
            };
            if (_arg_2 > 360)
            {
                _arg_2 = 360;
            };
            _SafeStr_5764 = _arg_2;
            _defaultDirection = new DirectionData(_arg_1);
            _directions = new _SafeStr_24();
            _colors = new _SafeStr_24();
        }

        public function dispose():void
        {
            var _local_3:* = null;
            var _local_1:* = null;
            if (_defaultDirection != null)
            {
                _defaultDirection.dispose();
                _defaultDirection = null;
            };
            var _local_2:int;
            if (_directions != null)
            {
                _local_3 = null;
                _local_2 = 0;
                while (_local_2 < _directions.length)
                {
                    _local_3 = (_directions.getWithIndex(_local_2) as DirectionData);
                    if (_local_3 != null)
                    {
                        _local_3.dispose();
                    };
                    _local_2++;
                };
                _directions.dispose();
                _directions = null;
            };
            _SafeStr_5765 = null;
            if (_colors != null)
            {
                _local_1 = null;
                _local_2 = 0;
                while (_local_2 < _colors.length)
                {
                    _local_1 = (_colors.getWithIndex(_local_2) as ColorData);
                    if (_local_1 != null)
                    {
                        _local_1.dispose();
                    };
                    _local_2++;
                };
                _colors.dispose();
                _colors = null;
            };
        }

        public function get layerCount():int
        {
            return (_SafeStr_4169);
        }

        public function defineLayers(_arg_1:XML):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            var _local_2:XMLList = _arg_1.layer;
            return (defineDirection(_defaultDirection, _local_2));
        }

        public function defineDirections(_arg_1:XML):Boolean
        {
            var _local_3:int;
            var _local_8:* = null;
            var _local_7:int;
            var _local_4:* = null;
            if (_arg_1 == null)
            {
                return (false);
            };
            var _local_2:Array = ["id"];
            var _local_5:DirectionData;
            var _local_6:XMLList = _arg_1.direction;
            _local_3 = 0;
            while (_local_3 < _local_6.length())
            {
                _local_8 = _local_6[_local_3];
                if (!_SafeStr_1675.checkRequiredAttributes(_local_8, _local_2))
                {
                    return (false);
                };
                _local_7 = int(_local_8.@id);
                _local_4 = _local_8.layer;
                if (_directions.getValue(String(_local_7)) != null)
                {
                    return (false);
                };
                _local_5 = new DirectionData(layerCount);
                _local_5.copyValues(_defaultDirection);
                defineDirection(_local_5, _local_4);
                _directions.add(_local_7, _local_5);
                _lastDirection = -1;
                _SafeStr_5765 = null;
                _local_3++;
            };
            return (true);
        }

        private function defineDirection(_arg_1:DirectionData, _arg_2:XMLList):Boolean
        {
            var _local_5:int;
            var _local_10:* = null;
            var _local_7:int;
            var _local_8:* = null;
            var _local_4:* = null;
            var _local_3:int;
            var _local_6:int;
            if (((_arg_1 == null) || (_arg_2 == null)))
            {
                return (false);
            };
            var _local_9:Array = ["id"];
            _local_5 = 0;
            while (_local_5 < _arg_2.length())
            {
                _local_10 = _arg_2[_local_5];
                if (!_SafeStr_1675.checkRequiredAttributes(_local_10, _local_9))
                {
                    return (false);
                };
                _local_7 = int(_local_10.@id);
                if (((_local_7 < 0) || (_local_7 >= layerCount)))
                {
                    return (false);
                };
                _local_8 = _local_10.@tag;
                if (_local_8.length > 0)
                {
                    _arg_1.setTag(_local_7, _local_8);
                };
                _local_4 = _local_10.@ink;
                switch (_local_4)
                {
                    case "ADD":
                        _arg_1.setInk(_local_7, 1);
                        break;
                    case "SUBTRACT":
                        _arg_1.setInk(_local_7, 2);
                        break;
                    case "DARKEN":
                        _arg_1.setInk(_local_7, 3);
                };
                _local_8 = _local_10.@alpha;
                if (_local_8.length > 0)
                {
                    _arg_1.setAlpha(_local_7, _local_8);
                };
                _local_8 = _local_10.@ignoreMouse;
                if (_local_8.length > 0)
                {
                    _local_3 = _local_8;
                    _arg_1.setIgnoreMouse(_local_7, (!(_local_3 == 0)));
                };
                _local_8 = _local_10.@x;
                if (_local_8.length > 0)
                {
                    _arg_1.setXOffset(_local_7, _local_8);
                };
                _local_8 = _local_10.@y;
                if (_local_8.length > 0)
                {
                    _arg_1.setYOffset(_local_7, _local_8);
                };
                _local_8 = _local_10.@z;
                if (_local_8.length > 0)
                {
                    _local_6 = _local_8;
                    _arg_1.setZOffset(_local_7, (_local_6 / -1000));
                };
                _local_5++;
            };
            return (true);
        }

        public function defineColors(_arg_1:XML):Boolean
        {
            var _local_6:int;
            var _local_3:* = null;
            var _local_13:* = null;
            var _local_10:* = null;
            var _local_7:int;
            var _local_4:* = null;
            var _local_9:int;
            var _local_12:int;
            if (_arg_1 == null)
            {
                return (true);
            };
            var _local_5:ColorData;
            var _local_11:Array = ["id"];
            var _local_2:Array = ["id", "color"];
            var _local_8:XMLList = _arg_1.color;
            _local_6 = 0;
            while (_local_6 < _local_8.length())
            {
                _local_3 = _local_8[_local_6];
                if (!_SafeStr_1675.checkRequiredAttributes(_local_3, _local_11))
                {
                    return (false);
                };
                _local_13 = _local_3.@id;
                if (_colors.getValue(_local_13) != null)
                {
                    return (false);
                };
                _local_5 = new ColorData(layerCount);
                _local_10 = _local_3.colorLayer;
                _local_7 = 0;
                while (_local_7 < _local_10.length())
                {
                    _local_4 = _local_10[_local_7];
                    if (!_SafeStr_1675.checkRequiredAttributes(_local_4, _local_2))
                    {
                        _local_5.dispose();
                        return (false);
                    };
                    _local_9 = int(_local_4.@id);
                    _local_12 = parseInt(_local_4.@color, 16);
                    _local_5.setColor(_local_12, _local_9);
                    _local_7++;
                };
                if (_local_5 != null)
                {
                    _colors.add(_local_13, _local_5);
                };
                _local_6++;
            };
            return (true);
        }

        public function getDirectionValue(_arg_1:int):int
        {
            var _local_4:int;
            var _local_5:int;
            var _local_2:int;
            var _local_6:int = int((((((_arg_1 % 360) + 360) + (_SafeStr_5764 / 2)) % 360) / _SafeStr_5764));
            if (_directions.getValue(String(_local_6)) != null)
            {
                return (_local_6);
            };
            _local_6 = (((_arg_1 % 360) + 360) % 360);
            var _local_7:int = -1;
            var _local_3:int = -1;
            _local_4 = 0;
            while (_local_4 < _directions.length)
            {
                _local_5 = (_directions.getKey(_local_4) * _SafeStr_5764);
                _local_2 = (((_local_5 - _local_6) + 360) % 360);
                if (_local_2 > 180)
                {
                    _local_2 = (360 - _local_2);
                };
                if (((_local_2 < _local_7) || (_local_7 < 0)))
                {
                    _local_7 = _local_2;
                    _local_3 = _local_4;
                };
                _local_4++;
            };
            if (_local_3 >= 0)
            {
                return (_directions.getKey(_local_3));
            };
            return (0);
        }

        private function getDirectionData(_arg_1:int):DirectionData
        {
            if (((_arg_1 == _lastDirection) && (!(_SafeStr_5765 == null))))
            {
                return (_SafeStr_5765);
            };
            var _local_2:DirectionData;
            _local_2 = (_directions.getValue(String(_arg_1)) as DirectionData);
            if (_local_2 == null)
            {
                _local_2 = _defaultDirection;
            };
            _lastDirection = _arg_1;
            _SafeStr_5765 = _local_2;
            return (_SafeStr_5765);
        }

        public function getTag(_arg_1:int, _arg_2:int):String
        {
            var _local_3:DirectionData;
            _local_3 = getDirectionData(_arg_1);
            if (_local_3 != null)
            {
                return (_local_3.getTag(_arg_2));
            };
            return ("");
        }

        public function getInk(_arg_1:int, _arg_2:int):int
        {
            var _local_3:DirectionData;
            _local_3 = getDirectionData(_arg_1);
            if (_local_3 != null)
            {
                return (_local_3.getInk(_arg_2));
            };
            return (0);
        }

        public function getAlpha(_arg_1:int, _arg_2:int):int
        {
            var _local_3:DirectionData;
            _local_3 = getDirectionData(_arg_1);
            if (_local_3 != null)
            {
                return (_local_3.getAlpha(_arg_2));
            };
            return (0xFF);
        }

        public function getColor(_arg_1:int, _arg_2:int):uint
        {
            var _local_3:ColorData = (_colors.getValue(String(_arg_2)) as ColorData);
            if (_local_3 != null)
            {
                return (_local_3.getColor(_arg_1));
            };
            return (0xFFFFFF);
        }

        public function getIgnoreMouse(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_3:DirectionData;
            _local_3 = getDirectionData(_arg_1);
            if (_local_3 != null)
            {
                return (_local_3.getIgnoreMouse(_arg_2));
            };
            return (false);
        }

        public function getXOffset(_arg_1:int, _arg_2:int):int
        {
            var _local_3:DirectionData;
            _local_3 = getDirectionData(_arg_1);
            if (_local_3 != null)
            {
                return (_local_3.getXOffset(_arg_2));
            };
            return (0);
        }

        public function getYOffset(_arg_1:int, _arg_2:int):int
        {
            var _local_3:DirectionData;
            _local_3 = getDirectionData(_arg_1);
            if (_local_3 != null)
            {
                return (_local_3.getYOffset(_arg_2));
            };
            return (0);
        }

        public function getZOffset(_arg_1:int, _arg_2:int):Number
        {
            var _local_3:DirectionData;
            _local_3 = getDirectionData(_arg_1);
            if (_local_3 != null)
            {
                return (_local_3.getZOffset(_arg_2));
            };
            return (0);
        }


    }
}//package com.sulake.habbo.room.object.visualization.data

// _SafeStr_1675 = "_-j1M" (String#2347, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_4169 = "_-j4" (String#3264, DoABC#4)
// _SafeStr_5764 = "_-p17" (String#11785, DoABC#4)
// _SafeStr_5765 = "_-iX" (String#7175, DoABC#4)


