// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.view.utils.TextCropper

package com.sulake.habbo.friendbar.view.utils
{
    import com.sulake.core.runtime._SafeStr_13;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import com.sulake.core.window.components.ITextWindow;

    public class TextCropper implements _SafeStr_13 
    {

        private var _disposed:Boolean = false;
        private var _SafeStr_4533:TextField;
        private var _SafeStr_5893:TextFormat;
        private var _SafeStr_5895:String = "...";
        private var _SafeStr_5894:int = 20;

        public function TextCropper()
        {
            _SafeStr_4533 = new TextField();
            _SafeStr_4533.autoSize = "left";
            _SafeStr_4533.antiAliasType = "advanced";
            _SafeStr_4533.gridFitType = "pixel";
            _SafeStr_5893 = _SafeStr_4533.defaultTextFormat;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                _SafeStr_4533 = null;
                _disposed = true;
            };
        }

        public function crop(_arg_1:ITextWindow):void
        {
            var _local_2:int;
            _SafeStr_5893.font = _arg_1.fontFace;
            _SafeStr_5893.size = _arg_1.fontSize;
            _SafeStr_5893.bold = _arg_1.bold;
            _SafeStr_5893.italic = _arg_1.italic;
            _SafeStr_4533.setTextFormat(_SafeStr_5893);
            _SafeStr_4533.text = _arg_1.getLineText(0);
            var _local_3:int = _SafeStr_4533.textWidth;
            if (_local_3 > _arg_1.width)
            {
                _local_2 = int(_SafeStr_4533.getCharIndexAtPoint((_arg_1.width - _SafeStr_5894), (_SafeStr_4533.textHeight / 2)));
                _arg_1.text = (_arg_1.text.slice(0, _local_2) + _SafeStr_5895);
            };
        }


    }
}//package com.sulake.habbo.friendbar.view.utils

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_4533 = "_-Y1E" (String#1108, DoABC#4)
// _SafeStr_5893 = "_-f1K" (String#6379, DoABC#4)
// _SafeStr_5894 = "_-51J" (String#29512, DoABC#4)
// _SafeStr_5895 = "_-N1b" (String#30626, DoABC#4)


