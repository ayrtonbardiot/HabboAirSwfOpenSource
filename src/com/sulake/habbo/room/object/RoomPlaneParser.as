// by nota

//com.sulake.habbo.room.object.RoomPlaneParser

package com.sulake.habbo.room.object
{
    import com.sulake.core.utils._SafeStr_24;
    import flash.geom.Point;
    import __AS3__.vec.Vector;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.room.utils._SafeStr_1675;

    public class RoomPlaneParser 
    {

        private static const FLOOR_THICKNESS:Number = 0.25;
        private static const WALL_THICKNESS:Number = 0.25;
        private static const MAX_WALL_ADDITIONAL_HEIGHT:Number = 20;
        public static const _SafeStr_8876:int = -110;
        public static const _SafeStr_8877:int = -100;

        private var _SafeStr_8878:Array = [];
        private var _SafeStr_8879:Array = [];
        private var _width:int = 0;
        private var _SafeStr_4234:int = 0;
        private var _SafeStr_8880:int = 0;
        private var _SafeStr_8881:int = 0;
        private var _SafeStr_8882:int = 0;
        private var _SafeStr_8883:int = 0;
        private var _SafeStr_4565:Array = [];
        private var _SafeStr_8884:Number = 0;
        private var _SafeStr_4968:Number = 1;
        private var _SafeStr_4967:Number = 1;
        private var _SafeStr_8885:int = -1;
        private var _floorHeight:Number = 0;
        private var _SafeStr_8886:_SafeStr_24 = null;
        private var _SafeStr_8887:Array = [];

        public function RoomPlaneParser()
        {
            _SafeStr_8884 = 3.6;
            _SafeStr_4968 = 1;
            _SafeStr_4967 = 1;
            _SafeStr_8886 = new _SafeStr_24();
        }

        private static function getFloorHeight(_arg_1:Array):Number
        {
            var _local_6:int;
            var _local_4:int;
            var _local_5:int;
            var _local_2:Array;
            var _local_8:int = _arg_1.length;
            var _local_3:int;
            if (_local_8 == 0)
            {
                return (0);
            };
            var _local_7:* = 0;
            _local_5 = 0;
            while (_local_5 < _local_8)
            {
                _local_2 = (_arg_1[_local_5] as Array);
                _local_4 = 0;
                while (_local_4 < _local_2.length)
                {
                    _local_6 = _local_2[_local_4];
                    if (_local_6 > _local_7)
                    {
                        _local_7 = _local_6;
                    };
                    _local_4++;
                };
                _local_5++;
            };
            return (_local_7);
        }

        private static function findEntranceTile(_arg_1:Array):Point
        {
            if (_arg_1 == null)
            {
                return (null);
            };
            var _local_3:int;
            var _local_4:int;
            var _local_2:Array;
            var _local_6:int = _arg_1.length;
            if (_local_6 == 0)
            {
                return (null);
            };
            var _local_5:Array = [];
            _local_4 = 0;
            while (_local_4 < _local_6)
            {
                _local_2 = (_arg_1[_local_4] as Array);
                if (((_local_2 == null) || (_local_2.length == 0)))
                {
                    return (null);
                };
                _local_3 = 0;
                while (_local_3 < _local_2.length)
                {
                    if (_local_2[_local_3] >= 0)
                    {
                        _local_5.push(_local_3);
                        break;
                    };
                    _local_3++;
                };
                if (_local_5.length < (_local_4 + 1))
                {
                    _local_5.push((_local_2.length + 1));
                };
                _local_4++;
            };
            _local_4 = 1;
            while (_local_4 < (_local_5.length - 1))
            {
                if (((_local_5[_local_4] <= (_local_5[(_local_4 - 1)] - 1)) && (_local_5[_local_4] <= (_local_5[(_local_4 + 1)] - 1))))
                {
                    return (new Point(_local_5[_local_4], _local_4));
                };
                _local_4++;
            };
            return (null);
        }

        private static function expandFloorTiles(_arg_1:Vector.<Vector.<int>>):Vector.<Vector.<int>>
        {
            var _local_12:int;
            var _local_13:int;
            var _local_3:int;
            var _local_4:int;
            var _local_6:int;
            var _local_11:int;
            var _local_17:int;
            var _local_14:int;
            var _local_9:int;
            var _local_15:int;
            var _local_10:int;
            var _local_2:int;
            var _local_5:uint = _arg_1.length;
            var _local_16:uint = _arg_1[0].length;
            var _local_7:Vector.<Vector.<int>> = new Vector.<Vector.<int>>((_local_5 * 4));
            _local_13 = 0;
            while (_local_13 < (_local_5 * 4))
            {
                _local_7[_local_13] = new Vector.<int>((_local_16 * 4));
                _local_13++;
            };
            var _local_8:int;
            _local_13 = 0;
            while (_local_13 < _local_5)
            {
                _local_6 = 0;
                _local_12 = 0;
                while (_local_12 < _local_16)
                {
                    _local_11 = _arg_1[_local_13][_local_12];
                    if (((_local_11 < 0) || (_local_11 <= 0xFF)))
                    {
                        _local_4 = 0;
                        while (_local_4 < 4)
                        {
                            _local_3 = 0;
                            while (_local_3 < 4)
                            {
                                _local_7[(_local_8 + _local_4)][(_local_6 + _local_3)] = ((_local_11 < 0) ? _local_11 : (_local_11 * 4));
                                _local_3++;
                            };
                            _local_4++;
                        };
                    }
                    else
                    {
                        _local_17 = ((_local_11 & 0xFF) * 4);
                        _local_14 = (_local_17 + (((_local_11 >> 11) & 0x01) * 3));
                        _local_9 = (_local_17 + (((_local_11 >> 10) & 0x01) * 3));
                        _local_15 = (_local_17 + (((_local_11 >> 9) & 0x01) * 3));
                        _local_10 = (_local_17 + (((_local_11 >> 8) & 0x01) * 3));
                        _local_3 = 0;
                        while (_local_3 < 3)
                        {
                            _local_2 = (_local_3 + 1);
                            _local_7[_local_8][(_local_6 + _local_3)] = (((_local_14 * (3 - _local_3)) + (_local_9 * _local_3)) / 3);
                            _local_7[(_local_8 + 3)][(_local_6 + _local_2)] = (((_local_15 * (3 - _local_2)) + (_local_10 * _local_2)) / 3);
                            _local_7[(_local_8 + _local_2)][_local_6] = (((_local_14 * (3 - _local_2)) + (_local_15 * _local_2)) / 3);
                            _local_7[(_local_8 + _local_3)][(_local_6 + 3)] = (((_local_9 * (3 - _local_3)) + (_local_10 * _local_3)) / 3);
                            _local_3++;
                        };
                        _local_7[(_local_8 + 1)][(_local_6 + 1)] = ((_local_14 > _local_17) ? (_local_17 + 2) : (_local_17 + 1));
                        _local_7[(_local_8 + 1)][(_local_6 + 2)] = ((_local_9 > _local_17) ? (_local_17 + 2) : (_local_17 + 1));
                        _local_7[(_local_8 + 2)][(_local_6 + 1)] = ((_local_15 > _local_17) ? (_local_17 + 2) : (_local_17 + 1));
                        _local_7[(_local_8 + 2)][(_local_6 + 2)] = ((_local_10 > _local_17) ? (_local_17 + 2) : (_local_17 + 1));
                    };
                    _local_6 = (_local_6 + 4);
                    _local_12++;
                };
                _local_8 = (_local_8 + 4);
                _local_13++;
            };
            return (_local_7);
        }

        private static function addTileTypes(_arg_1:Vector.<Vector.<int>>):void
        {
            var _local_14:int;
            var _local_15:int;
            var _local_17:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            var _local_11:int;
            var _local_12:int;
            var _local_3:int;
            var _local_2:int;
            var _local_13:int;
            var _local_10:uint = (_arg_1.length - 1);
            var _local_16:uint = (_arg_1[0].length - 1);
            _local_15 = 1;
            while (_local_15 < _local_10)
            {
                _local_14 = 1;
                while (_local_14 < _local_16)
                {
                    _local_17 = _arg_1[_local_15][_local_14];
                    if (_local_17 >= 0)
                    {
                        _local_4 = (_arg_1[(_local_15 - 1)][(_local_14 - 1)] & 0xFF);
                        _local_5 = (_arg_1[(_local_15 - 1)][_local_14] & 0xFF);
                        _local_6 = (_arg_1[(_local_15 - 1)][(_local_14 + 1)] & 0xFF);
                        _local_7 = (_arg_1[_local_15][(_local_14 - 1)] & 0xFF);
                        _local_8 = (_arg_1[_local_15][(_local_14 + 1)] & 0xFF);
                        _local_9 = (_arg_1[(_local_15 + 1)][(_local_14 - 1)] & 0xFF);
                        _local_11 = (_arg_1[(_local_15 + 1)][_local_14] & 0xFF);
                        _local_12 = (_arg_1[(_local_15 + 1)][(_local_14 + 1)] & 0xFF);
                        _local_3 = (_local_17 + 1);
                        _local_2 = (_local_17 - 1);
                        _local_13 = (((((((_local_4 == _local_3) || (_local_5 == _local_3)) || (_local_7 == _local_3)) ? 8 : 0) | ((((_local_6 == _local_3) || (_local_5 == _local_3)) || (_local_8 == _local_3)) ? 4 : 0)) | ((((_local_9 == _local_3) || (_local_11 == _local_3)) || (_local_7 == _local_3)) ? 2 : 0)) | ((((_local_12 == _local_3) || (_local_11 == _local_3)) || (_local_8 == _local_3)) ? 1 : 0));
                        if (_local_13 == 15)
                        {
                            _local_13 = 0;
                        };
                        _arg_1[_local_15][_local_14] = (_local_17 | (_local_13 << 8));
                    };
                    _local_14++;
                };
                _local_15++;
            };
        }

        private static function unpadHeightMap(_arg_1:Vector.<Vector.<int>>):void
        {
            _arg_1.shift();
            _arg_1.pop();
            for each (var _local_2:Vector.<int> in _arg_1)
            {
                _local_2.shift();
                _local_2.pop();
            };
        }

        private static function padHeightMap(_arg_1:Vector.<Vector.<int>>):void
        {
            var _local_2:Vector.<int> = new Vector.<int>(0);
            var _local_3:Vector.<int> = new Vector.<int>(0);
            for each (var _local_5:Vector.<int> in _arg_1)
            {
                _local_5.push(-110);
                _local_5.unshift(-110);
            };
            for each (var _local_4:int in _arg_1[0])
            {
                _local_2.push(-110);
                _local_3.push(-110);
            };
            _arg_1.push(_local_3);
            _arg_1.unshift(_local_2);
        }


        public function get minX():int
        {
            return (_SafeStr_8880);
        }

        public function get maxX():int
        {
            return (_SafeStr_8881);
        }

        public function get minY():int
        {
            return (_SafeStr_8882);
        }

        public function get maxY():int
        {
            return (_SafeStr_8883);
        }

        public function get tileMapWidth():int
        {
            return (_width);
        }

        public function get tileMapHeight():int
        {
            return (_SafeStr_4234);
        }

        public function get planeCount():int
        {
            return (_SafeStr_4565.length);
        }

        public function get floorHeight():Number
        {
            if (_SafeStr_8885 != -1)
            {
                return (_SafeStr_8885);
            };
            return (_floorHeight);
        }

        public function get wallHeight():Number
        {
            if (_SafeStr_8885 != -1)
            {
                return (_SafeStr_8885 + 3.6);
            };
            return (_SafeStr_8884);
        }

        public function set wallHeight(_arg_1:Number):void
        {
            if (_arg_1 < 0)
            {
                _arg_1 = 0;
            };
            _SafeStr_8884 = _arg_1;
        }

        public function get wallThicknessMultiplier():Number
        {
            return (_SafeStr_4968);
        }

        public function set wallThicknessMultiplier(_arg_1:Number):void
        {
            if (_arg_1 < 0)
            {
                _arg_1 = 0;
            };
            _SafeStr_4968 = _arg_1;
        }

        public function get floorThicknessMultiplier():Number
        {
            return (_SafeStr_4967);
        }

        public function set floorThicknessMultiplier(_arg_1:Number):void
        {
            if (_arg_1 < 0)
            {
                _arg_1 = 0;
            };
            _SafeStr_4967 = _arg_1;
        }

        public function dispose():void
        {
            _SafeStr_4565 = null;
            _SafeStr_8878 = null;
            _SafeStr_8879 = null;
            _SafeStr_8887 = null;
            if (_SafeStr_8886 != null)
            {
                _SafeStr_8886.dispose();
                _SafeStr_8886 = null;
            };
        }

        public function reset():void
        {
            _SafeStr_4565 = [];
            _SafeStr_8878 = [];
            _SafeStr_8879 = [];
            _SafeStr_8878 = [];
            _SafeStr_8879 = [];
            _width = 0;
            _SafeStr_4234 = 0;
            _SafeStr_8880 = 0;
            _SafeStr_8881 = 0;
            _SafeStr_8882 = 0;
            _SafeStr_8883 = 0;
            _floorHeight = 0;
            _SafeStr_8887 = [];
        }

        public function initializeTileMap(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_4:int;
            var _local_7:* = null;
            var _local_3:* = null;
            var _local_5:* = null;
            var _local_6:int;
            if (_arg_1 < 0)
            {
                _arg_1 = 0;
            };
            if (_arg_2 < 0)
            {
                _arg_2 = 0;
            };
            _SafeStr_8878 = [];
            _SafeStr_8879 = [];
            _SafeStr_8887 = [];
            _local_4 = 0;
            while (_local_4 < _arg_2)
            {
                _local_7 = [];
                _local_3 = [];
                _local_5 = [];
                _local_6 = 0;
                while (_local_6 < _arg_1)
                {
                    _local_7[_local_6] = -110;
                    _local_3[_local_6] = -110;
                    _local_5[_local_6] = false;
                    _local_6++;
                };
                _SafeStr_8878.push(_local_7);
                _SafeStr_8879.push(_local_3);
                _SafeStr_8887.push(_local_5);
                _local_4++;
            };
            _width = _arg_1;
            _SafeStr_4234 = _arg_2;
            _SafeStr_8880 = _width;
            _SafeStr_8881 = -1;
            _SafeStr_8882 = _SafeStr_4234;
            _SafeStr_8883 = -1;
            return (true);
        }

        public function setTileHeight(_arg_1:int, _arg_2:int, _arg_3:Number):Boolean
        {
            var _local_8:* = null;
            var _local_5:Boolean;
            var _local_7:int;
            var _local_4:Boolean;
            var _local_6:int;
            if (((((_arg_1 >= 0) && (_arg_1 < _width)) && (_arg_2 >= 0)) && (_arg_2 < _SafeStr_4234)))
            {
                _local_8 = (_SafeStr_8878[_arg_2] as Array);
                _local_8[_arg_1] = _arg_3;
                if (_arg_3 >= 0)
                {
                    if (_arg_1 < _SafeStr_8880)
                    {
                        _SafeStr_8880 = _arg_1;
                    };
                    if (_arg_1 > _SafeStr_8881)
                    {
                        _SafeStr_8881 = _arg_1;
                    };
                    if (_arg_2 < _SafeStr_8882)
                    {
                        _SafeStr_8882 = _arg_2;
                    };
                    if (_arg_2 > _SafeStr_8883)
                    {
                        _SafeStr_8883 = _arg_2;
                    };
                }
                else
                {
                    if (((_arg_1 == _SafeStr_8880) || (_arg_1 == _SafeStr_8881)))
                    {
                        _local_5 = false;
                        _local_7 = _SafeStr_8882;
                        while (_local_7 < _SafeStr_8883)
                        {
                            if (getTileHeightInternal(_arg_1, _local_7) >= 0)
                            {
                                _local_5 = true;
                                break;
                            };
                            _local_7++;
                        };
                        if (!_local_5)
                        {
                            if (_arg_1 == _SafeStr_8880)
                            {
                                _SafeStr_8880++;
                            };
                            if (_arg_1 == _SafeStr_8881)
                            {
                                _SafeStr_8881--;
                            };
                        };
                    };
                    if (((_arg_2 == _SafeStr_8882) || (_arg_2 == _SafeStr_8883)))
                    {
                        _local_4 = false;
                        _local_6 = _SafeStr_8880;
                        while (_local_6 < _SafeStr_8881)
                        {
                            if (getTileHeight(_local_6, _arg_2) >= 0)
                            {
                                _local_4 = true;
                                break;
                            };
                            _local_6++;
                        };
                        if (!_local_4)
                        {
                            if (_arg_2 == _SafeStr_8882)
                            {
                                _SafeStr_8882++;
                            };
                            if (_arg_2 == _SafeStr_8883)
                            {
                                _SafeStr_8883--;
                            };
                        };
                    };
                };
                return (true);
            };
            return (false);
        }

        public function getTileHeight(_arg_1:int, _arg_2:int):Number
        {
            if (((((_arg_1 < 0) || (_arg_1 >= _width)) || (_arg_2 < 0)) || (_arg_2 >= _SafeStr_4234)))
            {
                return (-110);
            };
            var _local_3:Array = (_SafeStr_8878[_arg_2] as Array);
            return (Math.abs((_local_3[_arg_1] as Number)));
        }

        private function getTileHeightOriginal(_arg_1:int, _arg_2:int):Number
        {
            if (((((_arg_1 < 0) || (_arg_1 >= _width)) || (_arg_2 < 0)) || (_arg_2 >= _SafeStr_4234)))
            {
                return (-110);
            };
            if (_SafeStr_8887[_arg_2][_arg_1])
            {
                return (-100);
            };
            var _local_3:Array = (_SafeStr_8879[_arg_2] as Array);
            return (_local_3[_arg_1] as Number);
        }

        private function getTileHeightInternal(_arg_1:int, _arg_2:int):Number
        {
            if (((((_arg_1 < 0) || (_arg_1 >= _width)) || (_arg_2 < 0)) || (_arg_2 >= _SafeStr_4234)))
            {
                return (-110);
            };
            var _local_3:Array = (_SafeStr_8878[_arg_2] as Array);
            return (_local_3[_arg_1] as Number);
        }

        public function initializeFromTileData(_arg_1:int=-1):Boolean
        {
            var _local_2:int;
            var _local_3:int;
            _SafeStr_8885 = _arg_1;
            _local_3 = 0;
            while (_local_3 < _SafeStr_4234)
            {
                _local_2 = 0;
                while (_local_2 < _width)
                {
                    _SafeStr_8879[_local_3][_local_2] = _SafeStr_8878[_local_3][_local_2];
                    _local_2++;
                };
                _local_3++;
            };
            var _local_4:Point = findEntranceTile(_SafeStr_8878);
            _local_3 = 0;
            while (_local_3 < _SafeStr_4234)
            {
                _local_2 = 0;
                while (_local_2 < _width)
                {
                    if (_SafeStr_8887[_local_3][_local_2])
                    {
                        setTileHeight(_local_2, _local_3, -100);
                    };
                    _local_2++;
                };
                _local_3++;
            };
            return (initialize(_local_4));
        }

        private function initialize(_arg_1:Point):Boolean
        {
            var _local_5:int;
            if (_arg_1 != null)
            {
                _local_5 = getTileHeight(_arg_1.x, _arg_1.y);
                setTileHeight(_arg_1.x, _arg_1.y, -110);
            };
            _floorHeight = getFloorHeight(_SafeStr_8878);
            createWallPlanes();
            var _local_3:Vector.<Vector.<int>> = new Vector.<Vector.<int>>(0);
            for each (var _local_4:Array in _SafeStr_8878)
            {
                _local_3.push(Vector.<int>(_local_4));
            };
            padHeightMap(_local_3);
            addTileTypes(_local_3);
            unpadHeightMap(_local_3);
            var _local_2:Vector.<Vector.<int>> = expandFloorTiles(_local_3);
            extractPlanes(_local_2);
            if (_arg_1 != null)
            {
                setTileHeight(_arg_1.x, _arg_1.y, _local_5);
                addFloor(new Vector3d((_arg_1.x + 0.5), (_arg_1.y + 0.5), _local_5), new Vector3d(-1, 0, 0), new Vector3d(0, -1, 0), false, false, false, false);
            };
            return (true);
        }

        private function generateWallData(_arg_1:Point, _arg_2:Boolean):RoomWallData
        {
            var _local_3:Boolean;
            var _local_9:Boolean;
            var _local_12:int;
            var _local_11:* = null;
            var _local_8:int;
            var _local_4:RoomWallData = new RoomWallData();
            var _local_5:Array = [extractTopWall, extractRightWall, extractBottomWall, extractLeftWall];
            var _local_6:int;
            var _local_10:Point = new Point(_arg_1.x, _arg_1.y);
            var _local_7:int;
            while (_local_7++ < 1000)
            {
                _local_3 = false;
                _local_9 = false;
                _local_12 = _local_6;
                if (((((_local_10.x < minX) || (_local_10.x > maxX)) || (_local_10.y < minY)) || (_local_10.y > maxY)))
                {
                    _local_3 = true;
                };
                _local_11 = _local_5[_local_6](_local_10, _arg_2);
                if (_local_11 == null)
                {
                    return (null);
                };
                _local_8 = (Math.abs((_local_11.x - _local_10.x)) + Math.abs((_local_11.y - _local_10.y)));
                if (((_local_10.x == _local_11.x) || (_local_10.y == _local_11.y)))
                {
                    _local_6 = (((_local_6 - 1) + _local_5.length) % _local_5.length);
                    _local_8 = (_local_8 + 1);
                    _local_9 = true;
                }
                else
                {
                    _local_6 = ((_local_6 + 1) % _local_5.length);
                    _local_8 = (_local_8 - 1);
                };
                _local_4.addWall(_local_10, _local_12, _local_8, _local_3, _local_9);
                if ((((_local_11.x == _arg_1.x) && (_local_11.y == _arg_1.y)) && ((!(_local_11.x == _local_10.x)) || (!(_local_11.y == _local_10.y))))) break;
                _local_10 = _local_11;
            };
            if (_local_4.count == 0)
            {
                return (null);
            };
            return (_local_4);
        }

        private function hidePeninsulaWallChains(_arg_1:RoomWallData):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_8:int;
            var _local_6:Boolean;
            var _local_7:int;
            var _local_5:int;
            var _local_4:int = _arg_1.count;
            while (_local_5 < _local_4)
            {
                _local_2 = _local_5;
                _local_3 = _local_5;
                _local_8 = 0;
                _local_6 = false;
                while (((!(_arg_1.getBorder(_local_5))) && (_local_5 < _local_4)))
                {
                    if (_arg_1.getLeftTurn(_local_5))
                    {
                        _local_8++;
                    }
                    else
                    {
                        if (_local_8 > 0)
                        {
                            _local_8--;
                        };
                    };
                    if (_local_8 > 1)
                    {
                        _local_6 = true;
                    };
                    _local_3 = _local_5;
                    _local_5++;
                };
                if (_local_6)
                {
                    _local_7 = _local_2;
                    while (_local_7 <= _local_3)
                    {
                        _arg_1.setHideWall(_local_7, true);
                        _local_7++;
                    };
                };
                _local_5++;
            };
        }

        private function updateWallsNextToHoles(_arg_1:RoomWallData):void
        {
            var _local_8:int;
            var _local_4:* = null;
            var _local_10:int;
            var _local_7:int;
            var _local_5:* = null;
            var _local_3:* = null;
            var _local_2:int;
            var _local_9:int;
            var _local_6:int = _arg_1.count;
            _local_8 = 0;
            while (_local_8 < _local_6)
            {
                if (!_arg_1.getHideWall(_local_8))
                {
                    _local_4 = _arg_1.getCorner(_local_8);
                    _local_10 = _arg_1.getDirection(_local_8);
                    _local_7 = _arg_1.getLength(_local_8);
                    _local_5 = RoomWallData.WALL_DIRECTION_VECTORS[_local_10];
                    _local_3 = RoomWallData.WALL_NORMAL_VECTORS[_local_10];
                    _local_2 = 0;
                    _local_9 = 0;
                    while (_local_9 < _local_7)
                    {
                        if (getTileHeightInternal(((_local_4.x + (_local_9 * _local_5.x)) - _local_3.x), ((_local_4.y + (_local_9 * _local_5.y)) - _local_3.y)) == -100)
                        {
                            if (((_local_9 > 0) && (_local_2 == 0)))
                            {
                                _arg_1.setLength(_local_8, _local_9);
                                break;
                            };
                            _local_2++;
                        }
                        else
                        {
                            if (_local_2 > 0)
                            {
                                _arg_1.moveCorner(_local_8, _local_2);
                                break;
                            };
                        };
                        _local_9++;
                    };
                    if (_local_2 == _local_7)
                    {
                        _arg_1.setHideWall(_local_8, true);
                    };
                };
                _local_8++;
            };
        }

        private function resolveOriginalWallIndex(_arg_1:Point, _arg_2:Point, _arg_3:RoomWallData):int
        {
            var _local_7:int;
            var _local_14:* = null;
            var _local_10:* = null;
            var _local_11:int;
            var _local_8:int;
            var _local_15:int;
            var _local_9:int;
            var _local_12:int = Math.min(_arg_1.y, _arg_2.y);
            var _local_4:int = Math.max(_arg_1.y, _arg_2.y);
            var _local_13:int = Math.min(_arg_1.x, _arg_2.x);
            var _local_5:int = Math.max(_arg_1.x, _arg_2.x);
            var _local_6:int = _arg_3.count;
            _local_7 = 0;
            while (_local_7 < _local_6)
            {
                _local_14 = _arg_3.getCorner(_local_7);
                _local_10 = _arg_3.getEndPoint(_local_7);
                if (_arg_1.x == _arg_2.x)
                {
                    if (((_local_14.x == _arg_1.x) && (_local_10.x == _arg_1.x)))
                    {
                        _local_11 = Math.min(_local_14.y, _local_10.y);
                        _local_8 = Math.max(_local_14.y, _local_10.y);
                        if (((_local_11 <= _local_12) && (_local_4 <= _local_8)))
                        {
                            return (_local_7);
                        };
                    };
                }
                else
                {
                    if (_arg_1.y == _arg_2.y)
                    {
                        if (((_local_14.y == _arg_1.y) && (_local_10.y == _arg_1.y)))
                        {
                            _local_15 = Math.min(_local_14.x, _local_10.x);
                            _local_9 = Math.max(_local_14.x, _local_10.x);
                            if (((_local_15 <= _local_13) && (_local_5 <= _local_9)))
                            {
                                return (_local_7);
                            };
                        };
                    };
                };
                _local_7++;
            };
            return (-1);
        }

        private function hideOriginallyHiddenWalls(_arg_1:RoomWallData, _arg_2:RoomWallData):void
        {
            var _local_8:int;
            var _local_6:* = null;
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_7:int;
            var _local_9:int;
            var _local_5:int = _arg_1.count;
            _local_8 = 0;
            while (_local_8 < _local_5)
            {
                if (!_arg_1.getHideWall(_local_8))
                {
                    _local_6 = _arg_1.getCorner(_local_8);
                    _local_3 = new Point(_local_6.x, _local_6.y);
                    _local_4 = RoomWallData.WALL_DIRECTION_VECTORS[_arg_1.getDirection(_local_8)];
                    _local_7 = _arg_1.getLength(_local_8);
                    _local_3.x = (_local_3.x + (_local_4.x * _local_7));
                    _local_3.y = (_local_3.y + (_local_4.y * _local_7));
                    _local_9 = resolveOriginalWallIndex(_local_6, _local_3, _arg_2);
                    if (_local_9 >= 0)
                    {
                        if (_arg_2.getHideWall(_local_9))
                        {
                            _arg_1.setHideWall(_local_8, true);
                        };
                    }
                    else
                    {
                        _arg_1.setHideWall(_local_8, true);
                    };
                };
                _local_8++;
            };
        }

        private function checkWallHiding(_arg_1:RoomWallData, _arg_2:RoomWallData):void
        {
            hidePeninsulaWallChains(_arg_2);
            updateWallsNextToHoles(_arg_1);
            hideOriginallyHiddenWalls(_arg_1, _arg_2);
        }

        private function addWalls(_arg_1:RoomWallData, _arg_2:RoomWallData):void
        {
            var _local_25:int;
            var _local_14:int;
            var _local_17:int;
            var _local_10:* = null;
            var _local_13:int;
            var _local_16:int;
            var _local_11:* = null;
            var _local_6:* = null;
            var _local_20:Number;
            var _local_18:int;
            var _local_27:Number;
            var _local_24:Number;
            var _local_3:* = null;
            var _local_4:Number;
            var _local_9:* = null;
            var _local_19:* = null;
            var _local_12:int;
            var _local_8:* = null;
            var _local_21:Boolean;
            var _local_7:Boolean;
            var _local_26:Boolean;
            var _local_5:Boolean;
            var _local_22:Boolean;
            var _local_15:int = _arg_1.count;
            var _local_23:int = _arg_2.count;
            _local_17 = 0;
            while (_local_17 < _local_15)
            {
                if (!_arg_1.getHideWall(_local_17))
                {
                    _local_10 = _arg_1.getCorner(_local_17);
                    _local_13 = _arg_1.getDirection(_local_17);
                    _local_16 = _arg_1.getLength(_local_17);
                    _local_11 = RoomWallData.WALL_DIRECTION_VECTORS[_local_13];
                    _local_6 = RoomWallData.WALL_NORMAL_VECTORS[_local_13];
                    _local_20 = -1;
                    _local_18 = 0;
                    while (_local_18 < _local_16)
                    {
                        _local_27 = getTileHeightInternal(((_local_10.x + (_local_18 * _local_11.x)) + _local_6.x), ((_local_10.y + (_local_18 * _local_11.y)) + _local_6.y));
                        if (((_local_27 >= 0) && ((_local_27 < _local_20) || (_local_20 < 0))))
                        {
                            _local_20 = _local_27;
                        };
                        _local_18++;
                    };
                    _local_24 = _local_20;
                    _local_3 = new Vector3d(_local_10.x, _local_10.y, _local_24);
                    _local_3 = Vector3d.sum(_local_3, Vector3d.product(_local_6, 0.5));
                    _local_3 = Vector3d.sum(_local_3, Vector3d.product(_local_11, -0.5));
                    _local_4 = ((wallHeight + Math.min(20, floorHeight)) - _local_20);
                    _local_9 = Vector3d.product(_local_11, -(_local_16));
                    _local_19 = new Vector3d(0, 0, _local_4);
                    _local_3 = Vector3d.dif(_local_3, _local_9);
                    _local_12 = resolveOriginalWallIndex(_local_10, _arg_1.getEndPoint(_local_17), _arg_2);
                    if (_local_12 >= 0)
                    {
                        _local_25 = _arg_2.getDirection(((_local_12 + 1) % _local_23));
                        _local_14 = _arg_2.getDirection((((_local_12 - 1) + _local_23) % _local_23));
                    }
                    else
                    {
                        _local_25 = _arg_1.getDirection(((_local_17 + 1) % _local_15));
                        _local_14 = _arg_1.getDirection((((_local_17 - 1) + _local_15) % _local_15));
                    };
                    _local_8 = null;
                    if ((((_local_25 - _local_13) + 4) % 4) == 3)
                    {
                        _local_8 = RoomWallData.WALL_NORMAL_VECTORS[_local_25];
                    }
                    else
                    {
                        if ((((_local_13 - _local_14) + 4) % 4) == 3)
                        {
                            _local_8 = RoomWallData.WALL_NORMAL_VECTORS[_local_14];
                        };
                    };
                    _local_21 = _arg_1.getLeftTurn(_local_17);
                    _local_7 = _arg_1.getLeftTurn((((_local_17 - 1) + _local_15) % _local_15));
                    _local_26 = _arg_1.getHideWall(((_local_17 + 1) % _local_15));
                    _local_5 = _arg_1.getManuallyLeftCut(_local_17);
                    _local_22 = _arg_1.getManuallyRightCut(_local_17);
                    addWall(_local_3, _local_9, _local_19, _local_8, ((!(_local_7)) || (_local_5)), ((!(_local_21)) || (_local_22)), (!(_local_26)));
                };
                _local_17++;
            };
        }

        private function createWallPlanes():Boolean
        {
            var _local_3:int;
            var _local_11:int;
            var _local_6:Array = _SafeStr_8878;
            if (_local_6 == null)
            {
                return (false);
            };
            var _local_4:int;
            var _local_5:int;
            var _local_1:Array;
            var _local_14:int = _local_6.length;
            var _local_8:int;
            if (_local_14 == 0)
            {
                return (false);
            };
            _local_4 = 0;
            while (_local_4 < _local_14)
            {
                _local_1 = (_local_6[_local_4] as Array);
                if (((_local_1 == null) || (_local_1.length == 0)))
                {
                    return (false);
                };
                if (_local_8 > 0)
                {
                    _local_8 = Math.min(_local_8, _local_1.length);
                }
                else
                {
                    _local_8 = _local_1.length;
                };
                _local_4++;
            };
            var _local_13:Number = Math.min(20, ((_SafeStr_8885 != -1) ? _SafeStr_8885 : getFloorHeight(_local_6)));
            var _local_9:int = minX;
            var _local_10:int = minY;
            _local_10 = minY;
            while (_local_10 <= maxY)
            {
                if (getTileHeightInternal(_local_9, _local_10) > -100)
                {
                    _local_10--;
                    break;
                };
                _local_10++;
            };
            if (_local_10 > maxY)
            {
                return (false);
            };
            var _local_2:Point = new Point(_local_9, _local_10);
            var _local_7:RoomWallData = generateWallData(_local_2, true);
            var _local_12:RoomWallData = generateWallData(_local_2, false);
            if (_local_7 != null)
            {
                _local_3 = _local_7.count;
                _local_11 = _local_12.count;
                checkWallHiding(_local_7, _local_12);
                addWalls(_local_7, _local_12);
            };
            _local_5 = 0;
            while (_local_5 < tileMapHeight)
            {
                _local_4 = 0;
                while (_local_4 < tileMapWidth)
                {
                    if (getTileHeightInternal(_local_4, _local_5) < 0)
                    {
                        setTileHeight(_local_4, _local_5, -(_local_13 + wallHeight));
                    };
                    _local_4++;
                };
                _local_5++;
            };
            return (true);
        }

        private function extractTopWall(_arg_1:Point, _arg_2:Boolean):Point
        {
            if (_arg_1 == null)
            {
                return (null);
            };
            var _local_3:int = 1;
            var _local_4:int = -100;
            if (!_arg_2)
            {
                _local_4 = -110;
            };
            while (_local_3 < 1000)
            {
                if (getTileHeightInternal((_arg_1.x + _local_3), _arg_1.y) > _local_4)
                {
                    return (new Point(((_arg_1.x + _local_3) - 1), _arg_1.y));
                };
                if (getTileHeightInternal((_arg_1.x + _local_3), (_arg_1.y + 1)) <= _local_4)
                {
                    return (new Point((_arg_1.x + _local_3), (_arg_1.y + 1)));
                };
                _local_3++;
            };
            return (null);
        }

        private function extractRightWall(_arg_1:Point, _arg_2:Boolean):Point
        {
            if (_arg_1 == null)
            {
                return (null);
            };
            var _local_3:int = 1;
            var _local_4:int = -100;
            if (!_arg_2)
            {
                _local_4 = -110;
            };
            while (_local_3 < 1000)
            {
                if (getTileHeightInternal(_arg_1.x, (_arg_1.y + _local_3)) > _local_4)
                {
                    return (new Point(_arg_1.x, (_arg_1.y + (_local_3 - 1))));
                };
                if (getTileHeightInternal((_arg_1.x - 1), (_arg_1.y + _local_3)) <= _local_4)
                {
                    return (new Point((_arg_1.x - 1), (_arg_1.y + _local_3)));
                };
                _local_3++;
            };
            return (null);
        }

        private function extractBottomWall(_arg_1:Point, _arg_2:Boolean):Point
        {
            if (_arg_1 == null)
            {
                return (null);
            };
            var _local_3:int = 1;
            var _local_4:int = -100;
            if (!_arg_2)
            {
                _local_4 = -110;
            };
            while (_local_3 < 1000)
            {
                if (getTileHeightInternal((_arg_1.x - _local_3), _arg_1.y) > _local_4)
                {
                    return (new Point((_arg_1.x - (_local_3 - 1)), _arg_1.y));
                };
                if (getTileHeightInternal((_arg_1.x - _local_3), (_arg_1.y - 1)) <= _local_4)
                {
                    return (new Point((_arg_1.x - _local_3), (_arg_1.y - 1)));
                };
                _local_3++;
            };
            return (null);
        }

        private function extractLeftWall(_arg_1:Point, _arg_2:Boolean):Point
        {
            if (_arg_1 == null)
            {
                return (null);
            };
            var _local_3:int = 1;
            var _local_4:int = -100;
            if (!_arg_2)
            {
                _local_4 = -110;
            };
            while (_local_3 < 1000)
            {
                if (getTileHeightInternal(_arg_1.x, (_arg_1.y - _local_3)) > _local_4)
                {
                    return (new Point(_arg_1.x, (_arg_1.y - (_local_3 - 1))));
                };
                if (getTileHeightInternal((_arg_1.x + 1), (_arg_1.y - _local_3)) <= _local_4)
                {
                    return (new Point((_arg_1.x + 1), (_arg_1.y - _local_3)));
                };
                _local_3++;
            };
            return (null);
        }

        private function addWall(_arg_1:IVector3d, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean):void
        {
            var _local_12:* = null;
            addPlane(2, _arg_1, _arg_2, _arg_3, [_arg_4]);
            addPlane(3, _arg_1, _arg_2, _arg_3, [_arg_4]);
            var _local_10:Number = (0.25 * _SafeStr_4968);
            var _local_8:Number = (0.25 * _SafeStr_4967);
            var _local_11:Vector3d = Vector3d.crossProduct(_arg_2, _arg_3);
            var _local_9:Vector3d = Vector3d.product(_local_11, ((1 / _local_11.length) * -(_local_10)));
            addPlane(2, Vector3d.sum(_arg_1, _arg_3), _arg_2, _local_9, [_local_11, _arg_4]);
            if (_arg_5)
            {
                addPlane(2, Vector3d.sum(Vector3d.sum(_arg_1, _arg_2), _arg_3), Vector3d.product(_arg_3, (-(_arg_3.length + _local_8) / _arg_3.length)), _local_9, [_local_11, _arg_4]);
            };
            if (_arg_6)
            {
                addPlane(2, Vector3d.sum(_arg_1, Vector3d.product(_arg_3, (-(_local_8) / _arg_3.length))), Vector3d.product(_arg_3, ((_arg_3.length + _local_8) / _arg_3.length)), _local_9, [_local_11, _arg_4]);
                if (_arg_7)
                {
                    _local_12 = Vector3d.product(_arg_2, (_local_10 / _arg_2.length));
                    addPlane(2, Vector3d.sum(Vector3d.sum(_arg_1, _arg_3), Vector3d.product(_local_12, -1)), _local_12, _local_9, [_local_11, _arg_2, _arg_4]);
                };
            };
        }

        private function addFloor(_arg_1:IVector3d, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean):void
        {
            var _local_10:Number;
            var _local_9:* = null;
            var _local_8:* = null;
            var _local_11:RoomPlaneData = addPlane(1, _arg_1, _arg_2, _arg_3);
            if (_local_11 != null)
            {
                _local_10 = (0.25 * _SafeStr_4967);
                _local_9 = new Vector3d(0, 0, _local_10);
                _local_8 = Vector3d.dif(_arg_1, _local_9);
                if (_arg_6)
                {
                    addPlane(1, _local_8, _arg_2, _local_9);
                };
                if (_arg_7)
                {
                    addPlane(1, Vector3d.sum(_local_8, Vector3d.sum(_arg_2, _arg_3)), Vector3d.product(_arg_2, -1), _local_9);
                };
                if (_arg_4)
                {
                    addPlane(1, Vector3d.sum(_local_8, _arg_3), Vector3d.product(_arg_3, -1), _local_9);
                };
                if (_arg_5)
                {
                    addPlane(1, Vector3d.sum(_local_8, _arg_2), _arg_3, _local_9);
                };
            };
        }

        public function initializeFromXML(_arg_1:XML):Boolean
        {
            var _local_4:int;
            var _local_13:* = null;
            var _local_12:* = null;
            var _local_3:int;
            var _local_10:* = null;
            var _local_16:Number;
            var _local_6:* = null;
            var _local_8:* = null;
            var _local_5:int;
            var _local_7:* = null;
            if (_arg_1 == null)
            {
                return (false);
            };
            reset();
            resetFloorHoles();
            if (!_SafeStr_1675.checkRequiredAttributes(_arg_1.tileMap[0], ["width", "height", "wallHeight"]))
            {
                return (false);
            };
            var _local_9:int = parseInt(_arg_1.tileMap.@width);
            var _local_15:int = parseInt(_arg_1.tileMap.@height);
            var _local_14:Number = parseFloat(_arg_1.tileMap.@wallHeight);
            var _local_2:int = parseInt(_arg_1.tileMap.@fixedWallsHeight);
            initializeTileMap(_local_9, _local_15);
            var _local_11:XMLList = _arg_1.tileMap.tileRow;
            _local_4 = 0;
            while (_local_4 < _local_11.length())
            {
                _local_13 = _local_11[_local_4];
                _local_12 = _local_13.tile;
                _local_3 = 0;
                while (_local_3 < _local_12.length())
                {
                    _local_10 = _local_12[_local_3];
                    _local_16 = parseFloat(_local_10.@height);
                    setTileHeight(_local_3, _local_4, _local_16);
                    _local_3++;
                };
                _local_4++;
            };
            if (_arg_1.holeMap.length() > 0)
            {
                _local_6 = _arg_1.holeMap[0];
                _local_8 = _local_6.hole;
                _local_5 = 0;
                while (_local_5 < _local_8.length())
                {
                    _local_7 = _local_8[_local_5];
                    if (_SafeStr_1675.checkRequiredAttributes(_local_7, ["id", "x", "y", "width", "height"]))
                    {
                        addFloorHole(_local_7.@id, _local_7.@x, _local_7.@y, _local_7.@width, _local_7.@height);
                    };
                    _local_5++;
                };
                initializeHoleMap();
            };
            this.wallHeight = _local_14;
            initializeFromTileData(_local_2);
            return (true);
        }

        private function addPlane(_arg_1:int, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:Array=null):RoomPlaneData
        {
            if (((_arg_3.length == 0) || (_arg_4.length == 0)))
            {
                return (null);
            };
            var _local_6:RoomPlaneData = new RoomPlaneData(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
            _SafeStr_4565.push(_local_6);
            return (_local_6);
        }

        public function getXML():XML
        {
            var _local_5:int;
            var _local_1:* = null;
            var _local_12:* = null;
            var _local_3:int;
            var _local_14:Number;
            var _local_4:* = null;
            var _local_7:int;
            var _local_8:* = null;
            var _local_13:int;
            var _local_2:* = null;
            var _local_9:XML = new (XML)((((((((("<tileMap width=" + (('"' + _width) + '"')) + " height=") + (('"' + _SafeStr_4234) + '"')) + " wallHeight=") + (('"' + _SafeStr_8884) + '"')) + " fixedWallsHeight=") + (('"' + _SafeStr_8885) + '"')) + "/>\r\n\t\t\t"));
            _local_5 = 0;
            while (_local_5 < _SafeStr_4234)
            {
                _local_1 = <tileRow/>
				
                ;
                _local_12 = _SafeStr_8879[_local_5];
                _local_3 = 0;
                while (_local_3 < _width)
                {
                    _local_14 = _local_12[_local_3];
                    _local_4 = new (XML)((("<tile height=" + (('"' + _local_14) + '"')) + "/>\r\n\t\t\t\t\t"));
                    _local_1.appendChild(_local_4);
                    _local_3++;
                };
                _local_9.appendChild(_local_1);
                _local_5++;
            };
            var _local_11:XML = <holeMap/>
			
            ;
            _local_7 = 0;
            while (_local_7 < _SafeStr_8886.length)
            {
                _local_8 = _SafeStr_8886.getWithIndex(_local_7);
                if (_local_8 != null)
                {
                    _local_13 = _SafeStr_8886.getKey(_local_7);
                    _local_2 = new (XML)((((((((((("<hole id=" + (('"' + _local_13) + '"')) + " x=") + (('"' + _local_8.x) + '"')) + " y=") + (('"' + _local_8.y) + '"')) + " width=") + (('"' + _local_8.width) + '"')) + " height=") + (('"' + _local_8.height) + '"')) + "/>\r\n\t\t\t\t\t"));
                    _local_11.appendChild(_local_2);
                };
                _local_7++;
            };
            var _local_10:XML = <roomData/>
			
            ;
            _local_10.appendChild(_local_9);
            _local_10.appendChild(_local_11);
            var _local_6:XML = new (XML)((((((((("<dimensions minX=" + (('"' + minX) + '"')) + " maxX=") + (('"' + maxX) + '"')) + " minY=") + (('"' + minY) + '"')) + " maxY=") + (('"' + maxY) + '"')) + " />\r\n\t\t\t"));
            _local_10.appendChild(_local_6);
            return (_local_10);
        }

        public function getPlaneLocation(_arg_1:int):IVector3d
        {
            if (((_arg_1 < 0) || (_arg_1 >= planeCount)))
            {
                return (null);
            };
            var _local_2:RoomPlaneData = (_SafeStr_4565[_arg_1] as RoomPlaneData);
            if (_local_2 != null)
            {
                return (_local_2.loc);
            };
            return (null);
        }

        public function getPlaneNormal(_arg_1:int):IVector3d
        {
            if (((_arg_1 < 0) || (_arg_1 >= planeCount)))
            {
                return (null);
            };
            var _local_2:RoomPlaneData = (_SafeStr_4565[_arg_1] as RoomPlaneData);
            if (_local_2 != null)
            {
                return (_local_2.normal);
            };
            return (null);
        }

        public function getPlaneLeftSide(_arg_1:int):IVector3d
        {
            if (((_arg_1 < 0) || (_arg_1 >= planeCount)))
            {
                return (null);
            };
            var _local_2:RoomPlaneData = (_SafeStr_4565[_arg_1] as RoomPlaneData);
            if (_local_2 != null)
            {
                return (_local_2.leftSide);
            };
            return (null);
        }

        public function getPlaneRightSide(_arg_1:int):IVector3d
        {
            if (((_arg_1 < 0) || (_arg_1 >= planeCount)))
            {
                return (null);
            };
            var _local_2:RoomPlaneData = (_SafeStr_4565[_arg_1] as RoomPlaneData);
            if (_local_2 != null)
            {
                return (_local_2.rightSide);
            };
            return (null);
        }

        public function getPlaneNormalDirection(_arg_1:int):IVector3d
        {
            if (((_arg_1 < 0) || (_arg_1 >= planeCount)))
            {
                return (null);
            };
            var _local_2:RoomPlaneData = (_SafeStr_4565[_arg_1] as RoomPlaneData);
            if (_local_2 != null)
            {
                return (_local_2.normalDirection);
            };
            return (null);
        }

        public function getPlaneSecondaryNormals(_arg_1:int):Array
        {
            var _local_3:* = null;
            var _local_4:int;
            if (((_arg_1 < 0) || (_arg_1 >= planeCount)))
            {
                return (null);
            };
            var _local_2:RoomPlaneData = (_SafeStr_4565[_arg_1] as RoomPlaneData);
            if (_local_2 != null)
            {
                _local_3 = [];
                _local_4 = 0;
                while (_local_4 < _local_2.secondaryNormalCount)
                {
                    _local_3.push(_local_2.getSecondaryNormal(_local_4));
                    _local_4++;
                };
                return (_local_3);
            };
            return (null);
        }

        public function getPlaneType(_arg_1:int):int
        {
            if (((_arg_1 < 0) || (_arg_1 >= planeCount)))
            {
                return (0);
            };
            var _local_2:RoomPlaneData = (_SafeStr_4565[_arg_1] as RoomPlaneData);
            if (_local_2 != null)
            {
                return (_local_2.type);
            };
            return (0);
        }

        public function getPlaneMaskCount(_arg_1:int):int
        {
            if (((_arg_1 < 0) || (_arg_1 >= planeCount)))
            {
                return (0);
            };
            var _local_2:RoomPlaneData = (_SafeStr_4565[_arg_1] as RoomPlaneData);
            if (_local_2 != null)
            {
                return (_local_2.maskCount);
            };
            return (0);
        }

        public function getPlaneMaskLeftSideLoc(_arg_1:int, _arg_2:int):Number
        {
            if (((_arg_1 < 0) || (_arg_1 >= planeCount)))
            {
                return (-1);
            };
            var _local_3:RoomPlaneData = (_SafeStr_4565[_arg_1] as RoomPlaneData);
            if (_local_3 != null)
            {
                return (_local_3.getMaskLeftSideLoc(_arg_2));
            };
            return (-1);
        }

        public function getPlaneMaskRightSideLoc(_arg_1:int, _arg_2:int):Number
        {
            if (((_arg_1 < 0) || (_arg_1 >= planeCount)))
            {
                return (-1);
            };
            var _local_3:RoomPlaneData = (_SafeStr_4565[_arg_1] as RoomPlaneData);
            if (_local_3 != null)
            {
                return (_local_3.getMaskRightSideLoc(_arg_2));
            };
            return (-1);
        }

        public function getPlaneMaskLeftSideLength(_arg_1:int, _arg_2:int):Number
        {
            if (((_arg_1 < 0) || (_arg_1 >= planeCount)))
            {
                return (-1);
            };
            var _local_3:RoomPlaneData = (_SafeStr_4565[_arg_1] as RoomPlaneData);
            if (_local_3 != null)
            {
                return (_local_3.getMaskLeftSideLength(_arg_2));
            };
            return (-1);
        }

        public function getPlaneMaskRightSideLength(_arg_1:int, _arg_2:int):Number
        {
            if (((_arg_1 < 0) || (_arg_1 >= planeCount)))
            {
                return (-1);
            };
            var _local_3:RoomPlaneData = (_SafeStr_4565[_arg_1] as RoomPlaneData);
            if (_local_3 != null)
            {
                return (_local_3.getMaskRightSideLength(_arg_2));
            };
            return (-1);
        }

        public function addFloorHole(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):void
        {
            removeFloorHole(_arg_1);
            var _local_6:RoomFloorHole = new RoomFloorHole(_arg_2, _arg_3, _arg_4, _arg_5);
            _SafeStr_8886.add(_arg_1, _local_6);
        }

        public function removeFloorHole(_arg_1:int):void
        {
            _SafeStr_8886.remove(_arg_1);
        }

        public function resetFloorHoles():void
        {
            _SafeStr_8886.reset();
        }

        private function initializeHoleMap():void
        {
            var _local_5:int;
            var _local_6:int;
            var _local_8:* = null;
            var _local_7:int;
            var _local_1:* = null;
            var _local_3:int;
            var _local_9:int;
            var _local_2:int;
            var _local_4:int;
            _local_6 = 0;
            while (_local_6 < _SafeStr_4234)
            {
                _local_8 = _SafeStr_8887[_local_6];
                _local_5 = 0;
                while (_local_5 < _width)
                {
                    _local_8[_local_5] = false;
                    _local_5++;
                };
                _local_6++;
            };
            _local_7 = 0;
            while (_local_7 < _SafeStr_8886.length)
            {
                _local_1 = _SafeStr_8886.getWithIndex(_local_7);
                if (_local_1 != null)
                {
                    _local_3 = _local_1.x;
                    _local_9 = ((_local_1.x + _local_1.width) - 1);
                    _local_2 = _local_1.y;
                    _local_4 = ((_local_1.y + _local_1.height) - 1);
                    _local_3 = ((_local_3 < 0) ? 0 : _local_3);
                    _local_9 = ((_local_9 >= _width) ? (_width - 1) : _local_9);
                    _local_2 = ((_local_2 < 0) ? 0 : _local_2);
                    _local_4 = ((_local_4 >= _SafeStr_4234) ? (_SafeStr_4234 - 1) : _local_4);
                    _local_6 = _local_2;
                    while (_local_6 <= _local_4)
                    {
                        _local_8 = _SafeStr_8887[_local_6];
                        _local_5 = _local_3;
                        while (_local_5 <= _local_9)
                        {
                            _local_8[_local_5] = true;
                            _local_5++;
                        };
                        _local_6++;
                    };
                };
                _local_7++;
            };
        }

        private function extractPlanes(_arg_1:Vector.<Vector.<int>>):void
        {
            var _local_3:int;
            var _local_17:int;
            var _local_18:int;
            var _local_6:int;
            var _local_12:int;
            var _local_8:int;
            var _local_9:Boolean;
            var _local_4:Boolean;
            var _local_14:Boolean;
            var _local_20:Boolean;
            var _local_15:int;
            var _local_16:int;
            var _local_13:Boolean;
            var _local_7:Number;
            var _local_10:Number;
            var _local_11:Number;
            var _local_21:Number;
            var _local_5:uint = _arg_1.length;
            var _local_19:uint = _arg_1[0].length;
            var _local_2:Vector.<Vector.<Boolean>> = new Vector.<Vector.<Boolean>>(_local_5);
            _local_3 = 0;
            while (_local_3 < _local_5)
            {
                _local_2[_local_3] = new Vector.<Boolean>(_local_19);
                _local_3++;
            };
            _local_17 = 0;
            while (_local_17 < _local_5)
            {
                _local_18 = 0;
                while (_local_18 < _local_19)
                {
                    _local_6 = _arg_1[_local_17][_local_18];
                    if (!((_local_6 < 0) || (_local_2[_local_17][_local_18])))
                    {
                        _local_9 = ((_local_18 == 0) || (!(_arg_1[_local_17][(_local_18 - 1)] == _local_6)));
                        _local_4 = ((_local_17 == 0) || (!(_arg_1[(_local_17 - 1)][_local_18] == _local_6)));
                        _local_12 = (_local_18 + 1);
                        while (_local_12 < _local_19)
                        {
                            if ((((!(_arg_1[_local_17][_local_12] == _local_6)) || (_local_2[_local_17][_local_12])) || ((_local_17 > 0) && ((_arg_1[(_local_17 - 1)][_local_12] == _local_6) == _local_4)))) break;
                            _local_12++;
                        };
                        _local_14 = ((_local_12 == _local_19) || (!(_arg_1[_local_17][_local_12] == _local_6)));
                        _local_13 = false;
                        _local_8 = (_local_17 + 1);
                        while (((_local_8 < _local_5) && (!(_local_13))))
                        {
                            _local_20 = (!(_arg_1[_local_8][_local_18] == _local_6));
                            _local_13 = (((_local_20) || ((_local_18 > 0) && ((_arg_1[_local_8][(_local_18 - 1)] == _local_6) == _local_9))) || ((_local_12 < _local_19) && ((_arg_1[_local_8][_local_12] == _local_6) == _local_14)));
                            _local_15 = _local_18;
                            while (_local_15 < _local_12)
                            {
                                if ((_arg_1[_local_8][_local_15] == _local_6) == _local_20)
                                {
                                    _local_13 = true;
                                    _local_12 = _local_15;
                                    break;
                                };
                                _local_15++;
                            };
                            if (_local_13) break;
                            _local_8++;
                        };
                        if (!_local_20)
                        {
                            _local_20 = (_local_8 == _local_5);
                        };
                        _local_14 = ((_local_12 == _local_19) || (!(_arg_1[_local_17][_local_12] == _local_6)));
                        _local_16 = _local_17;
                        while (_local_16 < _local_8)
                        {
                            _local_15 = _local_18;
                            while (_local_15 < _local_12)
                            {
                                _local_2[_local_16][_local_15] = true;
                                _local_15++;
                            };
                            _local_16++;
                        };
                        _local_7 = ((_local_18 / 4) - 0.5);
                        _local_10 = ((_local_17 / 4) - 0.5);
                        _local_11 = ((_local_12 - _local_18) / 4);
                        _local_21 = ((_local_8 - _local_17) / 4);
                        addFloor(new Vector3d((_local_7 + _local_11), (_local_10 + _local_21), (_local_6 / 4)), new Vector3d(-(_local_11), 0, 0), new Vector3d(0, -(_local_21), 0), _local_14, _local_9, _local_20, _local_4);
                    };
                    _local_18++;
                };
                _local_17++;
            };
        }


    }
}//package com.sulake.habbo.room.object

