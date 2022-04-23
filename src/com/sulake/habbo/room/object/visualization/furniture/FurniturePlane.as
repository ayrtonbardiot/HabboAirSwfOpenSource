// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.furniture.FurniturePlane

package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.room.utils.Vector3d;
    import flash.display.BitmapData;
    import com.sulake.core.utils._SafeStr_24;
    import flash.geom.Point;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.room.utils.IRoomGeometry;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;

    public class FurniturePlane 
    {

        private var _SafeStr_4072:int = -1;
        private var _SafeStr_4971:Number = 0;
        private var _SafeStr_4972:Number = 0;
        private var _SafeStr_4973:Number = 0;
        private var _SafeStr_4974:Number = 0;
        private var _origin:Vector3d = null;
        private var _SafeStr_3985:Vector3d = null;
        private var _SafeStr_5766:Vector3d = null;
        private var _SafeStr_5767:Vector3d = null;
        private var _SafeStr_6469:Vector3d = null;
        private var _SafeStr_6470:Vector3d = null;
        private var _normal:Vector3d = null;
        private var _SafeStr_5770:Boolean = true;
        private var _bitmapData:BitmapData = null;
        private var _SafeStr_5773:_SafeStr_24 = null;
        private var _offset:Point = null;
        private var _relativeDepth:Number = 0;
        private var _color:uint = 0;
        private var _SafeStr_6471:Boolean = false;
        private var _SafeStr_3820:String = null;
        private var _SafeStr_5785:Vector3d = null;
        private var _SafeStr_5786:Vector3d = null;
        private var _SafeStr_5787:Vector3d = null;
        private var _SafeStr_5788:Vector3d = null;
        private var _width:Number = 0;
        private var _SafeStr_4234:Number = 0;

        public function FurniturePlane(_arg_1:IVector3d, _arg_2:IVector3d, _arg_3:IVector3d)
        {
            _origin = new Vector3d();
            _SafeStr_3985 = new Vector3d();
            _SafeStr_3985.assign(_arg_1);
            _SafeStr_5766 = new Vector3d();
            _SafeStr_5766.assign(_arg_2);
            _SafeStr_5767 = new Vector3d();
            _SafeStr_5767.assign(_arg_3);
            _SafeStr_6469 = new Vector3d();
            _SafeStr_6469.assign(_arg_2);
            _SafeStr_6470 = new Vector3d();
            _SafeStr_6470.assign(_arg_3);
            _normal = Vector3d.crossProduct(_SafeStr_5766, _SafeStr_5767);
            if (_normal.length > 0)
            {
                _normal.mul((1 / _normal.length));
            };
            _offset = new Point();
            _SafeStr_5785 = new Vector3d();
            _SafeStr_5786 = new Vector3d();
            _SafeStr_5787 = new Vector3d();
            _SafeStr_5788 = new Vector3d();
            _SafeStr_5773 = new _SafeStr_24();
        }

        public function get bitmapData():BitmapData
        {
            if (_SafeStr_5770)
            {
                if (_bitmapData != null)
                {
                    return (_bitmapData.clone());
                };
            };
            return (null);
        }

        public function get visible():Boolean
        {
            return (_SafeStr_5770);
        }

        public function get offset():Point
        {
            return (_offset);
        }

        public function get relativeDepth():Number
        {
            return (_relativeDepth);
        }

        public function get color():uint
        {
            return (_color);
        }

        public function set color(_arg_1:uint):void
        {
            _color = _arg_1;
        }

        public function get leftSide():IVector3d
        {
            return (_SafeStr_5766);
        }

        public function get rightSide():IVector3d
        {
            return (_SafeStr_5767);
        }

        public function get location():IVector3d
        {
            return (_SafeStr_3985);
        }

        public function get normal():IVector3d
        {
            return (_normal);
        }

        public function dispose():void
        {
            var _local_2:int;
            var _local_1:* = null;
            if (_bitmapData != null)
            {
                _bitmapData.dispose();
                _bitmapData = null;
            };
            if (_SafeStr_5773 != null)
            {
                _local_2 = 0;
                while (_local_2 < _SafeStr_5773.length)
                {
                    _local_1 = (_SafeStr_5773.getWithIndex(_local_2) as BitmapData);
                    if (_local_1 != null)
                    {
                        _local_1.dispose();
                    };
                    _local_2++;
                };
                _SafeStr_5773.dispose();
                _SafeStr_5773 = null;
            };
            _origin = null;
            _SafeStr_3985 = null;
            _SafeStr_5766 = null;
            _SafeStr_5767 = null;
            _SafeStr_6469 = null;
            _SafeStr_6470 = null;
            _normal = null;
            _SafeStr_5785 = null;
            _SafeStr_5786 = null;
            _SafeStr_5787 = null;
            _SafeStr_5788 = null;
        }

        public function setRotation(_arg_1:Boolean):void
        {
            if (_arg_1 != _SafeStr_6471)
            {
                if (!_arg_1)
                {
                    _SafeStr_5766.assign(_SafeStr_6469);
                    _SafeStr_5767.assign(_SafeStr_6470);
                }
                else
                {
                    _SafeStr_5766.assign(_SafeStr_6469);
                    _SafeStr_5766.mul((_SafeStr_6470.length / _SafeStr_6469.length));
                    _SafeStr_5767.assign(_SafeStr_6470);
                    _SafeStr_5767.mul((_SafeStr_6469.length / _SafeStr_6470.length));
                };
                _SafeStr_4072 = -1;
                _SafeStr_4971 = (_SafeStr_4971 - 1);
                _SafeStr_6471 = _arg_1;
                resetTextureCache();
            };
        }

        private function cacheTexture(_arg_1:String, _arg_2:BitmapData):Boolean
        {
            var _local_3:BitmapData = (_SafeStr_5773.remove(_arg_1) as BitmapData);
            if (((!(_local_3 == null)) && (!(_arg_2 == _local_3))))
            {
                _local_3.dispose();
            };
            _SafeStr_5773.add(_arg_1, _arg_2);
            return (true);
        }

        private function resetTextureCache():void
        {
            var _local_2:int;
            var _local_1:* = null;
            if (_SafeStr_5773 != null)
            {
                _local_2 = 0;
                while (_local_2 < _SafeStr_5773.length)
                {
                    _local_1 = (_SafeStr_5773.getWithIndex(_local_2) as BitmapData);
                    if (_local_1 != null)
                    {
                        _local_1.dispose();
                    };
                    _local_2++;
                };
                _SafeStr_5773.reset();
            };
        }

        private function getTextureIdentifier(_arg_1:IRoomGeometry):String
        {
            if (_arg_1 == null)
            {
                return (null);
            };
            return (String(_arg_1.scale));
        }

        private function needsNewTexture(_arg_1:IRoomGeometry):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            var _local_2:String = getTextureIdentifier(_arg_1);
            var _local_3:BitmapData = (_SafeStr_5773.getValue(_local_2) as BitmapData);
            if (((_width > 0) && (_SafeStr_4234 > 0)))
            {
                if (_local_3 == null)
                {
                    return (true);
                };
            };
            return (false);
        }

        private function getTexture(_arg_1:IRoomGeometry, _arg_2:int):BitmapData
        {
            var _local_6:Number;
            var _local_7:Number;
            var _local_4:* = null;
            if (_arg_1 == null)
            {
                return (null);
            };
            var _local_3:String = getTextureIdentifier(_arg_1);
            var _local_5:BitmapData;
            if (needsNewTexture(_arg_1))
            {
                _local_6 = (_SafeStr_5766.length * _arg_1.scale);
                _local_7 = (_SafeStr_5767.length * _arg_1.scale);
                if (_local_6 < 1)
                {
                    _local_6 = 1;
                };
                if (_local_7 < 1)
                {
                    _local_7 = 1;
                };
                _local_4 = _arg_1.getCoordinatePosition(_normal);
                _local_5 = (_SafeStr_5773.getValue(_local_3) as BitmapData);
                if (_local_5 == null)
                {
                    _local_5 = new BitmapData(_local_6, _local_7, true, (0xFF000000 | _color));
                    if (_local_5 != null)
                    {
                        cacheTexture(_local_3, _local_5);
                    };
                };
            }
            else
            {
                _local_5 = (_SafeStr_5773.getValue(_local_3) as BitmapData);
            };
            if (_local_5 != null)
            {
                return (_local_5);
            };
            return (null);
        }

        public function update(_arg_1:IRoomGeometry, _arg_2:int):Boolean
        {
            var _local_6:* = null;
            var _local_3:Number;
            var _local_4:* = null;
            var _local_5:Number;
            var _local_7:Number;
            var _local_8:* = null;
            if ((((((_arg_1 == null) || ((_SafeStr_3985 == null) && (!(_origin == null)))) || (_SafeStr_5766 == null)) || (_SafeStr_5767 == null)) || (_normal == null)))
            {
                return (false);
            };
            var _local_9:Boolean;
            if (_arg_1.updateId != _SafeStr_4072)
            {
                _SafeStr_4072 = _arg_1.updateId;
                _local_6 = _arg_1.direction;
                if (((!(_local_6 == null)) && ((((!(_local_6.x == _SafeStr_4971)) || (!(_local_6.y == _SafeStr_4972))) || (!(_local_6.z == _SafeStr_4973))) || (!(_arg_1.scale == _SafeStr_4974)))))
                {
                    _SafeStr_4971 = _local_6.x;
                    _SafeStr_4972 = _local_6.y;
                    _SafeStr_4973 = _local_6.z;
                    _SafeStr_4974 = _arg_1.scale;
                    _local_9 = true;
                    _local_3 = 0;
                    _local_3 = Vector3d.cosAngle(_arg_1.directionAxis, normal);
                    if (_local_3 > -0.001)
                    {
                        if (_SafeStr_5770)
                        {
                            _SafeStr_5770 = false;
                            return (true);
                        };
                        return (false);
                    };
                    updateCorners(_arg_1);
                    _local_4 = _arg_1.getScreenPosition(_origin);
                    _local_5 = _local_4.z;
                    _local_7 = Math.max((_SafeStr_5785.z - _local_5), (_SafeStr_5786.z - _local_5), (_SafeStr_5787.z - _local_5), (_SafeStr_5788.z - _local_5));
                    _relativeDepth = _local_7;
                    _SafeStr_5770 = true;
                };
            };
            if (((needsNewTexture(_arg_1)) || (_local_9)))
            {
                if ((((_bitmapData == null) || (!(_width == _bitmapData.width))) || (!(_SafeStr_4234 == _bitmapData.height))))
                {
                    if (_bitmapData != null)
                    {
                        _bitmapData.dispose();
                        _bitmapData = null;
                        if (((_width < 1) || (_SafeStr_4234 < 1)))
                        {
                            return (true);
                        };
                    }
                    else
                    {
                        if (((_width < 1) || (_SafeStr_4234 < 1)))
                        {
                            return (false);
                        };
                    };
                    _bitmapData = new BitmapData(_width, _SafeStr_4234, true, 0xFFFFFF);
                    _bitmapData.lock();
                }
                else
                {
                    _bitmapData.lock();
                    _bitmapData.fillRect(_bitmapData.rect, 0xFFFFFF);
                };
                _local_8 = getTexture(_arg_1, _arg_2);
                if (_local_8 != null)
                {
                    renderTexture(_arg_1, _local_8);
                };
                _bitmapData.unlock();
                return (true);
            };
            return (false);
        }

        private function updateCorners(_arg_1:IRoomGeometry):void
        {
            _SafeStr_5785.assign(_arg_1.getScreenPosition(_SafeStr_3985));
            _SafeStr_5786.assign(_arg_1.getScreenPosition(Vector3d.sum(_SafeStr_3985, _SafeStr_5767)));
            _SafeStr_5787.assign(_arg_1.getScreenPosition(Vector3d.sum(Vector3d.sum(_SafeStr_3985, _SafeStr_5766), _SafeStr_5767)));
            _SafeStr_5788.assign(_arg_1.getScreenPosition(Vector3d.sum(_SafeStr_3985, _SafeStr_5766)));
            _offset = _arg_1.getScreenPoint(_origin);
            _SafeStr_5785.x = Math.round(_SafeStr_5785.x);
            _SafeStr_5785.y = Math.round(_SafeStr_5785.y);
            _SafeStr_5786.x = Math.round(_SafeStr_5786.x);
            _SafeStr_5786.y = Math.round(_SafeStr_5786.y);
            _SafeStr_5787.x = Math.round(_SafeStr_5787.x);
            _SafeStr_5787.y = Math.round(_SafeStr_5787.y);
            _SafeStr_5788.x = Math.round(_SafeStr_5788.x);
            _SafeStr_5788.y = Math.round(_SafeStr_5788.y);
            _offset.x = Math.round(_offset.x);
            _offset.y = Math.round(_offset.y);
            var _local_3:Number = Math.min(_SafeStr_5785.x, _SafeStr_5786.x, _SafeStr_5787.x, _SafeStr_5788.x);
            var _local_5:Number = Math.max(_SafeStr_5785.x, _SafeStr_5786.x, _SafeStr_5787.x, _SafeStr_5788.x);
            var _local_2:Number = Math.min(_SafeStr_5785.y, _SafeStr_5786.y, _SafeStr_5787.y, _SafeStr_5788.y);
            var _local_4:Number = Math.max(_SafeStr_5785.y, _SafeStr_5786.y, _SafeStr_5787.y, _SafeStr_5788.y);
            _local_5 = (_local_5 - _local_3);
            _offset.x = (_offset.x - _local_3);
            _SafeStr_5785.x = (_SafeStr_5785.x - _local_3);
            _SafeStr_5786.x = (_SafeStr_5786.x - _local_3);
            _SafeStr_5787.x = (_SafeStr_5787.x - _local_3);
            _SafeStr_5788.x = (_SafeStr_5788.x - _local_3);
            _local_4 = (_local_4 - _local_2);
            _offset.y = (_offset.y - _local_2);
            _SafeStr_5785.y = (_SafeStr_5785.y - _local_2);
            _SafeStr_5786.y = (_SafeStr_5786.y - _local_2);
            _SafeStr_5787.y = (_SafeStr_5787.y - _local_2);
            _SafeStr_5788.y = (_SafeStr_5788.y - _local_2);
            _width = _local_5;
            _SafeStr_4234 = _local_4;
        }

        private function renderTexture(_arg_1:IRoomGeometry, _arg_2:BitmapData):void
        {
            if (((((((_SafeStr_5785 == null) || (_SafeStr_5786 == null)) || (_SafeStr_5787 == null)) || (_SafeStr_5788 == null)) || (_arg_2 == null)) || (_bitmapData == null)))
            {
                return;
            };
            var _local_8:Number = (_SafeStr_5788.x - _SafeStr_5787.x);
            var _local_10:Number = (_SafeStr_5788.y - _SafeStr_5787.y);
            var _local_4:Number = (_SafeStr_5786.x - _SafeStr_5787.x);
            var _local_3:Number = (_SafeStr_5786.y - _SafeStr_5787.y);
            if (Math.abs((_local_4 - _arg_2.width)) <= 1)
            {
                _local_4 = _arg_2.width;
            };
            if (Math.abs((_local_3 - _arg_2.width)) <= 1)
            {
                _local_3 = _arg_2.width;
            };
            if (Math.abs((_local_8 - _arg_2.height)) <= 1)
            {
                _local_8 = _arg_2.height;
            };
            if (Math.abs((_local_10 - _arg_2.height)) <= 1)
            {
                _local_10 = _arg_2.height;
            };
            var _local_5:Number = (_local_4 / _arg_2.width);
            var _local_6:Number = (_local_3 / _arg_2.width);
            var _local_7:Number = (_local_8 / _arg_2.height);
            var _local_9:Number = (_local_10 / _arg_2.height);
            var _local_11:Matrix = new Matrix();
            _local_11.a = _local_5;
            _local_11.b = _local_6;
            _local_11.c = _local_7;
            _local_11.d = _local_9;
            _local_11.translate(_SafeStr_5787.x, _SafeStr_5787.y);
            draw(_arg_2, _local_11);
        }

        private function draw(_arg_1:BitmapData, _arg_2:Matrix):void
        {
            var _local_4:int;
            var _local_7:int;
            var _local_3:Number;
            var _local_6:int;
            var _local_5:int;
            if (_bitmapData != null)
            {
                if ((((((_arg_2.a == 1) && (_arg_2.d == 1)) && (_arg_2.c == 0)) && (!(_arg_2.b == 0))) && (Math.abs(_arg_2.b) <= 1)))
                {
                    _local_4 = 0;
                    _local_7 = 0;
                    _local_3 = 0;
                    _local_6 = 0;
                    if (_arg_2.b > 0)
                    {
                        _arg_2.ty++;
                    };
                    _local_5 = 0;
                    while (_local_4 < _arg_1.width)
                    {
                        _local_4++;
                        _local_3 = (_local_3 + Math.abs(_arg_2.b));
                        if (_local_3 >= 1)
                        {
                            _bitmapData.copyPixels(_arg_1, new Rectangle((_local_7 + _local_6), 0, (_local_4 - _local_7), _arg_1.height), new Point((_arg_2.tx + _local_7), (_arg_2.ty + _local_5)), null, null, true);
                            _local_7 = _local_4;
                            if (_arg_2.b > 0)
                            {
                                _local_5++;
                            }
                            else
                            {
                                _local_5--;
                            };
                            _local_3 = 0;
                        };
                    };
                    if (_local_3 > 0)
                    {
                        _bitmapData.copyPixels(_arg_1, new Rectangle(_local_7, 0, (_local_4 - _local_7), _arg_1.height), new Point((_arg_2.tx + _local_7), (_arg_2.ty + _local_5)), null, null, true);
                    };
                    return;
                };
                _bitmapData.draw(_arg_1, _arg_2, null, null, null, false);
            };
        }


    }
}//package com.sulake.habbo.room.object.visualization.furniture

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_3985 = "_-Bg" (String#992, DoABC#4)
// _SafeStr_4072 = "_-Ds" (String#2730, DoABC#4)
// _SafeStr_4234 = "_-z1j" (String#771, DoABC#4)
// _SafeStr_4971 = "_-J1U" (String#6994, DoABC#4)
// _SafeStr_4972 = "_-fh" (String#9089, DoABC#4)
// _SafeStr_4973 = "_-BW" (String#9266, DoABC#4)
// _SafeStr_4974 = "_-h16" (String#7687, DoABC#4)
// _SafeStr_5766 = "_-Xn" (String#2613, DoABC#4)
// _SafeStr_5767 = "_-E1u" (String#2688, DoABC#4)
// _SafeStr_5770 = "_-D1D" (String#3284, DoABC#4)
// _SafeStr_5773 = "_-OV" (String#1882, DoABC#4)
// _SafeStr_5785 = "_-Ty" (String#2201, DoABC#4)
// _SafeStr_5786 = "_-pF" (String#2062, DoABC#4)
// _SafeStr_5787 = "_-49" (String#1764, DoABC#4)
// _SafeStr_5788 = "_-s1x" (String#2046, DoABC#4)
// _SafeStr_6469 = "_-DV" (String#7168, DoABC#4)
// _SafeStr_6470 = "_-c1S" (String#7799, DoABC#4)
// _SafeStr_6471 = "_-12u" (String#18373, DoABC#4)


