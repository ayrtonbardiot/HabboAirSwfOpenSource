// by nota

//com.sulake.core.window.components.ITabContextWindow

package com.sulake.core.window.components
{
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.utils.IIterable;
    import com.sulake.core.window._SafeStr_3133;

    public /*dynamic*/ interface ITabContextWindow extends _SafeStr_3109, IIterable 
    {

        function get selector():ISelectorListWindow;
        function get container():_SafeStr_3133;
        function get numTabItems():uint;
        function addTabItem(_arg_1:ITabButtonWindow):ITabButtonWindow;
        function addTabItemAt(_arg_1:ITabButtonWindow, _arg_2:uint):ITabButtonWindow;
        function removeTabItem(_arg_1:ITabButtonWindow):void;
        function getTabItemAt(_arg_1:uint):ITabButtonWindow;
        function getTabItemByName(_arg_1:String):ITabButtonWindow;
        function getTabItemByID(_arg_1:uint):ITabButtonWindow;
        function getTabItemIndex(_arg_1:ITabButtonWindow):uint;

    }
}//package com.sulake.core.window.components

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)


