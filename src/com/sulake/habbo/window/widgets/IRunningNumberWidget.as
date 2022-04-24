// by nota

//com.sulake.habbo.window.widgets.IRunningNumberWidget

package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window._SafeStr_3179;

    public /*dynamic*/ interface IRunningNumberWidget extends _SafeStr_3179 
    {

        function get number():int;
        function set number(_arg_1:int):void;
        function set initialNumber(_arg_1:int):void;
        function get digits():uint;
        function set digits(_arg_1:uint):void;
        function get colorStyle():int;
        function set colorStyle(_arg_1:int):void;
        function get updateFrequency():int;
        function set updateFrequency(_arg_1:int):void;

    }
}//package com.sulake.habbo.window.widgets

// _SafeStr_3179 = "_-wC" (String#2737, DoABC#4)


