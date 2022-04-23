// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendlist.ITabView

package com.sulake.habbo.friendlist
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;

    public /*dynamic*/ interface ITabView 
    {

        function init(_arg_1:HabboFriendList):void;
        function fillFooter(_arg_1:_SafeStr_3133):void;
        function fillList(_arg_1:IItemListWindow):void;
        function getEntryCount():int;
        function tabClicked(_arg_1:int):void;

    }
}//package com.sulake.habbo.friendlist

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)


