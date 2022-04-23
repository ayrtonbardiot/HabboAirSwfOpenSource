// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager

package com.sulake.habbo.room.object.visualization.room.mask
{
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.room.utils._SafeStr_1675;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import flash.geom.Matrix;
    import com.sulake.room.utils.IVector3d;

    public class PlaneMaskManager 
    {

        private var _assetCollection:IGraphicAssetCollection = null;
        private var _SafeStr_5576:_SafeStr_24 = null;
        private var _SafeStr_3740:XML = null;

        public function PlaneMaskManager()
        {
            _SafeStr_5576 = new _SafeStr_24();
        }

        public function get data():XML
        {
            return (_SafeStr_3740);
        }

        public function dispose():void
        {
            var _local_1:int;
            var _local_2:* = null;
            _assetCollection = null;
            _SafeStr_3740 = null;
            if (_SafeStr_5576 != null)
            {
                _local_1 = 0;
                while (_local_1 < _SafeStr_5576.length)
                {
                    _local_2 = (_SafeStr_5576.getWithIndex(_local_1) as PlaneMask);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    };
                    _local_1++;
                };
                _SafeStr_5576.dispose();
            };
        }

        public function initialize(_arg_1:XML):void
        {
            _SafeStr_3740 = _arg_1;
        }

        public function initializeAssetCollection(_arg_1:IGraphicAssetCollection):void
        {
            if (data == null)
            {
                return;
            };
            _assetCollection = _arg_1;
            parseMasks(data, _arg_1);
        }

        private function parseMasks(_arg_1:XML, _arg_2:IGraphicAssetCollection):void
        {
            var _local_5:int;
            var _local_16:* = null;
            var _local_14:* = null;
            var _local_15:* = null;
            var _local_9:* = null;
            var _local_7:int;
            var _local_13:* = null;
            var _local_11:int;
            var _local_4:* = null;
            var _local_3:* = null;
            var _local_12:* = null;
            if (((_arg_1 == null) || (_arg_2 == null)))
            {
                return;
            };
            var _local_10:Array = ["id"];
            var _local_8:Array = ["size"];
            var _local_6:XMLList = _arg_1.mask;
            _local_5 = 0;
            while (_local_5 < _local_6.length())
            {
                _local_16 = _local_6[_local_5];
                if (_SafeStr_1675.checkRequiredAttributes(_local_16, _local_10))
                {
                    _local_14 = _local_16.@id;
                    if (_SafeStr_5576.getValue(_local_14) == null)
                    {
                        _local_15 = new PlaneMask();
                        _local_9 = _local_16.maskVisualization;
                        _local_7 = 0;
                        while (_local_7 < _local_9.length())
                        {
                            _local_13 = _local_9[_local_7];
                            if (_SafeStr_1675.checkRequiredAttributes(_local_13, _local_8))
                            {
                                _local_11 = parseInt(_local_13.@size);
                                _local_4 = _local_15.createMaskVisualization(_local_11);
                                if (_local_4 != null)
                                {
                                    _local_3 = _local_13.bitmap;
                                    _local_12 = parseMaskBitmaps(_local_3, _local_4, _arg_2);
                                    _local_15.setAssetName(_local_11, _local_12);
                                };
                            };
                            _local_7++;
                        };
                        _SafeStr_5576.add(_local_14, _local_15);
                    };
                };
                _local_5++;
            };
        }

        private function parseMaskBitmaps(_arg_1:XMLList, _arg_2:PlaneMaskVisualization, _arg_3:IGraphicAssetCollection):String
        {
            var _local_8:int;
            var _local_4:* = null;
            var _local_6:Number;
            var _local_12:Number;
            var _local_9:Number;
            var _local_5:Number;
            var _local_7:* = null;
            var _local_11:* = null;
            if (_arg_1 == null)
            {
                return (null);
            };
            var _local_10:String;
            _local_8 = 0;
            while (_local_8 < _arg_1.length())
            {
                _local_4 = _arg_1[_local_8];
                if (_SafeStr_1675.checkRequiredAttributes(_local_4, ["assetName"]))
                {
                    _local_6 = -1;
                    _local_12 = 1;
                    _local_9 = -1;
                    _local_5 = 1;
                    if (String(_local_4.@normalMinX) != "")
                    {
                        _local_6 = parseFloat(_local_4.@normalMinX);
                    };
                    if (String(_local_4.@normalMaxX) != "")
                    {
                        _local_12 = parseFloat(_local_4.@normalMaxX);
                    };
                    if (String(_local_4.@normalMinY) != "")
                    {
                        _local_9 = parseFloat(_local_4.@normalMinY);
                    };
                    if (String(_local_4.@normalMaxY) != "")
                    {
                        _local_5 = parseFloat(_local_4.@normalMaxY);
                    };
                    _local_7 = _local_4.@assetName;
                    _local_11 = _arg_3.getAsset(_local_7);
                    if (_local_11 != null)
                    {
                        if (!_local_11.flipH)
                        {
                            _local_10 = _local_7;
                        };
                        _arg_2.addBitmap(_local_11, _local_6, _local_12, _local_9, _local_5);
                    };
                };
                _local_8++;
            };
            return (_local_10);
        }

        public function updateMask(_arg_1:BitmapData, _arg_2:String, _arg_3:Number, _arg_4:IVector3d, _arg_5:int, _arg_6:int):Boolean
        {
            var _local_15:* = null;
            var _local_9:* = null;
            var _local_10:* = null;
            var _local_8:* = null;
            var _local_7:* = null;
            var _local_13:Number;
            var _local_14:Number;
            var _local_12:Number;
            var _local_11:Number;
            var _local_16:PlaneMask = (_SafeStr_5576.getValue(_arg_2) as PlaneMask);
            if (_local_16 != null)
            {
                _local_15 = _local_16.getGraphicAsset(_arg_3, _arg_4);
                if (_local_15 != null)
                {
                    _local_9 = (_local_15.asset as BitmapDataAsset);
                    if (_local_9 != null)
                    {
                        _local_10 = (_local_9.content as BitmapData);
                        if (_local_10 != null)
                        {
                            _local_8 = new Point((_arg_5 + _local_15.offsetX), (_arg_6 + _local_15.offsetY));
                            _local_7 = new Matrix();
                            _local_13 = 1;
                            _local_14 = 1;
                            _local_12 = 0;
                            _local_11 = 0;
                            if (_local_15.flipH)
                            {
                                _local_13 = -1;
                                _local_12 = _local_10.width;
                            };
                            if (_local_15.flipV)
                            {
                                _local_14 = -1;
                                _local_11 = _local_10.height;
                            };
                            _local_7.scale(_local_13, _local_14);
                            _local_7.translate((_local_8.x + _local_12), (_local_8.y + _local_11));
                            _arg_1.draw(_local_10, _local_7);
                        };
                    };
                };
            };
            return (true);
        }

        public function getMask(_arg_1:String):PlaneMask
        {
            return (_SafeStr_5576.getValue(_arg_1) as PlaneMask);
        }


    }
}//package com.sulake.habbo.room.object.visualization.room.mask

// _SafeStr_1675 = "_-j1M" (String#2347, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_5576 = "_-8p" (String#2766, DoABC#4)


