// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.notifications.singular.HabboNotificationItemStyle

package com.sulake.habbo.notifications.singular
{
    import flash.display.BitmapData;
    import com.sulake.core.utils._SafeStr_24;

    public class HabboNotificationItemStyle 
    {

        private var _icon:BitmapData;
        private var _disposeIcon:Boolean;
        private var _SafeStr_5933:String;
        private var _SafeStr_5932:String;
        private var _iconAssetUri:String;

        public function HabboNotificationItemStyle(_arg_1:_SafeStr_24, _arg_2:BitmapData, _arg_3:String, _arg_4:Boolean, _arg_5:String)
        {
            _iconAssetUri = _arg_3;
            if (((!(_arg_1 == null)) && (_arg_3 == null)))
            {
                _icon = _arg_1["icon"];
                _SafeStr_5932 = _arg_1["internallink"];
            };
            if (_arg_2 != null)
            {
                _icon = _arg_2;
                _disposeIcon = _arg_4;
            }
            else
            {
                _disposeIcon = false;
            };
            _SafeStr_5933 = _arg_5;
        }

        public function dispose():void
        {
            if (((_disposeIcon) && (!(_icon == null))))
            {
                _icon.dispose();
                _icon = null;
            };
        }

        public function get icon():BitmapData
        {
            return (_icon);
        }

        public function get internalLink():String
        {
            return (_SafeStr_5932);
        }

        public function set internalLink(_arg_1:String):void
        {
            _SafeStr_5932 = _arg_1;
        }

        public function get iconSrc():String
        {
            return (_SafeStr_5933);
        }

        public function get iconAssetUri():String
        {
            return (_iconAssetUri);
        }


    }
}//package com.sulake.habbo.notifications.singular

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_5932 = "_-N1V" (String#12767, DoABC#4)
// _SafeStr_5933 = "_-612" (String#19963, DoABC#4)


