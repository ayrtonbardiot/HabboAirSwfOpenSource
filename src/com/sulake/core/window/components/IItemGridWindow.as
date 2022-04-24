// by nota

//com.sulake.core.window.components.IItemGridWindow

package com.sulake.core.window.components
{
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.utils.IIterable;

    public /*dynamic*/ interface IItemGridWindow extends _SafeStr_3109, IScrollableWindow, IIterable 
    {

        function get spacing():int;
        function set spacing(_arg_1:int):void;
        function set verticalSpacing(_arg_1:int):void;
        function get scaleToFitItems():Boolean;
        function set scaleToFitItems(_arg_1:Boolean):void;
        function get autoArrangeItems():Boolean;
        function set autoArrangeItems(_arg_1:Boolean):void;
        function get resizeOnItemUpdate():Boolean;
        function set resizeOnItemUpdate(_arg_1:Boolean):void;
        function get numColumns():uint;
        function get numRows():uint;
        function get numGridItems():uint;
        function addGridItem(_arg_1:_SafeStr_3109):_SafeStr_3109;
        function addGridItemAt(_arg_1:_SafeStr_3109, _arg_2:uint):_SafeStr_3109;
        function getGridItemAt(_arg_1:uint):_SafeStr_3109;
        function getGridItemByID(_arg_1:uint):_SafeStr_3109;
        function getGridItemByName(_arg_1:String):_SafeStr_3109;
        function getGridItemByTag(_arg_1:String):_SafeStr_3109;
        function getGridItemIndex(_arg_1:_SafeStr_3109):int;
        function removeGridItem(_arg_1:_SafeStr_3109):_SafeStr_3109;
        function removeGridItemAt(_arg_1:int):_SafeStr_3109;
        function setGridItemIndex(_arg_1:_SafeStr_3109, _arg_2:int):void;
        function swapGridItems(_arg_1:_SafeStr_3109, _arg_2:_SafeStr_3109):void;
        function swapGridItemsAt(_arg_1:int, _arg_2:int):void;
        function removeGridItems():void;
        function destroyGridItems():void;
        function set shouldRebuildGridOnResize(_arg_1:Boolean):void;
        function get shouldRebuildGridOnResize():Boolean;
        function rebuildGridStructure():void;
        function set containerResizeToColumns(_arg_1:Boolean):void;
        function get containerResizeToColumns():Boolean;
        function populate(_arg_1:Array):void;

    }
}//package com.sulake.core.window.components

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)


