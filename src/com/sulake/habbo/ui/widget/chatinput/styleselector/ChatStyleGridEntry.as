// by nota

//com.sulake.habbo.ui.widget.chatinput.styleselector.ChatStyleGridEntry

package com.sulake.habbo.ui.widget.chatinput.styleselector
{
    import flash.display.BitmapData;

    public class ChatStyleGridEntry 
    {

        private var _SafeStr_3820:int;
        private var _bitmap:BitmapData;

        public function ChatStyleGridEntry(_arg_1:int, _arg_2:BitmapData)
        {
            _SafeStr_3820 = _arg_1;
            _bitmap = _arg_2;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get bitmap():BitmapData
        {
            return (_bitmap);
        }


    }
}//package com.sulake.habbo.ui.widget.chatinput.styleselector

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)


