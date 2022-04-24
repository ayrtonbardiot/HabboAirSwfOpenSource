// by nota

//com.sulake.habbo.navigator._SafeStr_3461

package com.sulake.habbo.navigator
{
    import com.sulake.core.window.components.ITextWindow;

    public class _SafeStr_3461 implements _SafeStr_3435 
    {

        private var _SafeStr_4525:String;
        private var _text:ITextWindow;
        private var _SafeStr_5819:int;


        public function test(_arg_1:int):Boolean
        {
            _text.text = (_SafeStr_4525.substring(0, _arg_1) + "...");
            return (_text.textHeight > _SafeStr_5819);
        }

        public function beforeSearch(_arg_1:String, _arg_2:ITextWindow, _arg_3:int):void
        {
            _SafeStr_4525 = _arg_1;
            _text = _arg_2;
            _SafeStr_5819 = _arg_3;
        }


    }
}//package com.sulake.habbo.navigator

// _SafeStr_3435 = "_-rk" (String#12214, DoABC#4)
// _SafeStr_3461 = "_-v1h" (String#13104, DoABC#4)
// _SafeStr_4525 = "_-8S" (String#1037, DoABC#4)
// _SafeStr_5819 = "_-V9" (String#3780, DoABC#4)


