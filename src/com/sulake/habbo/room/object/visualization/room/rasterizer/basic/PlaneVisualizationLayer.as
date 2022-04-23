﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneVisualizationLayer

package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
    import com.sulake.core.runtime._SafeStr_13;
    import flash.display.BitmapData;
    import flash.geom.ColorTransform;
    import flash.geom.Point;
    import com.sulake.room.utils.IVector3d;

    public class PlaneVisualizationLayer implements _SafeStr_13 
    {

        public static const DEFAULT_OFFSET:int = 0;
        public static const ALIGN_TOP:int = 1;
        public static const ALIGN_BOTTOM:int = 2;
        public static const ALIGN_DEFAULT:int = 1;

        private var _SafeStr_6572:PlaneMaterial = null;
        private var _color:uint = 0;
        private var _offset:int = 0;
        private var _SafeStr_6441:int = 1;
        private var _bitmapData:BitmapData = null;
        private var _SafeStr_4036:Boolean = false;

        public function PlaneVisualizationLayer(_arg_1:PlaneMaterial, _arg_2:uint, _arg_3:int, _arg_4:int=0)
        {
            _SafeStr_6572 = _arg_1;
            _offset = _arg_4;
            _SafeStr_6441 = _arg_3;
            _color = _arg_2;
        }

        public function get offset():int
        {
            return (_offset);
        }

        public function get align():int
        {
            return (_SafeStr_6441);
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function dispose():void
        {
            _SafeStr_4036 = true;
            _SafeStr_6572 = null;
            if (_bitmapData != null)
            {
                _bitmapData.dispose();
                _bitmapData = null;
            };
        }

        public function clearCache():void
        {
            if (_bitmapData != null)
            {
                _bitmapData.dispose();
                _bitmapData = null;
            };
        }

        public function render(_arg_1:BitmapData, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:Boolean, _arg_6:int, _arg_7:int):BitmapData
        {
            var _local_16:Number;
            var _local_13:Number;
            var _local_10:Number;
            var _local_14:* = null;
            var _local_12:uint = (_color >> 16);
            var _local_9:uint = ((_color >> 8) & 0xFF);
            var _local_8:uint = (_color & 0xFF);
            var _local_11:Boolean;
            if ((((_local_12 < 0xFF) || (_local_9 < 0xFF)) || (_local_8 < 0xFF)))
            {
                _local_11 = true;
            };
            if ((((_arg_1 == null) || (!(_arg_1.width == _arg_2))) || (!(_arg_1.height == _arg_3))))
            {
                _arg_1 = null;
            };
            var _local_15:BitmapData;
            if (_SafeStr_6572 != null)
            {
                if (_local_11)
                {
                    _local_15 = _SafeStr_6572.render(null, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, (_arg_7 + offset), (align == 1));
                }
                else
                {
                    _local_15 = _SafeStr_6572.render(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, (_arg_7 + offset), (align == 1));
                };
                if (((!(_local_15 == null)) && (!(_local_15 == _arg_1))))
                {
                    if (_bitmapData != null)
                    {
                        _bitmapData.dispose();
                    };
                    try
                    {
                        _bitmapData = _local_15.clone();
                    }
                    catch(e:Error)
                    {
                        if (_bitmapData)
                        {
                            _bitmapData.dispose();
                        };
                        _bitmapData = null;
                        return (null);
                    };
                    _local_15 = _bitmapData;
                };
            }
            else
            {
                if (_arg_1 == null)
                {
                    if ((((!(_bitmapData == null)) && (_bitmapData.width == _arg_2)) && (_bitmapData.height == _arg_3)))
                    {
                        return (_bitmapData);
                    };
                    if (_bitmapData != null)
                    {
                        _bitmapData.dispose();
                    };
                    _bitmapData = new BitmapData(_arg_2, _arg_3, true, 0xFFFFFFFF);
                    _local_15 = _bitmapData;
                }
                else
                {
                    _arg_1.fillRect(_arg_1.rect, 0xFFFFFFFF);
                    _local_15 = _arg_1;
                };
            };
            if (_local_15 != null)
            {
                if (_local_11)
                {
                    _local_16 = (_local_12 / 0xFF);
                    _local_13 = (_local_9 / 0xFF);
                    _local_10 = (_local_8 / 0xFF);
                    _local_14 = new ColorTransform(_local_16, _local_13, _local_10);
                    _local_15.colorTransform(_local_15.rect, _local_14);
                    if (((!(_arg_1 == null)) && (!(_local_15 == _arg_1))))
                    {
                        _arg_1.copyPixels(_local_15, _local_15.rect, new Point(0, 0), null, null, true);
                        _local_15 = _arg_1;
                    };
                };
            };
            return (_local_15);
        }

        public function getMaterial():PlaneMaterial
        {
            return (_SafeStr_6572);
        }

        public function getColor():uint
        {
            return (_color);
        }


    }
}//package com.sulake.habbo.room.object.visualization.room.rasterizer.basic

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_6441 = "_-e1T" (String#5203, DoABC#4)
// _SafeStr_6572 = "_-YQ" (String#7988, DoABC#4)