// _SafeStr_1675 = "_-j1M" (String#9598, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_4234 = "_-z1j" (String#10673, DoABC#3)
// _SafeStr_4565 = "_-qP" (String#10080, DoABC#3)
// _SafeStr_4967 = "_-jc" (String#9646, DoABC#3)
// _SafeStr_4968 = "_-12O" (String#6570, DoABC#3)
// _SafeStr_8876 = "_-71Y" (String#7021, DoABC#3)
// _SafeStr_8877 = "_-qq" (String#10093, DoABC#3)
// _SafeStr_8878 = "_-HW" (String#7702, DoABC#3)
// _SafeStr_8879 = "_-U16" (String#8543, DoABC#3)
// _SafeStr_8880 = "_-M1v" (String#8018, DoABC#3)
// _SafeStr_8881 = "_-U1U" (String#8554, DoABC#3)
// _SafeStr_8882 = "_-C1a" (String#7366, DoABC#3)
// _SafeStr_8883 = "_-aa" (String#9020, DoABC#3)
// _SafeStr_8884 = "_-th" (String#10295, DoABC#3)
// _SafeStr_8885 = "_-KQ" (String#7914, DoABC#3)
// _SafeStr_8886 = "_-IK" (String#7745, DoABC#3)
// _SafeStr_8887 = "_-hC" (String#9489, DoABC#3)


