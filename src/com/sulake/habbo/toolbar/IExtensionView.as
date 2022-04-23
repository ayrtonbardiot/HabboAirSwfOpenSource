// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.toolbar.IExtensionView

package com.sulake.habbo.toolbar
{
    import com.sulake.core.window._SafeStr_3109;

    public /*dynamic*/ interface IExtensionView 
    {

        function set visible(_arg_1:Boolean):void;
        function get visible():Boolean;
        function get screenHeight():uint;
        function attachExtension(_arg_1:String, _arg_2:_SafeStr_3109, _arg_3:int=-1, _arg_4:Array=null):void;
        function detachExtension(_arg_1:String):void;
        function hasExtension(_arg_1:String):Boolean;
        function set extraMargin(_arg_1:int):void;
        function get extraMargin():int;
        function refreshItemWindow():void;

    }
}//package com.sulake.habbo.toolbar

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)


