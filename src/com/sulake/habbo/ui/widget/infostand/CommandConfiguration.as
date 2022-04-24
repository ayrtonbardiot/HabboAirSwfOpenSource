// by nota

//com.sulake.habbo.ui.widget.infostand.CommandConfiguration

package com.sulake.habbo.ui.widget.infostand
{
    import flash.utils.Dictionary;

    public class CommandConfiguration 
    {

        private var _SafeStr_5432:Array;
        private var _SafeStr_5506:Dictionary = new Dictionary();

        public function CommandConfiguration(_arg_1:Array, _arg_2:Array)
        {
            var _local_3:int;
            var _local_4:int;
            super();
            _SafeStr_5432 = _arg_1;
            while (_local_3 < _arg_2.length)
            {
                _local_4 = _arg_2[_local_3];
                _SafeStr_5506[_local_4] = true;
                _local_3++;
            };
        }

        public function get allCommandIds():Array
        {
            return (_SafeStr_5432);
        }

        public function isEnabled(_arg_1:int):Boolean
        {
            return (!(_SafeStr_5506[_arg_1] == null));
        }


    }
}//package com.sulake.habbo.ui.widget.infostand

// _SafeStr_5432 = "_-lu" (String#8756, DoABC#4)
// _SafeStr_5506 = "_-M1R" (String#4674, DoABC#4)


