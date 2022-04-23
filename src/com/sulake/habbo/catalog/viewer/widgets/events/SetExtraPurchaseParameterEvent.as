// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent

package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;

    public class SetExtraPurchaseParameterEvent extends Event 
    {

        private var _SafeStr_4118:String;

        public function SetExtraPurchaseParameterEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super("CWE_SET_EXTRA_PARM", _arg_2, _arg_3);
            _SafeStr_4118 = _arg_1;
        }

        public function get parameter():String
        {
            return (_SafeStr_4118);
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets.events

// _SafeStr_4118 = "_-M1c" (String#6160, DoABC#4)


