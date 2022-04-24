// by nota

//com.sulake.habbo.catalog.purchase.GiftWrappingConfiguration

package com.sulake.habbo.catalog.purchase
{
    import _-g1G._SafeStr_1107;
    import _-AE._SafeStr_289;

    public class GiftWrappingConfiguration 
    {

        private var _SafeStr_4513:Boolean = false;
        private var _SafeStr_5178:int;
        private var _SafeStr_4897:Array;
        private var _SafeStr_4893:Array;
        private var _SafeStr_4898:Array;
        private var _SafeStr_5179:Array;

        public function GiftWrappingConfiguration(_arg_1:_SafeStr_289)
        {
            if (_arg_1 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1107 = _arg_1.getParser();
            if (_local_2 == null)
            {
                return;
            };
            _SafeStr_4513 = _local_2.isWrappingEnabled;
            _SafeStr_5178 = _local_2.wrappingPrice;
            _SafeStr_4897 = _local_2.stuffTypes;
            _SafeStr_4893 = _local_2.boxTypes;
            _SafeStr_4898 = _local_2.ribbonTypes;
            _SafeStr_5179 = _local_2.defaultStuffTypes;
        }

        public function get isEnabled():Boolean
        {
            return (_SafeStr_4513);
        }

        public function get price():int
        {
            return (_SafeStr_5178);
        }

        public function get stuffTypes():Array
        {
            return (_SafeStr_4897);
        }

        public function get boxTypes():Array
        {
            return (_SafeStr_4893);
        }

        public function get ribbonTypes():Array
        {
            return (_SafeStr_4898);
        }

        public function get defaultStuffTypes():Array
        {
            return (_SafeStr_5179);
        }


    }
}//package com.sulake.habbo.catalog.purchase

// _SafeStr_1107 = "_-U1B" (String#36199, DoABC#4)
// _SafeStr_289 = "_-ZI" (String#19262, DoABC#4)
// _SafeStr_4513 = "_-fy" (String#4293, DoABC#4)
// _SafeStr_4893 = "_-T3" (String#4336, DoABC#4)
// _SafeStr_4897 = "_-A1a" (String#6802, DoABC#4)
// _SafeStr_4898 = "_-tv" (String#5061, DoABC#4)
// _SafeStr_5178 = "_-4G" (String#7290, DoABC#4)
// _SafeStr_5179 = "_-11b" (String#20714, DoABC#4)


