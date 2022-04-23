// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.BadgeInfo

package com.sulake.habbo.session
{
    import flash.display.BitmapData;

    public class BadgeInfo 
    {

        private var _SafeStr_4204:BitmapData;
        private var _SafeStr_4676:Boolean;

        public function BadgeInfo(_arg_1:BitmapData, _arg_2:Boolean)
        {
            _SafeStr_4204 = _arg_1;
            _SafeStr_4676 = _arg_2;
        }

        public function get image():BitmapData
        {
            return (_SafeStr_4204);
        }

        public function get placeHolder():Boolean
        {
            return (_SafeStr_4676);
        }


    }
}//package com.sulake.habbo.session

// _SafeStr_4204 = "_-WT" (String#629, DoABC#4)
// _SafeStr_4676 = "_-326" (String#19683, DoABC#4)


