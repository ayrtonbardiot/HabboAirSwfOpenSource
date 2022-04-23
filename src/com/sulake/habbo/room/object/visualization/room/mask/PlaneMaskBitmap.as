// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskBitmap

package com.sulake.habbo.room.object.visualization.room.mask
{
    import com.sulake.room.object.visualization.utils.IGraphicAsset;

    public class PlaneMaskBitmap 
    {

        public static const _SafeStr_8762:Number = -1;
        public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;

        private var _asset:IGraphicAsset = null;
        private var _SafeStr_6648:Number = -1;
        private var _SafeStr_6649:Number = 1;
        private var _SafeStr_6650:Number = -1;
        private var _SafeStr_6651:Number = 1;

        public function PlaneMaskBitmap(_arg_1:IGraphicAsset, _arg_2:Number=-1, _arg_3:Number=1, _arg_4:Number=-1, _arg_5:Number=1)
        {
            _SafeStr_6648 = _arg_2;
            _SafeStr_6649 = _arg_3;
            _SafeStr_6650 = _arg_4;
            _SafeStr_6651 = _arg_5;
            _asset = _arg_1;
        }

        public function get asset():IGraphicAsset
        {
            return (_asset);
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

        public function dispose():void
        {
            _asset = null;
        }


    }
}//package com.sulake.habbo.room.object.visualization.room.mask

// _SafeStr_6648 = "_-C1i" (String#6067, DoABC#4)
// _SafeStr_6649 = "_-Tn" (String#5966, DoABC#4)
// _SafeStr_6650 = "_-Sr" (String#6273, DoABC#4)
// _SafeStr_6651 = "_-eN" (String#6091, DoABC#4)
// _SafeStr_8762 = "_-o16" (String#11659, DoABC#4)


