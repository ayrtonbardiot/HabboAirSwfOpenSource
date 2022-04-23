// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneVisualization

package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
    import com.sulake.room.utils.IRoomGeometry;
    import flash.display.BitmapData;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.PlaneVisualizationAnimationLayer;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import flash.geom.Point;
    import com.sulake.room.utils.IVector3d;

    public class PlaneVisualization 
    {

        private var _layers:Array = [];
        private var _geometry:IRoomGeometry = null;
        private var _SafeStr_6597:BitmapData;
        private var _cachedBitmapNormal:Vector3d = null;
        private var _SafeStr_6598:Boolean = false;
        private var _hasAnimationLayers:Boolean = false;

        public function PlaneVisualization(_arg_1:Number, _arg_2:int, _arg_3:IRoomGeometry)
        {
            var _local_4:int;
            super();
            if (_arg_2 < 0)
            {
                _arg_2 = 0;
            };
            _local_4 = 0;
            while (_local_4 < _arg_2)
            {
                _layers.push(null);
                _local_4++;
            };
            _geometry = _arg_3;
            _cachedBitmapNormal = new Vector3d();
        }

        public function get geometry():IRoomGeometry
        {
            return (_geometry);
        }

        public function get hasAnimationLayers():Boolean
        {
            return (_hasAnimationLayers);
        }

        public function dispose():void
        {
            var _local_1:int;
            var _local_2:* = null;
            if (_layers != null)
            {
                _local_1 = 0;
                while (_local_1 < _layers.length)
                {
                    _local_2 = (_layers[_local_1] as _SafeStr_13);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    };
                    _local_1++;
                };
                _layers = null;
            };
            _geometry = null;
            if (_SafeStr_6597 != null)
            {
                _SafeStr_6597.dispose();
            };
            if (_cachedBitmapNormal != null)
            {
                _cachedBitmapNormal = null;
            };
        }

        public function clearCache():void
        {
            var _local_2:int;
            var _local_3:* = null;
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
                _cachedBitmapNormal.assign(new Vector3d());
            };
            if (_layers != null)
            {
                _local_2 = 0;
                while (_local_2 < _layers.length)
                {
                    _local_3 = (_layers[_local_2] as PlaneVisualizationLayer);
                    _local_1 = (_layers[_local_2] as PlaneVisualizationAnimationLayer);
                    if (_local_3 != null)
                    {
                        _local_3.clearCache();
                    }
                    else
                    {
                        if (_local_1 != null)
                        {
                            _local_1.clearCache();
                        };
                    };
                    _local_2++;
                };
            };
            _SafeStr_6598 = false;
        }

        public function setLayer(_arg_1:int, _arg_2:PlaneMaterial, _arg_3:uint, _arg_4:int, _arg_5:int=0):Boolean
        {
            if (((_arg_1 < 0) || (_arg_1 > _layers.length)))
            {
                return (false);
            };
            var _local_6:_SafeStr_13 = (_layers[_arg_1] as _SafeStr_13);
            if (_local_6 != null)
            {
                _local_6.dispose();
                _local_6 = null;
            };
            _local_6 = new PlaneVisualizationLayer(_arg_2, _arg_3, _arg_4, _arg_5);
            _layers[_arg_1] = _local_6;
            return (true);
        }

        public function setAnimationLayer(_arg_1:int, _arg_2:XML, _arg_3:IGraphicAssetCollection):Boolean
        {
            if (((_arg_1 < 0) || (_arg_1 > _layers.length)))
            {
                return (false);
            };
            var _local_4:_SafeStr_13 = (_layers[_arg_1] as _SafeStr_13);
            if (_local_4 != null)
            {
                _local_4.dispose();
                _local_4 = null;
            };
            _local_4 = new PlaneVisualizationAnimationLayer(_arg_2, _arg_3);
            _layers[_arg_1] = _local_4;
            _hasAnimationLayers = true;
            return (true);
        }

        public function getLayers():Array
        {
            return (_layers);
        }

        public function render(_arg_1:BitmapData, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:Boolean, _arg_6:int=0, _arg_7:int=0, _arg_8:int=0, _arg_9:int=0, _arg_10:Number=0, _arg_11:Number=0, _arg_12:int=0):BitmapData
        {
            var _local_14:int;
            var _local_15:* = null;
            var _local_13:* = null;
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
            if (_SafeStr_6597 != null)
            {
                try
                {
                    if ((((_SafeStr_6597.width == _arg_2) && (_SafeStr_6597.height == _arg_3)) && (Vector3d.isEqual(_cachedBitmapNormal, _arg_4))))
                    {
                        if (!hasAnimationLayers)
                        {
                            if (_arg_1 != null)
                            {
                                _arg_1.copyPixels(_SafeStr_6597, _SafeStr_6597.rect, new Point(0, 0), null, null, false);
                                var _local_17:* = _arg_1;
                                return (_local_17);
                            };
                            var _local_18:* = _SafeStr_6597;
                            return (_local_18);
                        };
                    }
                    else
                    {
                        _SafeStr_6597.dispose();
                        _SafeStr_6597 = null;
                    };
                }
                catch(e:Error)
                {
                    _SafeStr_6597.dispose();
                    _SafeStr_6597 = null;
                    return (null);
                };
            };
            _SafeStr_6598 = true;
            if (_SafeStr_6597 == null)
            {
                try
                {
                    _SafeStr_6597 = new BitmapData(_arg_2, _arg_3, true, 0xFFFFFF);
                }
                catch(e:Error)
                {
                    if (_SafeStr_6597)
                    {
                        _SafeStr_6597.dispose();
                    };
                    _SafeStr_6597 = null;
                    return (null);
                };
            }
            else
            {
                _SafeStr_6597.fillRect(_SafeStr_6597.rect, 0xFFFFFF);
            };
            if (_arg_1 == null)
            {
                _arg_1 = _SafeStr_6597;
            };
            _cachedBitmapNormal.assign(_arg_4);
            _local_14 = 0;
            while (_local_14 < _layers.length)
            {
                _local_15 = (_layers[_local_14] as PlaneVisualizationLayer);
                _local_13 = (_layers[_local_14] as PlaneVisualizationAnimationLayer);
                if (_local_15 != null)
                {
                    _local_15.render(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7);
                }
                else
                {
                    if (_local_13 != null)
                    {
                        _local_13.render(_arg_1, _arg_2, _arg_3, _arg_4, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11, _arg_12);
                    };
                };
                _local_14++;
            };
            if (((!(_arg_1 == null)) && (!(_arg_1 == _SafeStr_6597))))
            {
                _SafeStr_6597.copyPixels(_arg_1, _arg_1.rect, new Point(0, 0), null, null, false);
                return (_arg_1);
            };
            return (_SafeStr_6597);
        }


    }
}//package com.sulake.habbo.room.object.visualization.room.rasterizer.basic

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_6597 = "_-lF" (String#648, DoABC#4)
// _SafeStr_6598 = "_-yM" (String#3390, DoABC#4)


