// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.view.tabs.ITab

package com.sulake.habbo.friendbar.view.tabs
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;

    public /*dynamic*/ interface ITab extends _SafeStr_13 
    {

        function get window():_SafeStr_3133;
        function get selected():Boolean;
        function get recycled():Boolean;
        function select(_arg_1:Boolean):void;
        function deselect(_arg_1:Boolean):void;
        function recycle():void;

    }
}//package com.sulake.habbo.friendbar.view.tabs

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)


