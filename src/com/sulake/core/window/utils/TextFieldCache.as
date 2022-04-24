// by nota

//com.sulake.core.window.utils.TextFieldCache

package com.sulake.core.window.utils
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.utils._SafeStr_24;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import com.sulake.core.utils._SafeStr_278;
    import flash.events.Event;

    public class TextFieldCache implements _SafeStr_13 
    {

        private static var _textFieldCache:_SafeStr_24 = new _SafeStr_24();
        private static var _SafeStr_3793:TextFieldCache = new (TextFieldCache)();

        private var _disposed:Boolean = false;

        public function TextFieldCache()
        {
            if (_SafeStr_3793 == null)
            {
                _SafeStr_3371.events.addEventListener("change", onTextStyleChanged);
            };
        }

        public static function getTextFieldByStyle(_arg_1:_SafeStr_3350):TextField
        {
            var _local_2:TextField = _textFieldCache[_arg_1.name];
            if (_local_2)
            {
                return (_local_2);
            };
            _local_2 = new TextField();
            var _local_3:TextFormat = _local_2.defaultTextFormat;
            if (!_arg_1)
            {
                _arg_1 = _SafeStr_3371.getStyle("regular");
            };
            _local_3.font = _arg_1.fontFamily;
            _local_3.size = _arg_1.fontSize;
            _local_3.color = _arg_1.color;
            _local_3.bold = ((_arg_1.fontWeight == "bold") ? true : null);
            _local_3.italic = ((_arg_1.fontStyle == "italic") ? true : null);
            _local_3.underline = ((_arg_1.textDecoration == "underline") ? true : null);
            _local_3.indent = _arg_1.textIndent;
            _local_3.leading = _arg_1.leading;
            _local_3.kerning = _arg_1.kerning;
            _local_3.letterSpacing = _arg_1.letterSpacing;
            _local_2.antiAliasType = ((_arg_1.antiAliasType == "normal") ? "normal" : "advanced");
            _local_2.gridFitType = "pixel";
            _local_2.sharpness = ((_arg_1.sharpness) ? (_arg_1.sharpness as int) : 0);
            _local_2.thickness = ((_arg_1.thickness) ? (_arg_1.thickness as int) : 0);
            if (!_arg_1.fontWeight)
            {
                _local_3.bold = false;
            };
            if (!_arg_1.fontStyle)
            {
                _local_3.italic = false;
            };
            if (!_arg_1.textDecoration)
            {
                _local_3.underline = false;
            };
            if (!_arg_1.textIndent)
            {
                _local_3.indent = 0;
            };
            if (!_arg_1.leading)
            {
                _local_3.leading = 0;
            };
            if (!_arg_1.kerning)
            {
                _local_3.kerning = false;
            };
            if (!_arg_1.letterSpacing)
            {
                _local_3.letterSpacing = 0;
            };
            if (!_arg_1.antiAliasType)
            {
                _local_2.antiAliasType = "advanced";
            };
            _local_2.autoSize = "left";
            _local_2.setTextFormat(_local_3);
            _local_2.embedFonts = _SafeStr_278.isEmbeddedFont(_local_3.font);
            _local_2.defaultTextFormat = _local_3;
            _textFieldCache[_arg_1.name] = _local_2;
            return (_local_2);
        }

        public static function getTextFieldByStyleName(_arg_1:String):TextField
        {
            var _local_2:_SafeStr_3350 = _SafeStr_3371.getStyle(_arg_1);
            if (!_local_2)
            {
                return (null);
            };
            return (getTextFieldByStyle(_local_2));
        }


        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            _SafeStr_3371.events.removeEventListener("change", onTextStyleChanged);
            _textFieldCache.reset();
            _SafeStr_3793 = null;
            _disposed = true;
        }

        private function onTextStyleChanged(_arg_1:Event):void
        {
            _textFieldCache.reset();
        }


    }
}//package com.sulake.core.window.utils

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_278 = "_-3P" (String#22296, DoABC#4)
// _SafeStr_3350 = "_-O1m" (String#1615, DoABC#4)
// _SafeStr_3371 = "_-b2" (String#2781, DoABC#4)
// _SafeStr_3793 = "_-z1c" (String#5439, DoABC#4)


