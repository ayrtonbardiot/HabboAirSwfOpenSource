// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.IRoomUI

package com.sulake.habbo.ui
{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.core.window.components._SafeStr_3189;
    import flash.events.MouseEvent;

    public /*dynamic*/ interface IRoomUI extends IUnknown 
    {

        function createDesktop(_arg_1:IRoomSession):IRoomDesktop;
        function get chatContainer():_SafeStr_3189;
        function disposeDesktop(_arg_1:String):void;
        function getDesktop(_arg_1:String):IRoomDesktop;
        function getActiveCanvasId(_arg_1:int):int;
        function set visible(_arg_1:Boolean):void;
        function hideWidget(_arg_1:String):void;
        function showGamePlayerName(_arg_1:int, _arg_2:String, _arg_3:uint, _arg_4:int):void;
        function mouseEventPositionHasContextMenu(_arg_1:MouseEvent):Boolean;
        function triggerbottomBarResize():void;

    }
}//package com.sulake.habbo.ui

// _SafeStr_3189 = "_-i1f" (String#1614, DoABC#4)


