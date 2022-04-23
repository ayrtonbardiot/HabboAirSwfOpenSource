// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.inventory.IInventoryModel

package com.sulake.habbo.inventory
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;

    public /*dynamic*/ interface IInventoryModel extends _SafeStr_13 
    {

        function getWindowContainer():_SafeStr_3133;
        function requestInitialization():void;
        function categorySwitch(_arg_1:String):void;
        function subCategorySwitch(_arg_1:String):void;
        function closingInventoryView():void;
        function updateView():void;
        function selectItemById(_arg_1:String):void;

    }
}//package com.sulake.habbo.inventory

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)


