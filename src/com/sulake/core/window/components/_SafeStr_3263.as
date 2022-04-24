// by nota

//com.sulake.core.window.components._SafeStr_3263

package com.sulake.core.window.components
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.utils.IMargins;

    public /*dynamic*/ interface _SafeStr_3263 extends _SafeStr_3133 
    {

        function get title():ILabelWindow;
        function get header():_SafeStr_3251;
        function get content():_SafeStr_3133;
        function get margins():IMargins;
        function get scaler():IScalerWindow;
        function resizeToFitContent():void;
        function set helpButtonAction(_arg_1:Function):void;
        function get helpPage():String;
        function set helpPage(_arg_1:String):void;

    }
}//package com.sulake.core.window.components

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3251 = "_-xO" (String#5610, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)


