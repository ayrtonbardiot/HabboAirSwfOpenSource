// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.navigation._SafeStr_3107

package com.sulake.habbo.catalog.navigation
{
    import com.sulake.habbo.catalog.IHabboCatalog;
    import _-AE._SafeStr_1289;
    import __AS3__.vec.Vector;
    import com.sulake.core.window._SafeStr_3109;

    public /*dynamic*/ interface _SafeStr_3107 
    {

        function dispose():void;
        function get catalog():IHabboCatalog;
        function buildCatalogIndex(_arg_1:_SafeStr_1289):void;
        function showIndex():void;
        function activateNode(_arg_1:_SafeStr_3170):void;
        function loadFrontPage():void;
        function get initialized():Boolean;
        function getNodesByOfferId(_arg_1:int, _arg_2:Boolean=false):Vector.<_SafeStr_3170>;
        function getNodeByName(_arg_1:String):_SafeStr_3170;
        function getOptionalNodeByName(_arg_1:String):_SafeStr_3170;
        function getNodeById(_arg_1:int, _arg_2:_SafeStr_3170=null):_SafeStr_3170;
        function openPage(_arg_1:String):void;
        function openPageById(_arg_1:int, _arg_2:int):void;
        function openPageByOfferId(_arg_1:int):void;
        function deactivateCurrentNode():void;
        function filter(_arg_1:String, _arg_2:Array):void;
        function get listTemplate():_SafeStr_3109;
        function getItemTemplate(_arg_1:int):_SafeStr_3109;
        function get isDeepHierarchy():Boolean;

    }
}//package com.sulake.habbo.catalog.navigation

// _SafeStr_1289 = "_-H1D" (String#13342, DoABC#4)
// _SafeStr_3107 = "_-Bx" (String#5257, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3170 = "_-51P" (String#969, DoABC#4)


