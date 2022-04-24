// by nota

//com.sulake.core.utils._SafeStr_278

package com.sulake.core.utils
{
    import flash.text.Font;
    import flash.utils.getQualifiedClassName;

    public class _SafeStr_278 
    {

        private static const _SafeStr_8076:_SafeStr_24 = new _SafeStr_24();
        private static const _SafeStr_8077:_SafeStr_24 = new _SafeStr_24();

        private static var _SafeStr_8078:Boolean = false;

        {
            init();
        }


        public static function isSystemFont(_arg_1:String):Boolean
        {
            return (!(_SafeStr_8076.getValue(_arg_1) == null));
        }

        public static function isEmbeddedFont(_arg_1:String):Boolean
        {
            return (!(_SafeStr_8077.getValue(_arg_1) == null));
        }

        public static function get systemFonts():_SafeStr_24
        {
            return (_SafeStr_8076);
        }

        public static function get embeddedFonts():_SafeStr_24
        {
            return (_SafeStr_8077);
        }

        public static function registerFont(_arg_1:Class):Font
        {
            var _local_2:* = null;
            var _local_5:int;
            Font.registerFont((_arg_1 as Class));
            var _local_3:String = getQualifiedClassName(_arg_1);
            var _local_6:Array = Font.enumerateFonts(false);
            var _local_4:int = _local_6.length;
            _local_5 = _local_4;
            while (_local_5 > 0)
            {
                _local_2 = _local_6[(_local_5 - 1)];
                if (getQualifiedClassName(_local_2) == _local_3) break;
                _local_5--;
            };
            _SafeStr_8077.add(_local_2.fontName, _local_2);
            return (_local_2);
        }

        private static function init():void
        {
            var _local_2:* = null;
            var _local_1:* = null;
            if (!_SafeStr_8078)
            {
                _local_2 = Font.enumerateFonts(true);
                _local_1 = Font.enumerateFonts(false);
                for each (var _local_3:Font in _local_2)
                {
                    if (_local_1.indexOf(_local_3) == -1)
                    {
                        _SafeStr_8076.add(_local_3.fontName, _local_3);
                    };
                };
                _SafeStr_8078 = true;
            };
        }

        public static function refresh():void
        {
            var _local_1:* = null;
            var _local_5:* = null;
            var _local_3:int;
            var _local_4:Array = Font.enumerateFonts(false);
            var _local_2:int = _local_4.length;
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _local_1 = _local_4[_local_3];
                _local_5 = _SafeStr_8077.getValue(_local_1.fontName);
                if ((((!(_local_5)) || (!(_local_5.fontType == _local_1.fontType))) || (!(_local_5.fontStyle == _local_1.fontStyle))))
                {
                    _SafeStr_8077.add(_local_1.fontName, _local_1);
                };
                _local_3++;
            };
        }


    }
}//package com.sulake.core.utils

// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_278 = "_-3P" (String#6774, DoABC#3)
// _SafeStr_8076 = "_-sd" (String#10228, DoABC#3)
// _SafeStr_8077 = "_-P1D" (String#8229, DoABC#3)
// _SafeStr_8078 = "_-11d" (String#6551, DoABC#3)


