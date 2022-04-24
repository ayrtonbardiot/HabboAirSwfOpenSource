// by nota

//com.sulake.core.window.components._SafeStr_3284

package com.sulake.core.window.components
{
    import com.sulake.core.window.utils.IIterable;
    import com.sulake.core.window._SafeStr_3109;

    public /*dynamic*/ interface _SafeStr_3284 extends IInteractiveWindow, IIterable 
    {

        function get selection():int;
        function set selection(_arg_1:int):void;
        function get numMenuItems():int;
        function addMenuItem(_arg_1:_SafeStr_3109):_SafeStr_3109;
        function addMenuItemAt(_arg_1:_SafeStr_3109, _arg_2:int):_SafeStr_3109;
        function getMenuItemIndex(_arg_1:_SafeStr_3109):int;
        function getMenuItemAt(_arg_1:int):_SafeStr_3109;
        function removeMenuItem(_arg_1:_SafeStr_3109):_SafeStr_3109;
        function removeMenuItemAt(_arg_1:int):_SafeStr_3109;

    }
}//package com.sulake.core.window.components

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3284 = "_-21F" (String#5819, DoABC#4)


