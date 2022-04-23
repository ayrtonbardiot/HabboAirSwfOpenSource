// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneMaterialCellMatrix

package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
    import flash.display.BitmapData;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.object.visualization.room.utils.Randomizer;
    import com.sulake.room.utils.IVector3d;
    import flash.geom.Rectangle;
    import flash.geom.Point;

    public class PlaneMaterialCellMatrix 
    {

        public static const REPEAT_MODE_ALL:int = 1;
        public static const REPEAT_MODE_BORDERS:int = 2;
        public static const REPEAT_MODE_CENTER:int = 3;
        public static const REPEAT_MODE_FIRST:int = 4;
        public static const REPEAT_MODE_LAST:int = 5;
        public static const REPEAT_MODE_RANDOM:int = 6;
        public static const REPEAT_MODE_DEFAULT:int = 1;
        public static const _SafeStr_8762:Number = -1;
        public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;
        public static const ALIGN_TOP:int = 1;
        public static const ALIGN_BOTTOM:int = 2;
        public static const ALIGN_DEFAULT:int = 1;

        private var _SafeStr_6646:Array = [];
        private var _SafeStr_6647:int = 1;
        private var _SafeStr_6441:int = 1;
        private var _SafeStr_6597:BitmapData;
        private var _cachedBitmapNormal:Vector3d = null;
        private var _SafeStr_6652:int = 0;
        private var _SafeStr_6598:Boolean = false;
        private var _SafeStr_6571:Boolean = true;
        private var _SafeStr_6648:Number = -1;
        private var _SafeStr_6649:Number = 1;
        private var _SafeStr_6650:Number = -1;
        private var _SafeStr_6651:Number = 1;

        public function PlaneMaterialCellMatrix(_arg_1:int, _arg_2:int=1, _arg_3:int=1, _arg_4:Number=-1, _arg_5:Number=1, _arg_6:Number=-1, _arg_7:Number=1)
        {
            var _local_8:int;
            super();
            if (_arg_1 < 1)
            {
                _arg_1 = 1;
            };
            _local_8 = 0;
            while (_local_8 < _arg_1)
            {
                _SafeStr_6646.push(null);
                _local_8++;
            };
            _SafeStr_6647 = _arg_2;
            _SafeStr_6441 = _arg_3;
            _SafeStr_6648 = _arg_4;
            _SafeStr_6649 = _arg_5;
            _SafeStr_6650 = _arg_6;
            _SafeStr_6651 = _arg_7;
            if (_SafeStr_6647 == 6)
            {
                _SafeStr_6571 = false;
            };
        }

        private static function nextRandomColumnIndex(_arg_1:int):int
        {
            var _local_2:Array = Randomizer.getValues(1, 0, (_arg_1 * 17631));
            return (_local_2[0] % _arg_1);
        }


        public function get normalMinX():Number
        {
            return (_SafeStr_6648);
        }

        public function get normalMaxX():Number
        {
            return (_SafeStr_6649);
        }

        public function get normalMinY():Number
        {
            return (_SafeStr_6650);
        }

        public function get normalMaxY():Number
        {
            return (_SafeStr_6651);
        }

        public function isBottomAligned():Boolean
        {
            return (_SafeStr_6441 == 2);
        }

        public function get isStatic():Boolean
        {
            return (_SafeStr_6571);
        }

        public function dispose():void
        {
            if (_SafeStr_6597 != null)
            {
                _SafeStr_6597.dispose();
                _SafeStr_6597 = null;
            };
            if (_cachedBitmapNormal != null)
            {
                _cachedBitmapNormal = null;
            };
        }

        public function clearCache():void
        {
            var _local_2:int;
            var _local_1:* = null;
            if (!_SafeStr_6598)
            {
                return;
            };
            if (_SafeStr_6597 != null)
            {
                _SafeStr_6597.dispose();
                _SafeStr_6597 = null;
            };
            if (_cachedBitmapNormal != null)
            {
                _cachedBitmapNormal.x = 0;
                _cachedBitmapNormal.y = 0;
                _cachedBitmapNormal.z = 0;
            };
            _SafeStr_6652 = 0;
            _local_2 = 0;
            while (_local_2 < _SafeStr_6646.length)
            {
                _local_1 = (_SafeStr_6646[_local_2] as PlaneMaterialCellColumn);
                if (_local_1 != null)
                {
                    _local_1.clearCache();
                };
                _local_2++;
            };
            _SafeStr_6598 = false;
        }

        public function createColumn(_arg_1:int, _arg_2:int, _arg_3:Array, _arg_4:int=1):Boolean
        {
            if (((_arg_1 < 0) || (_arg_1 >= _SafeStr_6646.length)))
            {
                return (false);
            };
            var _local_6:PlaneMaterialCellColumn = new PlaneMaterialCellColumn(_arg_2, _arg_3, _arg_4);
            var _local_5:PlaneMaterialCellColumn = (_SafeStr_6646[_arg_1] as PlaneMaterialCellColumn);
            if (_local_5 != null)
            {
                _local_5.dispose();
            };
            _SafeStr_6646[_arg_1] = _local_6;
            if (((!(_local_6 == null)) && (!(_local_6.isStatic))))
            {
                _SafeStr_6571 = false;
            };
            return (true);
        }

        public function render(_arg_1:BitmapData, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:Boolean, _arg_6:int, _arg_7:int, _arg_8:Boolean):BitmapData
        {
            var _local_12:int;
            var _local_11:* = null;
            var _local_10:* = null;
            if (_arg_2 < 1)
            {
                _arg_2 = 1;
            };
            if (_arg_3 < 1)
            {
                _arg_3 = 1;
            };
            if ((((_arg_1 == null) || (!(_arg_1.width == _arg_2))) || (!(_arg_1.height == _arg_3))))
            {
                _arg_1 = null;
            };
            if (_cachedBitmapNormal == null)
            {
                _cachedBitmapNormal = new Vector3d();
            };
            if (isStatic)
            {
                if (_SafeStr_6597 != null)
                {
                    if ((((_SafeStr_6597.width == _arg_2) && (_SafeStr_6597.height == _arg_3)) && (Vector3d.isEqual(_cachedBitmapNormal, _arg_4))))
                    {
                        if (_arg_1 != null)
                        {
                            copyCachedBitmapOnCanvas(_arg_1, _SafeStr_6652, _arg_7, _arg_8);
                            return (_arg_1);
                        };
                        return (_SafeStr_6597);
                    };
                    _SafeStr_6597.dispose();
                    _SafeStr_6597 = null;
                };
            }
            else
            {
                if (_SafeStr_6597 != null)
                {
                    if (((_SafeStr_6597.width == _arg_2) && (_SafeStr_6597.height == _arg_3)))
                    {
                        _SafeStr_6597.fillRect(_SafeStr_6597.rect, 0xFFFFFF);
                    }
                    else
                    {
                        _SafeStr_6597.dispose();
                        _SafeStr_6597 = null;
                    };
                };
            };
            _SafeStr_6598 = true;
            _cachedBitmapNormal.assign(_arg_4);
            if (!_arg_5)
            {
                _SafeStr_6652 = _arg_3;
                if (_SafeStr_6597 == null)
                {
                    try
                    {
                        _SafeStr_6597 = new BitmapData(_arg_2, _arg_3, true, 0xFFFFFFFF);
                    }
                    catch(e:Error)
                    {
                        return (null);
                    };
                }
                else
                {
                    _SafeStr_6597.fillRect(_SafeStr_6597.rect, 0xFFFFFFFF);
                };
                if (_arg_1 != null)
                {
                    copyCachedBitmapOnCanvas(_arg_1, _arg_3, _arg_7, _arg_8);
                    return (_arg_1);
                };
                return (_SafeStr_6597);
            };
            if (_SafeStr_6597 == null)
            {
                _SafeStr_6652 = _arg_3;
                try
                {
                    _SafeStr_6597 = new BitmapData(_arg_2, _arg_3, true, 0xFFFFFF);
                }
                catch(e:Error)
                {
                    _SafeStr_6597 = null;
                    return (null);
                };
            };
            var _local_9:Array = [];
            _local_12 = 0;
            while (_local_12 < _SafeStr_6646.length)
            {
                _local_11 = (_SafeStr_6646[_local_12] as PlaneMaterialCellColumn);
                if (_local_11 != null)
                {
                    _local_10 = _local_11.render(_arg_3, _arg_4, _arg_6, _arg_7);
                    if (_local_10 != null)
                    {
                        _local_9.push(_local_10);
                    };
                };
                _local_12++;
            };
            if (_local_9.length == 0)
            {
                if (_arg_1 != null)
                {
                    return (_arg_1);
                };
                return (_SafeStr_6597);
            };
            var _local_13:int;
            switch (_SafeStr_6647)
            {
                case 2:
                    _local_13 = renderRepeatBorders(_SafeStr_6597, _local_9);
                    break;
                case 3:
                    _local_13 = renderRepeatCenter(_SafeStr_6597, _local_9);
                    break;
                case 4:
                    _local_13 = renderRepeatFirst(_SafeStr_6597, _local_9);
                    break;
                case 5:
                    _local_13 = renderRepeatLast(_SafeStr_6597, _local_9);
                    break;
                case 6:
                    _local_13 = renderRepeatRandom(_SafeStr_6597, _local_9);
                    break;
                default:
                    _local_13 = renderRepeatAll(_SafeStr_6597, _local_9);
            };
            _SafeStr_6652 = _local_13;
            if (_arg_1 != null)
            {
                copyCachedBitmapOnCanvas(_arg_1, _local_13, _arg_7, _arg_8);
                return (_arg_1);
            };
            return (_SafeStr_6597);
        }

        private function copyCachedBitmapOnCanvas(_arg_1:BitmapData, _arg_2:int, _arg_3:int, _arg_4:Boolean):void
        {
            if ((((_arg_1 == null) || (_SafeStr_6597 == null)) || (_arg_1 == _SafeStr_6597)))
            {
                return;
            };
            if (!_arg_4)
            {
                _arg_3 = ((_arg_1.height - _arg_2) - _arg_3);
            };
            var _local_5:Rectangle;
            if (_SafeStr_6441 == 1)
            {
                _local_5 = new Rectangle(0, 0, _SafeStr_6597.width, _SafeStr_6652);
            }
            else
            {
                _local_5 = new Rectangle(0, (_SafeStr_6597.height - _SafeStr_6652), _SafeStr_6597.width, _SafeStr_6652);
            };
            _arg_1.copyPixels(_SafeStr_6597, _local_5, new Point(0, _arg_3), null, null, true);
        }

        private function getColumnsWidth(_arg_1:Array):int
        {
            var _local_3:int;
            var _local_2:* = null;
            if (((_arg_1 == null) || (_arg_1.length == 0)))
            {
                return (0);
            };
            var _local_4:int;
            _local_3 = 0;
            while (_local_3 < _arg_1.length)
            {
                _local_2 = (_arg_1[_local_3] as BitmapData);
                if (_local_2 != null)
                {
                    _local_4 = (_local_4 + _local_2.width);
                };
                _local_3++;
            };
            return (_local_4);
        }

        private function renderColumns(_arg_1:BitmapData, _arg_2:Array, _arg_3:int, _arg_4:Boolean):Point
        {
            var _local_8:int;
            var _local_5:int;
            if ((((_arg_2 == null) || (_arg_2.length == 0)) || (_arg_1 == null)))
            {
                return (new Point(_arg_3, 0));
            };
            var _local_6:int;
            var _local_7:BitmapData;
            _local_8 = 0;
            while (_local_8 < _arg_2.length)
            {
                if (_arg_4)
                {
                    _local_7 = (_arg_2[_local_8] as BitmapData);
                }
                else
                {
                    _local_7 = (_arg_2[((_arg_2.length - 1) - _local_8)] as BitmapData);
                };
                if (_local_7 != null)
                {
                    if (!_arg_4)
                    {
                        _arg_3 = (_arg_3 - _local_7.width);
                    };
                    _local_5 = 0;
                    if (_SafeStr_6441 == 2)
                    {
                        _local_5 = (_arg_1.height - _local_7.height);
                    };
                    _arg_1.copyPixels(_local_7, _local_7.rect, new Point(_arg_3, _local_5), _local_7, null, true);
                    if (_local_7.height > _local_6)
                    {
                        _local_6 = _local_7.height;
                    };
                    if (_arg_4)
                    {
                        _arg_3 = (_arg_3 + _local_7.width);
                    };
                    if ((((_arg_4) && (_arg_3 >= _arg_1.width)) || ((!(_arg_4)) && (_arg_3 <= 0))))
                    {
                        return (new Point(_arg_3, _local_6));
                    };
                };
                _local_8++;
            };
            return (new Point(_arg_3, _local_6));
        }

        private function renderRepeatAll(_arg_1:BitmapData, _arg_2:Array):int
        {
            var _local_6:* = null;
            if ((((_arg_2 == null) || (_arg_2.length == 0)) || (_arg_1 == null)))
            {
                return (0);
            };
            var _local_4:int;
            var _local_5:int = getColumnsWidth(_arg_2);
            var _local_3:int;
            if (_local_5 > _arg_1.width)
            {
            };
            while (_local_3 < _arg_1.width)
            {
                _local_6 = renderColumns(_arg_1, _arg_2, _local_3, true);
                _local_3 = _local_6.x;
                if (_local_6.y > _local_4)
                {
                    _local_4 = _local_6.y;
                };
                if (_local_6.x == 0)
                {
                    return (_local_4);
                };
            };
            return (_local_4);
        }

        private function renderRepeatBorders(_arg_1:BitmapData, _arg_2:Array):int
        {
            if ((((_arg_2 == null) || (_arg_2.length == 0)) || (_arg_1 == null)))
            {
                return (0);
            };
            var _local_5:int;
            var _local_6:BitmapData;
            var _local_9:Array = [];
            var _local_3:int;
            var _local_7:int;
            _local_7 = 1;
            while (_local_7 < (_arg_2.length - 1))
            {
                _local_6 = (_arg_2[_local_7] as BitmapData);
                if (_local_6 != null)
                {
                    _local_3 = (_local_3 + _local_6.width);
                    _local_9.push(_local_6);
                };
                _local_7++;
            };
            if (_SafeStr_6646.length == 1)
            {
                _local_6 = (_SafeStr_6646[0] as BitmapData);
                if (_local_6 != null)
                {
                    _local_3 = _local_6.width;
                    _local_9.push(_local_6);
                };
            };
            var _local_4:* = ((_arg_1.width - _local_3) >> 1);
            var _local_10:Point;
            _local_10 = renderColumns(_arg_1, _local_9, _local_4, true);
            var _local_8:int = _local_10.x;
            if (_local_10.y > _local_5)
            {
                _local_5 = _local_10.y;
            };
            _local_6 = (_arg_2[0] as BitmapData);
            if (_local_6 != null)
            {
                _local_9 = [_local_6];
                while (_local_4 >= 0)
                {
                    _local_10 = renderColumns(_arg_1, _local_9, _local_4, false);
                    _local_4 = _local_10.x;
                    if (_local_10.y > _local_5)
                    {
                        _local_5 = _local_10.y;
                    };
                };
            };
            _local_6 = (_arg_2[(_arg_2.length - 1)] as BitmapData);
            if (_local_6 != null)
            {
                _local_9 = [_local_6];
                while (_local_8 < _arg_1.height)
                {
                    _local_10 = renderColumns(_arg_1, _local_9, _local_8, true);
                    _local_8 = _local_10.x;
                    if (_local_10.y > _local_5)
                    {
                        _local_5 = _local_10.y;
                    };
                };
            };
            return (_local_5);
        }

        private function renderRepeatCenter(_arg_1:BitmapData, _arg_2:Array):int
        {
            var _local_12:int;
            var _local_11:int;
            var _local_5:int;
            var _local_9:int;
            var _local_15:* = null;
            if ((((_arg_2 == null) || (_arg_2.length == 0)) || (_arg_1 == null)))
            {
                return (0);
            };
            var _local_13:int;
            var _local_8:BitmapData;
            var _local_4:Array = [];
            var _local_3:Array = [];
            var _local_18:int;
            var _local_7:int;
            var _local_10:int;
            _local_10 = 0;
            while (_local_10 < (_arg_2.length >> 1))
            {
                _local_8 = (_arg_2[_local_10] as BitmapData);
                if (_local_8 != null)
                {
                    _local_18 = (_local_18 + _local_8.width);
                    _local_4.push(_local_8);
                };
                _local_10++;
            };
            _local_10 = ((_arg_2.length >> 1) + 1);
            while (_local_10 < _arg_2.length)
            {
                _local_8 = (_arg_2[_local_10] as BitmapData);
                if (_local_8 != null)
                {
                    _local_7 = (_local_7 + _local_8.width);
                    _local_3.push(_local_8);
                };
                _local_10++;
            };
            var _local_16:Point;
            var _local_14:int;
            var _local_6:int;
            var _local_17:int = _arg_1.width;
            if ((_local_18 + _local_7) > _arg_1.width)
            {
                _local_14 = ((_local_18 + _local_7) - _arg_1.width);
                _local_6 = (_local_6 - (_local_14 >> 1));
                _local_17 = (_local_17 + (_local_14 - (_local_14 >> 1)));
            };
            if (_local_14 == 0)
            {
                _local_8 = (_arg_2[(_arg_2.length >> 1)] as BitmapData);
                if (_local_8 != null)
                {
                    _local_12 = _local_8.width;
                    _local_11 = (_arg_1.width - (_local_18 + _local_7));
                    _local_5 = int((Math.ceil((_local_11 / _local_12)) * _local_12));
                    _local_6 = (_local_18 - ((_local_5 - _local_11) >> 1));
                    _local_9 = (_local_6 + _local_5);
                    _local_15 = [_local_8];
                    while (_local_6 < _local_9)
                    {
                        _local_16 = renderColumns(_arg_1, _local_15, _local_6, true);
                        _local_6 = _local_16.x;
                        if (_local_16.y > _local_13)
                        {
                            _local_13 = _local_16.y;
                        };
                    };
                };
            };
            _local_6 = 0;
            _local_16 = renderColumns(_arg_1, _local_4, _local_6, true);
            if (_local_16.y > _local_13)
            {
                _local_13 = _local_16.y;
            };
            _local_16 = renderColumns(_arg_1, _local_3, _local_17, false);
            if (_local_16.y > _local_13)
            {
                _local_13 = _local_16.y;
            };
            return (_local_13);
        }

        private function renderRepeatFirst(_arg_1:BitmapData, _arg_2:Array):int
        {
            var _local_6:* = null;
            if ((((_arg_2 == null) || (_arg_2.length == 0)) || (_arg_1 == null)))
            {
                return (0);
            };
            var _local_4:int;
            var _local_5:BitmapData;
            var _local_3:int = _arg_1.width;
            var _local_7:Point = renderColumns(_arg_1, _arg_2, _local_3, false);
            _local_3 = _local_7.x;
            if (_local_7.y > _local_4)
            {
                _local_4 = _local_7.y;
            };
            _local_5 = (_arg_2[0] as BitmapData);
            if (_local_5 != null)
            {
                _local_6 = [_local_5];
                while (_local_3 >= 0)
                {
                    _local_7 = renderColumns(_arg_1, _local_6, _local_3, false);
                    _local_3 = _local_7.x;
                    if (_local_7.y > _local_4)
                    {
                        _local_4 = _local_7.y;
                    };
                };
            };
            return (_local_4);
        }

        private function renderRepeatLast(_arg_1:BitmapData, _arg_2:Array):int
        {
            var _local_6:* = null;
            if ((((_arg_2 == null) || (_arg_2.length == 0)) || (_arg_1 == null)))
            {
                return (0);
            };
            var _local_4:int;
            var _local_5:BitmapData;
            var _local_3:int;
            var _local_7:Point = renderColumns(_arg_1, _arg_2, _local_3, true);
            _local_3 = _local_7.x;
            if (_local_7.y > _local_4)
            {
                _local_4 = _local_7.y;
            };
            _local_5 = (_arg_2[(_arg_2.length - 1)] as BitmapData);
            if (_local_5 != null)
            {
                _local_6 = [_local_5];
                while (_local_3 < _arg_1.width)
                {
                    _local_7 = renderColumns(_arg_1, _local_6, _local_3, true);
                    _local_3 = _local_7.x;
                    if (_local_7.y > _local_4)
                    {
                        _local_4 = _local_7.y;
                    };
                };
            };
            return (_local_4);
        }

        private function renderRepeatRandom(_arg_1:BitmapData, _arg_2:Array):int
        {
            var _local_6:* = null;
            var _local_7:* = null;
            if ((((_arg_2 == null) || (_arg_2.length == 0)) || (_arg_1 == null)))
            {
                return (0);
            };
            var _local_4:int;
            var _local_5:BitmapData;
            var _local_3:int;
            while (_local_3 < _arg_1.width)
            {
                _local_5 = (_arg_2[nextRandomColumnIndex(_arg_2.length)] as BitmapData);
                if (_local_5 != null)
                {
                    _local_6 = [_local_5];
                    _local_7 = renderColumns(_arg_1, _local_6, _local_3, true);
                    _local_3 = _local_7.x;
                    if (_local_7.y > _local_4)
                    {
                        _local_4 = _local_7.y;
                    };
                }
                else
                {
                    return (_local_4);
                };
            };
            return (_local_4);
        }

        public function getColumns(_arg_1:int):Array
        {
            var _local_2:* = null;
            var _local_4:int;
            var _local_3:* = null;
            if (_SafeStr_6647 == 6)
            {
                _local_2 = [];
                _local_4 = 0;
                while (_local_4 < _arg_1)
                {
                    _local_3 = _SafeStr_6646[nextRandomColumnIndex(_SafeStr_6646.length)];
                    if (_local_3 != null)
                    {
                        _local_2.push(_local_3);
                        if (_local_3.width > 1)
                        {
                            _local_4 = (_local_4 + _local_3.width);
                        }
                        else
                        {
                            break;
                        };
                    }
                    else
                    {
                        break;
                    };
                };
                return (_local_2);
            };
            return (_SafeStr_6646);
        }


    }
}//package com.sulake.habbo.room.object.visualization.room.rasterizer.basic

// _SafeStr_6441 = "_-e1T" (String#5203, DoABC#4)
// _SafeStr_6571 = "_-s1E" (String#5514, DoABC#4)
// _SafeStr_6597 = "_-lF" (String#648, DoABC#4)
// _SafeStr_6598 = "_-yM" (String#3390, DoABC#4)
// _SafeStr_6646 = "_-B13" (String#4609, DoABC#4)
// _SafeStr_6647 = "_-T" (String#6000, DoABC#4)
// _SafeStr_6648 = "_-C1i" (String#6067, DoABC#4)
// _SafeStr_6649 = "_-Tn" (String#5966, DoABC#4)
// _SafeStr_6650 = "_-Sr" (String#6273, DoABC#4)
// _SafeStr_6651 = "_-eN" (String#6091, DoABC#4)
// _SafeStr_6652 = "_-Dg" (String#5728, DoABC#4)
// _SafeStr_8762 = "_-o16" (String#11659, DoABC#4)


