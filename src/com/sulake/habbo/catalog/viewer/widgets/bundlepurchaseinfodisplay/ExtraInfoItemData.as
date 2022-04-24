// by nota

//com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData

package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay
{
    public class ExtraInfoItemData 
    {

        public static const TYPE_PROMO:int = 0;
        public static const _SafeStr_8338:int = 1;
        public static const _SafeStr_8339:int = 2;
        public static const TYPE_BONUS_BADGE:int = 3;
        public static const _SafeStr_8340:int = 4;
        public static const TYPE_RESET_MESSAGE:int = 5;

        private var _SafeStr_4028:int;
        private var _text:String;
        private var _SafeStr_4892:int;
        private var _SafeStr_4261:int;
        private var _SafeStr_6945:int;
        private var _SafeStr_6946:int;
        private var _SafeStr_5094:int;
        private var _SafeStr_5100:int;
        private var _SafeStr_4723:String;
        private var _SafeStr_6944:String;

        public function ExtraInfoItemData(_arg_1:int, _arg_2:String="")
        {
            _SafeStr_4028 = _arg_1;
            _text = _arg_2;
        }

        public function set text(_arg_1:String):void
        {
            _text = _arg_1;
        }

        public function set quantity(_arg_1:int):void
        {
            _SafeStr_4892 = _arg_1;
        }

        public function set activityPointType(_arg_1:int):void
        {
            _SafeStr_4261 = _arg_1;
        }

        public function set discountPriceCredits(_arg_1:int):void
        {
            _SafeStr_6945 = _arg_1;
        }

        public function set discountPriceActivityPoints(_arg_1:int):void
        {
            _SafeStr_6946 = _arg_1;
        }

        public function set priceCredits(_arg_1:int):void
        {
            _SafeStr_5094 = _arg_1;
        }

        public function set priceActivityPoints(_arg_1:int):void
        {
            _SafeStr_5100 = _arg_1;
        }

        public function set badgeCode(_arg_1:String):void
        {
            _SafeStr_4723 = _arg_1;
        }

        public function set achievementCode(_arg_1:String):void
        {
            _SafeStr_6944 = _arg_1;
        }

        public function get type():int
        {
            return (_SafeStr_4028);
        }

        public function get text():String
        {
            return (_text);
        }

        public function get quantity():int
        {
            return (_SafeStr_4892);
        }

        public function get priceCredits():int
        {
            return (_SafeStr_5094);
        }

        public function get priceActivityPoints():int
        {
            return (_SafeStr_5100);
        }

        public function get activityPointType():int
        {
            return (_SafeStr_4261);
        }

        public function get badgeCode():String
        {
            return (_SafeStr_4723);
        }

        public function get achievementCode():String
        {
            return (_SafeStr_6944);
        }

        public function get discountPriceCredits():int
        {
            return (_SafeStr_6945);
        }

        public function get discountPriceActivityPoints():int
        {
            return (_SafeStr_6946);
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay

// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4261 = "_-m1a" (String#4020, DoABC#4)
// _SafeStr_4723 = "_-41q" (String#3526, DoABC#4)
// _SafeStr_4892 = "_-P1m" (String#1893, DoABC#4)
// _SafeStr_5094 = "_-p2" (String#8595, DoABC#4)
// _SafeStr_5100 = "_-Zt" (String#10034, DoABC#4)
// _SafeStr_6944 = "_-6W" (String#22174, DoABC#4)
// _SafeStr_6945 = "_-v1b" (String#20433, DoABC#4)
// _SafeStr_6946 = "_-b1l" (String#15939, DoABC#4)
// _SafeStr_8338 = "_-dg" (String#31698, DoABC#4)
// _SafeStr_8339 = "_-22M" (String#34276, DoABC#4)
// _SafeStr_8340 = "_-U1j" (String#36416, DoABC#4)


