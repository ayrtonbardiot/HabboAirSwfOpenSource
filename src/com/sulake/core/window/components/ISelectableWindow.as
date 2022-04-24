// by nota

//com.sulake.core.window.components.ISelectableWindow

package com.sulake.core.window.components
{
    import com.sulake.core.window._SafeStr_3109;

    public /*dynamic*/ interface ISelectableWindow extends _SafeStr_3109 
    {

        function get selector():ISelectorWindow;
        function get isSelected():Boolean;
        function set isSelected(_arg_1:Boolean):void;
        function select():Boolean;
        function unselect():Boolean;

    }
}//package com.sulake.core.window.components

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)


