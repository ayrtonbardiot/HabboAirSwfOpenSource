// by nota

//com.sulake.core.window.components.ISelectorWindow

package com.sulake.core.window.components
{
    import com.sulake.core.window._SafeStr_3109;

    public /*dynamic*/ interface ISelectorWindow extends _SafeStr_3109 
    {

        function get numSelectables():uint;
        function getSelected():ISelectableWindow;
        function setSelected(_arg_1:ISelectableWindow):void;
        function addSelectable(_arg_1:ISelectableWindow):ISelectableWindow;
        function addSelectableAt(_arg_1:ISelectableWindow, _arg_2:int):ISelectableWindow;
        function getSelectableAt(_arg_1:int):ISelectableWindow;
        function getSelectableByID(_arg_1:uint):ISelectableWindow;
        function getSelectableByTag(_arg_1:String):ISelectableWindow;
        function getSelectableByName(_arg_1:String):ISelectableWindow;
        function getSelectableIndex(_arg_1:ISelectableWindow):int;
        function removeSelectable(_arg_1:ISelectableWindow):ISelectableWindow;

    }
}//package com.sulake.core.window.components

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)


