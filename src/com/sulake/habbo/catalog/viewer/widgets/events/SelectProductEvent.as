// by nota

//com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent

package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;
    import com.sulake.habbo.catalog._SafeStr_3141;

    public class SelectProductEvent extends Event 
    {

        private var _offer:_SafeStr_3141;

        public function SelectProductEvent(_arg_1:_SafeStr_3141, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super("SELECT_PRODUCT", _arg_2, _arg_3);
            _offer = _arg_1;
        }

        public function get offer():_SafeStr_3141
        {
            return (_offer);
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets.events

// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)


