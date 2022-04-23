// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneTextureBitmap

package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
    import flash.display.BitmapData;

    public class PlaneTextureBitmap 
    {

        public static const _SafeStr_8762:Number = -1;
        public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;

        private var _bitmap:BitmapData = null;
        private var _SafeStr_6648:Number = -1;
        private var _SafeStr_6649:Number = 1;
        private var _SafeStr_6650:Number = -1;
        private var _SafeStr_6651:Number = 1;
        private var _assetName:String = null;

        public function PlaneTextureBitmap(_arg_1:BitmapData, _arg_2:Number=-1, _arg_3:Number=1, _arg_4:Number=-1, _arg_5:Number=1, _arg_6:String=null)
        {
            _SafeStr_6648 = _arg_2;
            _SafeStr_6649 = _arg_3;
            _SafeStr_6650 = _arg_4;
            _SafeStr_6651 = _arg_5;
            _assetName = _arg_6;
            _bitmap = _arg_1;
        }

        public function get bitmap():BitmapData
        {
            return (_bitmap);
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

        public function get assetName():String
        {
            return (_assetName);
        }

        public function dispose():void
        {
            _bitmap = null;
        }


    }
}//package com.sulake.habbo.room.object.visualization.room.rasterizer.basic

// _SafeStr_6648 = "_-C1i" (String#6067, DoABC#4)
// _SafeStr_6649 = "_-Tn" (String#5966, DoABC#4)
// _SafeStr_6650 = "_-Sr" (String#6273, DoABC#4)
// _SafeStr_6651 = "_-eN" (String#6091, DoABC#4)
// _SafeStr_8762 = "_-o16" (String#11659, DoABC#4)


