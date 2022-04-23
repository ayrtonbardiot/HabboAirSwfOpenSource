// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.object.visualization.utils.GraphicAsset

package com.sulake.room.object.visualization.utils
{
    import __AS3__.vec.Vector;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.assets.IAsset;
    import flash.display.BitmapData;

    public class GraphicAsset implements IGraphicAsset 
    {

        private static const _SafeStr_6308:Vector.<GraphicAsset> = new Vector.<GraphicAsset>();

        private var _assetName:String;
        private var _libraryAssetName:String;
        private var _asset:BitmapDataAsset;
        private var _flipH:Boolean;
        private var _flipV:Boolean;
        private var _SafeStr_6309:Boolean;
        private var _offsetX:int;
        private var _offsetY:int;
        private var _width:int;
        private var _SafeStr_4234:int;
        private var _SafeStr_3853:Boolean;


        public static function allocate(_arg_1:String, _arg_2:String, _arg_3:IAsset, _arg_4:Boolean, _arg_5:Boolean, _arg_6:int, _arg_7:int, _arg_8:Boolean=false):GraphicAsset
        {
            var _local_9:GraphicAsset = ((_SafeStr_6308.length > 0) ? _SafeStr_6308.pop() : new (GraphicAsset)());
            _local_9._assetName = _arg_1;
            _local_9._libraryAssetName = _arg_2;
            var _local_10:BitmapDataAsset = (_arg_3 as BitmapDataAsset);
            if (_local_10 != null)
            {
                _local_9._asset = _local_10;
                _local_9._SafeStr_3853 = false;
            }
            else
            {
                _local_9._asset = null;
                _local_9._SafeStr_3853 = true;
            };
            _local_9._flipH = _arg_4;
            _local_9._flipV = _arg_5;
            _local_9._offsetX = _arg_6;
            _local_9._offsetY = _arg_7;
            _local_9._SafeStr_6309 = _arg_8;
            return (_local_9);
        }


        public function recycle():void
        {
            _asset = null;
            _SafeStr_6308.push(this);
        }

        private function initialize():void
        {
            var _local_1:* = null;
            if (((!(_SafeStr_3853)) && (!(_asset == null))))
            {
                _local_1 = (_asset.content as BitmapData);
                if (_local_1 != null)
                {
                    _width = _local_1.width;
                    _SafeStr_4234 = _local_1.height;
                };
                _SafeStr_3853 = true;
            };
        }

        public function get flipV():Boolean
        {
            return (_flipV);
        }

        public function get flipH():Boolean
        {
            return (_flipH);
        }

        public function get width():int
        {
            initialize();
            return (_width);
        }

        public function get height():int
        {
            initialize();
            return (_SafeStr_4234);
        }

        public function get assetName():String
        {
            return (_assetName);
        }

        public function get libraryAssetName():String
        {
            return (_libraryAssetName);
        }

        public function get asset():IAsset
        {
            return (_asset);
        }

        public function get usesPalette():Boolean
        {
            return (_SafeStr_6309);
        }

        public function get offsetX():int
        {
            if (!_flipH)
            {
                return (_offsetX);
            };
            return (-(width + _offsetX));
        }

        public function get offsetY():int
        {
            if (!_flipV)
            {
                return (_offsetY);
            };
            return (-(height + _offsetY));
        }

        public function get originalOffsetX():int
        {
            return (_offsetX);
        }

        public function get originalOffsetY():int
        {
            return (_offsetY);
        }


    }
}//package com.sulake.room.object.visualization.utils

// _SafeStr_3853 = "_-T1w" (String#2104, DoABC#4)
// _SafeStr_4234 = "_-z1j" (String#771, DoABC#4)
// _SafeStr_6308 = "_-GT" (String#5453, DoABC#4)
// _SafeStr_6309 = "_-r1Z" (String#23837, DoABC#4)


