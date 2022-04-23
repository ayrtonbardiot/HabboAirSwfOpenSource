﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.furniture.FurnitureWaterAreaVisualization

package com.sulake.habbo.room.object.visualization.furniture
{
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import flash.geom.Point;

    public class FurnitureWaterAreaVisualization extends AnimatedFurnitureVisualization 
    {

        private static const SHORE_SPRITE_TAG:String = "shore";

        private var _SafeStr_4198:Boolean = true;
        private var _SafeStr_4201:Array = [];
        private var _SafeStr_4202:Array = [];
        private var _SafeStr_4196:Array = [];
        private var _needsShoreUpdate:Boolean = false;
        private var _SafeStr_3988:int = 0;
        private var _SafeStr_3989:int = 0;
        private var _SafeStr_4200:int = 0;
        private var _SafeStr_4199:int = -1;
        private var _shoreSpriteDirection:int = -1;
        private var _SafeStr_4197:BitmapData = null;


        override public function dispose():void
        {
            if (assetCollection != null)
            {
                for each (var _local_1:int in _SafeStr_4196)
                {
                    ShoreMaskCreatorUtility.disposeInstanceMask(object.getInstanceId(), _local_1, assetCollection);
                };
                _SafeStr_4196 = [];
            };
            if (_SafeStr_4197 != null)
            {
                _SafeStr_4197.dispose();
                _SafeStr_4197 = null;
            };
            super.dispose();
        }

        override protected function updateObject(_arg_1:Number, _arg_2:Number):Boolean
        {
            if (super.updateObject(_arg_1, _arg_2))
            {
                _needsShoreUpdate = true;
                updateBorderData();
                return (true);
            };
            return (false);
        }

        override protected function updateAnimation(_arg_1:Number):int
        {
            var _local_2:int;
            var _local_3:int = super.updateAnimation(_arg_1);
            if (updateInstanceShoreMask(_arg_1))
            {
                _local_2 = getShoreSpriteIndex(_arg_1);
                _local_3 = (_local_3 | (1 << _local_2));
            };
            return (_local_3);
        }

        override protected function getSpriteAssetName(_arg_1:int, _arg_2:int):String
        {
            if (((_arg_1 == 1) || (!(_arg_2 == getShoreSpriteIndex(_arg_1)))))
            {
                return (super.getSpriteAssetName(_arg_1, _arg_2));
            };
            if (_SafeStr_4198)
            {
                return (ShoreMaskCreatorUtility.getInstanceMaskName(object.getInstanceId(), getSize(_arg_1)));
            };
            return (null);
        }

        private function getShoreSpriteIndex(_arg_1:int):int
        {
            var _local_2:int;
            if (((_SafeStr_4199 == _arg_1) && (_shoreSpriteDirection == direction)))
            {
                return (_SafeStr_4200);
            };
            _local_2 = (spriteCount - 1);
            while (_local_2 >= 0)
            {
                if (getSpriteTag(_arg_1, direction, _local_2) == "shore")
                {
                    _SafeStr_4200 = _local_2;
                    _SafeStr_4199 = _arg_1;
                    _shoreSpriteDirection = direction;
                    return (_SafeStr_4200);
                };
                _local_2--;
            };
            return (-1);
        }

        private function getShoreAsset(_arg_1:int):IGraphicAsset
        {
            var _local_3:String = super.getSpriteAssetName(_arg_1, getShoreSpriteIndex(_arg_1));
            return (assetCollection.getAsset(_local_3));
        }

        private function getInstanceMask(_arg_1:int):IGraphicAsset
        {
            var _local_2:int = getSize(_arg_1);
            var _local_3:IGraphicAsset = ShoreMaskCreatorUtility.getInstanceMask(object.getInstanceId(), _local_2, assetCollection, getShoreAsset(_arg_1));
            if (_local_3 != null)
            {
                if (_SafeStr_4196.indexOf(_local_2) < 0)
                {
                    _SafeStr_4196.push(_local_2);
                };
            };
            return (_local_3);
        }

        private function updateBorderData():void
        {
            resetBorders();
            var _local_2:int = object.getState(0);
            var _local_6:Array = getAreaData();
            var _local_1:int = (_SafeStr_3988 + 2);
            var _local_7:int = (_SafeStr_3989 + 2);
            var _local_3:int;
            var _local_5:Array = _local_6[(_local_7 - 1)];
            _local_3 = (_local_1 - 1);
            while (_local_3 >= 0)
            {
                if ((_local_2 & 0x01))
                {
                    _local_5[_local_3] = true;
                };
                _local_2 = (_local_2 >> 1);
                _local_3--;
            };
            _local_3 = (_local_7 - 2);
            while (_local_3 >= 1)
            {
                _local_5 = _local_6[_local_3];
                if ((_local_2 & 0x01))
                {
                    _local_5[(_local_1 - 1)] = true;
                };
                _local_2 = (_local_2 >> 1);
                if ((_local_2 & 0x01))
                {
                    _local_5[0] = true;
                };
                _local_2 = (_local_2 >> 1);
                _local_3--;
            };
            _local_5 = _local_6[0];
            _local_3 = (_local_1 - 1);
            while (_local_3 >= 0)
            {
                if ((_local_2 & 0x01))
                {
                    _local_5[_local_3] = true;
                };
                _local_2 = (_local_2 >> 1);
                _local_3--;
            };
            var _local_4:int;
            _local_4 = updateTopBorder(_local_6, _local_4);
            _local_4 = updateRightBorder(_local_6, _local_4);
            _local_4 = updateBottomBorder(_local_6, _local_4);
            _local_4 = updateLeftBorder(_local_6, _local_4);
            _SafeStr_4198 = false;
            _local_3 = 0;
            while (_local_3 < _SafeStr_4201.length)
            {
                if (_SafeStr_4201[_local_3] == true)
                {
                    _SafeStr_4198 = true;
                };
                _local_3++;
            };
        }

        private function updateTopBorder(_arg_1:Array, _arg_2:int):int
        {
            var _local_4:int;
            var _local_3:int = (_SafeStr_3988 + 2);
            var _local_6:Array = _arg_1[0];
            var _local_7:Array = _arg_1[1];
            var _local_8:int;
            var _local_5:int;
            _local_4 = 1;
            while (_local_4 < (_local_3 - 1))
            {
                if (_local_6[_local_4] == false)
                {
                    _SafeStr_4201[_arg_2] = true;
                    if (((_local_7[(_local_4 - 1)] == false) && (_local_6[(_local_4 - 1)] == false)))
                    {
                        _local_8 = 0;
                    }
                    else
                    {
                        if (_local_6[(_local_4 - 1)] == true)
                        {
                            _local_8 = 2;
                        }
                        else
                        {
                            _local_8 = 1;
                        };
                    };
                    if (((_local_7[(_local_4 + 1)] == false) && (_local_6[(_local_4 + 1)] == false)))
                    {
                        _local_5 = 0;
                    }
                    else
                    {
                        if (_local_6[(_local_4 + 1)] == true)
                        {
                            _local_5 = 2;
                        }
                        else
                        {
                            _local_5 = 1;
                        };
                    };
                    _SafeStr_4202[_arg_2] = ShoreMaskCreatorUtility.getBorderType(_local_8, _local_5);
                };
                _arg_2++;
                _local_4++;
            };
            return (_arg_2);
        }

        private function updateRightBorder(_arg_1:Array, _arg_2:int):int
        {
            var _local_4:int;
            var _local_3:int = (_SafeStr_3988 + 2);
            var _local_10:int = (_SafeStr_3989 + 2);
            var _local_8:int;
            var _local_5:int;
            var _local_6:Array;
            var _local_9:Array;
            var _local_7:Array;
            _local_4 = 1;
            while (_local_4 < (_local_10 - 1))
            {
                _local_6 = _arg_1[_local_4];
                _local_9 = _arg_1[(_local_4 - 1)];
                _local_7 = _arg_1[(_local_4 + 1)];
                if (_local_6[(_local_3 - 1)] == false)
                {
                    _SafeStr_4201[_arg_2] = true;
                    if (((_local_9[(_local_3 - 2)] == false) && (_local_9[(_local_3 - 1)] == false)))
                    {
                        _local_8 = 0;
                    }
                    else
                    {
                        if (_local_9[(_local_3 - 1)] == true)
                        {
                            _local_8 = 2;
                        }
                        else
                        {
                            _local_8 = 1;
                        };
                    };
                    if (((_local_7[(_local_3 - 2)] == false) && (_local_7[(_local_3 - 1)] == false)))
                    {
                        _local_5 = 0;
                    }
                    else
                    {
                        if (_local_7[(_local_3 - 1)] == true)
                        {
                            _local_5 = 2;
                        }
                        else
                        {
                            _local_5 = 1;
                        };
                    };
                    _SafeStr_4202[_arg_2] = ShoreMaskCreatorUtility.getBorderType(_local_8, _local_5);
                };
                _arg_2++;
                _local_4++;
            };
            return (_arg_2);
        }

        private function updateBottomBorder(_arg_1:Array, _arg_2:int):int
        {
            var _local_4:int;
            var _local_3:int = (_SafeStr_3988 + 2);
            var _local_9:int = (_SafeStr_3989 + 2);
            var _local_7:int;
            var _local_5:int;
            var _local_6:Array = _arg_1[(_local_9 - 1)];
            var _local_8:Array = _arg_1[(_local_9 - 2)];
            _local_4 = (_local_3 - 2);
            while (_local_4 >= 1)
            {
                if (_local_6[_local_4] == false)
                {
                    _SafeStr_4201[_arg_2] = true;
                    if (((_local_8[(_local_4 + 1)] == false) && (_local_6[(_local_4 + 1)] == false)))
                    {
                        _local_7 = 0;
                    }
                    else
                    {
                        if (_local_6[(_local_4 + 1)] == true)
                        {
                            _local_7 = 2;
                        }
                        else
                        {
                            _local_7 = 1;
                        };
                    };
                    if (((_local_8[(_local_4 - 1)] == false) && (_local_6[(_local_4 - 1)] == false)))
                    {
                        _local_5 = 0;
                    }
                    else
                    {
                        if (_local_6[(_local_4 - 1)] == true)
                        {
                            _local_5 = 2;
                        }
                        else
                        {
                            _local_5 = 1;
                        };
                    };
                    _SafeStr_4202[_arg_2] = ShoreMaskCreatorUtility.getBorderType(_local_7, _local_5);
                };
                _arg_2++;
                _local_4--;
            };
            return (_arg_2);
        }

        private function updateLeftBorder(_arg_1:Array, _arg_2:int):int
        {
            var _local_4:int;
            var _local_3:int = (_SafeStr_3988 + 2);
            var _local_10:int = (_SafeStr_3989 + 2);
            var _local_8:int;
            var _local_5:int;
            var _local_6:Array;
            var _local_9:Array;
            var _local_7:Array;
            _local_4 = (_local_10 - 2);
            while (_local_4 >= 1)
            {
                _local_6 = _arg_1[_local_4];
                _local_9 = _arg_1[(_local_4 + 1)];
                _local_7 = _arg_1[(_local_4 - 1)];
                if (_local_6[0] == false)
                {
                    _SafeStr_4201[_arg_2] = true;
                    if (((_local_9[1] == false) && (_local_9[0] == false)))
                    {
                        _local_8 = 0;
                    }
                    else
                    {
                        if (_local_9[0] == true)
                        {
                            _local_8 = 2;
                        }
                        else
                        {
                            _local_8 = 1;
                        };
                    };
                    if (((_local_7[1] == false) && (_local_7[0] == false)))
                    {
                        _local_5 = 0;
                    }
                    else
                    {
                        if (_local_7[0] == true)
                        {
                            _local_5 = 2;
                        }
                        else
                        {
                            _local_5 = 1;
                        };
                    };
                    _SafeStr_4202[_arg_2] = ShoreMaskCreatorUtility.getBorderType(_local_8, _local_5);
                };
                _arg_2++;
                _local_4--;
            };
            return (_arg_2);
        }

        private function resetBorders():void
        {
            var _local_2:* = null;
            var _local_1:int;
            if (((_SafeStr_3988 == 0) || (_SafeStr_3989 == 0)))
            {
                if (((object == null) || (object.getModel() == null)))
                {
                    return;
                };
                _local_2 = object.getModel();
                _SafeStr_3988 = _local_2.getNumber("furniture_size_x");
                _SafeStr_3989 = _local_2.getNumber("furniture_size_y");
            };
            _SafeStr_4201 = [];
            _SafeStr_4202 = [];
            _local_1 = 0;
            while (_local_1 < ((_SafeStr_3988 * 2) + (_SafeStr_3989 * 2)))
            {
                _SafeStr_4201.push(false);
                _SafeStr_4202.push(1);
                _local_1++;
            };
        }

        private function getAreaData():Array
        {
            var _local_1:int = (_SafeStr_3988 + 2);
            var _local_5:int = (_SafeStr_3989 + 2);
            var _local_6:Array = [];
            var _local_4:Array;
            var _local_2:int;
            var _local_3:int;
            _local_3 = 0;
            while (_local_3 < _local_5)
            {
                _local_4 = [];
                _local_2 = (_local_1 - 1);
                while (_local_2 >= 0)
                {
                    _local_4.push(false);
                    _local_2--;
                };
                _local_6.push(_local_4);
                _local_3++;
            };
            _local_3 = 1;
            while (_local_3 < (_local_5 - 1))
            {
                _local_4 = _local_6[_local_3];
                _local_2 = 1;
                while (_local_2 < (_local_1 - 1))
                {
                    _local_4[_local_2] = true;
                    _local_2++;
                };
                _local_3++;
            };
            return (_local_6);
        }

        private function initializeShoreMasks(_arg_1:Number):Boolean
        {
            return (ShoreMaskCreatorUtility.initializeShoreMasks(getSize(_arg_1), assetCollection, getShoreAsset(_arg_1)));
        }

        private function createShoreMask(_arg_1:int, _arg_2:int, _arg_3:Number):BitmapData
        {
            if ((((_SafeStr_4197 == null) || (_SafeStr_4197.width < _arg_1)) || (_SafeStr_4197.height < _arg_2)))
            {
                if (_SafeStr_4197 != null)
                {
                    _SafeStr_4197.dispose();
                };
                _SafeStr_4197 = ShoreMaskCreatorUtility.createEmptyMask(_arg_1, _arg_2);
            };
            return (ShoreMaskCreatorUtility.createShoreMask2x2(_SafeStr_4197, getSize(_arg_3), _SafeStr_4201, _SafeStr_4202, assetCollection));
        }

        private function updateInstanceShoreMask(_arg_1:Number):Boolean
        {
            var _local_3:* = null;
            var _local_6:* = null;
            var _local_2:* = null;
            var _local_4:* = null;
            if (!_needsShoreUpdate)
            {
                return (false);
            };
            var _local_5:IGraphicAsset = getInstanceMask(_arg_1);
            if ((((!(_local_5 == null)) && (!(_local_5.asset == null))) && (initializeShoreMasks(_arg_1))))
            {
                _local_3 = (_local_5.asset.content as BitmapData);
                if (_local_3 != null)
                {
                    _local_6 = createShoreMask(_local_3.width, _local_3.height, _arg_1);
                    _local_2 = getShoreAsset(_arg_1);
                    if (((!(_local_2 == null)) && (!(_local_2.asset == null))))
                    {
                        _local_4 = (_local_2.asset.content as BitmapData);
                        if (_local_4 != null)
                        {
                            _local_3.fillRect(_local_3.rect, 0);
                            _local_3.copyPixels(_local_4, _local_4.rect, new Point(0, 0), _local_6, new Point(0, 0), true);
                        };
                        _needsShoreUpdate = false;
                    };
                };
                return (true);
            };
            return (false);
        }

        override protected function setAnimation(_arg_1:int):void
        {
            super.setAnimation(0);
        }


    }
}//package com.sulake.habbo.room.object.visualization.furniture

// _SafeStr_3988 = "_-u6" (String#3243, DoABC#4)
// _SafeStr_3989 = "_-am" (String#2958, DoABC#4)
// _SafeStr_4196 = "_-715" (String#9878, DoABC#4)
// _SafeStr_4197 = "_-mR" (String#1950, DoABC#4)
// _SafeStr_4198 = "_-d1N" (String#13368, DoABC#4)
// _SafeStr_4199 = "_-t1l" (String#18675, DoABC#4)
// _SafeStr_4200 = "_-x1q" (String#14874, DoABC#4)
// _SafeStr_4201 = "_-d1S" (String#5773, DoABC#4)
// _SafeStr_4202 = "_-c1W" (String#6977, DoABC#4)


