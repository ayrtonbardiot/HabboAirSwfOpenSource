﻿// by nota

//com.sulake.habbo.room.object.visualization.furniture.FurniturePlanetSystemVisualizationPlanetObject

package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.room.utils.Vector3d;

    public class FurniturePlanetSystemVisualizationPlanetObject 
    {

        private static const SYSTEM_TEMPO:Number = 30;

        private var _index:int;
        private var _name:String;
        private var _radius:Number;
        private var _SafeStr_6408:Number;
        private var _arcOffset:Number;
        private var _SafeStr_4234:Number;
        private var _position:Number;
        private var _SafeStr_6409:Vector3d = new Vector3d(0, 0, 0);
        private var _children:Array = [];

        public function FurniturePlanetSystemVisualizationPlanetObject(_arg_1:String, _arg_2:int, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number)
        {
            _name = _arg_1;
            _index = _arg_2;
            _radius = _arg_3;
            _SafeStr_6408 = (((_arg_4 * 3.14159265358979) * 2) / 360);
            _arcOffset = (((_arg_5 * 3.14159265358979) * 2) / 360);
            _SafeStr_4234 = _arg_6;
            _position = 0;
        }

        public function get name():String
        {
            return (_name);
        }

        public function dispose():void
        {
            var _local_1:* = null;
            while (_children.length > 0)
            {
                _local_1 = _children.shift();
                if (_local_1 != null)
                {
                    _local_1.dispose();
                };
            };
        }

        public function update(_arg_1:Array, _arg_2:Vector3d, _arg_3:Number):void
        {
            var _local_4:* = null;
            var _local_5:int;
            _position = (_position + (_SafeStr_6408 / 30));
            _arg_1[_index] = getPositionVector(_arg_2, _arg_3);
            _local_5 = 0;
            while (_local_5 < _children.length)
            {
                _local_4 = _children[_local_5];
                _local_4.update(_arg_1, _SafeStr_6409, _arg_3);
                _local_5++;
            };
        }

        public function getPositionVector(_arg_1:Vector3d, _arg_2:Number):Vector3d
        {
            var _local_3:Number = (_radius * Math.cos((_position + _arcOffset)));
            var _local_4:Number = (_radius * Math.sin((_position + _arcOffset)));
            var _local_5:Number = _SafeStr_4234;
            _SafeStr_6409.x = ((_local_3 - _local_4) * (_arg_2 / 2));
            _SafeStr_6409.y = ((((_local_4 + _local_3) * (_arg_2 / 2)) * 0.5) - (_SafeStr_4234 * (_arg_2 / 2)));
            _SafeStr_6409.z = -((4 * (_local_3 + _local_4)) - 0.7);
            if (_arg_1 != null)
            {
                _SafeStr_6409.add(_arg_1);
            };
            return (_SafeStr_6409);
        }

        public function addChild(_arg_1:FurniturePlanetSystemVisualizationPlanetObject):void
        {
            if (_children.indexOf(_arg_1) < 0)
            {
                _children.push(_arg_1);
            };
        }

        public function hasChild(_arg_1:String):Boolean
        {
            var _local_2:* = null;
            var _local_3:int;
            _local_3 = 0;
            while (_local_3 < _children.length)
            {
                _local_2 = _children[_local_3];
                if (_local_2.name == _arg_1)
                {
                    return (true);
                };
                if (_local_2.hasChild(_arg_1))
                {
                    return (true);
                };
                _local_3++;
            };
            return (false);
        }

        public function getChild(_arg_1:String):FurniturePlanetSystemVisualizationPlanetObject
        {
            var _local_2:* = null;
            var _local_3:int;
            _local_3 = 0;
            while (_local_3 < _children.length)
            {
                _local_2 = _children[_local_3];
                if (_local_2.name == _arg_1)
                {
                    return (_local_2);
                };
                if (_local_2.hasChild(_arg_1))
                {
                    return (_local_2.getChild(_arg_1));
                };
                _local_3++;
            };
            return (null);
        }


    }
}//package com.sulake.habbo.room.object.visualization.furniture

// _SafeStr_4234 = "_-z1j" (String#771, DoABC#4)
// _SafeStr_6408 = "_-Du" (String#22456, DoABC#4)
// _SafeStr_6409 = "_-ov" (String#8599, DoABC#4)


