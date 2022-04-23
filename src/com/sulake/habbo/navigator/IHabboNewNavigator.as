// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.IHabboNewNavigator

package com.sulake.habbo.navigator
{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.habbo.help.IHabboHelp;

    public /*dynamic*/ interface IHabboNewNavigator extends IUnknown 
    {

        function open():void;
        function performSearch(_arg_1:String, _arg_2:String="", _arg_3:String=""):void;
        function performTagSearch(_arg_1:String):void;
        function goToRoom(_arg_1:int, _arg_2:String="mainview"):void;
        function get isReady():Boolean;
        function get legacyNavigator():_SafeStr_1696;
        function get habboHelp():IHabboHelp;

    }
}//package com.sulake.habbo.navigator

// _SafeStr_1696 = "_-11U" (String#2010, DoABC#4)


