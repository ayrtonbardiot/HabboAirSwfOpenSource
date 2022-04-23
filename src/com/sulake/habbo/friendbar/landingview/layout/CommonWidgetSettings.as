// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.layout.CommonWidgetSettings

package com.sulake.habbo.friendbar.landingview.layout
{
    import com.sulake.core.runtime._SafeStr_19;

    public class CommonWidgetSettings 
    {

        private static const TEXTCOLOR_DEFAULT:uint = 0xFF000000;
        private static const ETCHINGCOLOR_DEFAULT:uint = 0xFFFFFFFF;
        private static const ETCHINGPOSITION_DEFAULT:String = "bottom";
        private static const _SafeStr_8552:String = "landing.view.common.textcolor";
        private static const ETCHINGCOLOR_CONFIGURATION_KEY:String = "landing.view.common.etchingcolor";
        private static const ETCHINGPOSITION_CONFIGURATION_KEY:String = "landing.view.common.etchingposition";

        private var _textColor:uint = 0xFF000000;
        private var _etchingColor:uint = 0xFFFFFFFF;
        private var _etchingPosition:String = "bottom";

        public function CommonWidgetSettings(_arg_1:_SafeStr_19)
        {
            if (_arg_1.getProperty("landing.view.common.textcolor") != "")
            {
                _textColor = parseInt(_arg_1.getProperty("landing.view.common.textcolor"), 16);
            };
            if (_arg_1.getProperty("landing.view.common.etchingcolor") != "")
            {
                _etchingColor = parseInt(_arg_1.getProperty("landing.view.common.etchingcolor"), 16);
            };
            if (_arg_1.getProperty("landing.view.common.etchingposition") != "")
            {
                _etchingPosition = _arg_1.getProperty("landing.view.common.etchingposition");
            };
        }

        public function get isTextColorSet():Boolean
        {
            return (!(_textColor == 0xFF000000));
        }

        public function get isEtchingColorSet():Boolean
        {
            return (!(_etchingColor == 0xFFFFFFFF));
        }

        public function get isEtchingPositionSet():Boolean
        {
            return (!(_etchingPosition == "bottom"));
        }

        public function get textColor():uint
        {
            return (_textColor);
        }

        public function get etchingColor():uint
        {
            return (_etchingColor);
        }

        public function get etchingPosition():String
        {
            return (_etchingPosition);
        }


    }
}//package com.sulake.habbo.friendbar.landingview.layout

// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_8552 = "_-o17" (String#40348, DoABC#4)


