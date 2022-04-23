// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.common._SafeStr_3301

package com.sulake.habbo.avatar.common
{
    import com.sulake.habbo.avatar.HabboAvatarEditor;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.inventory._SafeStr_1708;

    public /*dynamic*/ interface _SafeStr_3301 
    {

        function dispose():void;
        function reset():void;
        function get controller():HabboAvatarEditor;
        function getWindowContainer():_SafeStr_3109;
        function switchCategory(_arg_1:String=""):void;
        function getCategoryData(_arg_1:String):CategoryData;
        function selectPart(_arg_1:String, _arg_2:int):void;
        function selectColor(_arg_1:String, _arg_2:int, _arg_3:int):void;
        function hasClubItemsOverLevel(_arg_1:int):Boolean;
        function hasInvalidSellableItems(_arg_1:_SafeStr_1708):Boolean;
        function stripClubItemsOverLevel(_arg_1:int):Boolean;
        function stripInvalidSellableItems():Boolean;

    }
}//package com.sulake.habbo.avatar.common

// _SafeStr_1708 = "_-Nb" (String#2308, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3301 = "_-f1d" (String#2199, DoABC#4)


