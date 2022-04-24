// by nota

//com.sulake.core.window.components.IInteractiveWindow

package com.sulake.core.window.components
{
    import com.sulake.core.window._SafeStr_3109;

    public /*dynamic*/ interface IInteractiveWindow extends _SafeStr_3109 
    {

        function set toolTipCaption(_arg_1:String):void;
        function get toolTipCaption():String;
        function set toolTipDelay(_arg_1:uint):void;
        function get toolTipDelay():uint;
        function set toolTipIsDynamic(_arg_1:Boolean):void;
        function get toolTipIsDynamic():Boolean;
        function showToolTip(_arg_1:IToolTipWindow):void;
        function hideToolTip():void;
        function setMouseCursorForState(_arg_1:uint, _arg_2:uint):uint;
        function getMouseCursorByState(_arg_1:uint):uint;

    }
}//package com.sulake.core.window.components

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)


