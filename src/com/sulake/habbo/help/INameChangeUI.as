// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.help.INameChangeUI

package com.sulake.habbo.help
{
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.window._SafeStr_3109;

    public /*dynamic*/ interface INameChangeUI 
    {

        function get localization():_SafeStr_18;
        function get assets():_SafeStr_21;
        function get myName():String;
        function buildXmlWindow(_arg_1:String, _arg_2:uint=1):_SafeStr_3109;
        function checkName(_arg_1:String):void;
        function changeName(_arg_1:String):void;
        function showView():void;
        function hideView():void;

    }
}//package com.sulake.habbo.help

// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)


