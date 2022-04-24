// by nota

//com.sulake.core.window.components.IItemListWindow

package com.sulake.core.window.components
{
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.utils.IIterable;

    public /*dynamic*/ interface IItemListWindow extends _SafeStr_3109, IScrollableWindow, IIterable 
    {

        function get spacing():int;
        function set spacing(_arg_1:int):void;
        function get scaleToFitItems():Boolean;
        function set scaleToFitItems(_arg_1:Boolean):void;
        function get autoArrangeItems():Boolean;
        function set autoArrangeItems(_arg_1:Boolean):void;
        function get resizeOnItemUpdate():Boolean;
        function set resizeOnItemUpdate(_arg_1:Boolean):void;
        function get numListItems():int;
        function addListItem(_arg_1:_SafeStr_3109):_SafeStr_3109;
        function addListItemAt(_arg_1:_SafeStr_3109, _arg_2:uint):_SafeStr_3109;
        function getListItemAt(_arg_1:uint):_SafeStr_3109;
        function getListItemByID(_arg_1:uint):_SafeStr_3109;
        function getListItemByName(_arg_1:String):_SafeStr_3109;
        function getListItemByTag(_arg_1:String):_SafeStr_3109;
        function getListItemIndex(_arg_1:_SafeStr_3109):int;
        function removeListItem(_arg_1:_SafeStr_3109):_SafeStr_3109;
        function removeListItemAt(_arg_1:int):_SafeStr_3109;
        function setListItemIndex(_arg_1:_SafeStr_3109, _arg_2:int):void;
        function swapListItems(_arg_1:_SafeStr_3109, _arg_2:_SafeStr_3109):void;
        function groupListItemsWithID(_arg_1:uint, _arg_2:Array, _arg_3:int=0):uint;
        function groupListItemsWithTag(_arg_1:String, _arg_2:Array, _arg_3:int=0):uint;
        function swapListItemsAt(_arg_1:int, _arg_2:int):void;
        function removeListItems():void;
        function destroyListItems():void;
        function arrangeListItems():void;
        function populate(_arg_1:Array):void;
        function stopDragging():void;
        function set disableAutodrag(_arg_1:Boolean):void;
        function get isPartOfGridWindow():Boolean;
        function set isPartOfGridWindow(_arg_1:Boolean):void;
        function get scrollableWindow():_SafeStr_3109;

    }
}//package com.sulake.core.window.components

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)


