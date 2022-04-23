// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.CutToWidth

package com.sulake.habbo.navigator
{
    import com.sulake.core.window.components.ITextWindow;

    public class CutToWidth implements _SafeStr_3435 
    {

        private var _SafeStr_4525:String;
        private var _text:ITextWindow;
        private var _maxWidth:int;


        public function test(_arg_1:int):Boolean
        {
            _text.text = (_SafeStr_4525.substring(0, _arg_1) + "...");
            return (_text.textWidth > _maxWidth);
        }

        public function beforeSearch(_arg_1:String, _arg_2:ITextWindow, _arg_3:int):void
        {
            _SafeStr_4525 = _arg_1;
            _text = _arg_2;
            _maxWidth = _arg_3;
        }


    }
}//package com.sulake.habbo.navigator

// _SafeStr_3435 = "_-rk" (String#12214, DoABC#4)
// _SafeStr_4525 = "_-8S" (String#1037, DoABC#4)


