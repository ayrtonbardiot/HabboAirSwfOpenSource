// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.mainview.ITransitionalMainViewCtrl

package com.sulake.habbo.navigator.mainview
{
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.habbo.navigator.TextSearchInputs;
    import flash.geom.Point;

    public /*dynamic*/ interface ITransitionalMainViewCtrl 
    {

        function get disposed():Boolean;
        function onNavigatorToolBarIconClick():void;
        function dispose():void;
        function open():void;
        function isOpen():Boolean;
        function close():void;
        function get mainWindow():_SafeStr_3263;
        function refresh():void;
        function reloadRoomList(_arg_1:int):Boolean;
        function startSearch(_arg_1:int, _arg_2:int, _arg_3:String="-1", _arg_4:int=1):void;
        function update(_arg_1:uint):void;
        function get searchInput():TextSearchInputs;
        function openAtPosition(_arg_1:Point):void;
        function get isPhaseOneNavigator():Boolean;

    }
}//package com.sulake.habbo.navigator.mainview

// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)


