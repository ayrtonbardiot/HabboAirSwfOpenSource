// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.services.IToolTipAgentService

package com.sulake.core.window.services
{
    import com.sulake.core.window._SafeStr_3109;

    public /*dynamic*/ interface IToolTipAgentService 
    {

        function dispose():void;
        function begin(_arg_1:_SafeStr_3109, _arg_2:uint=0):_SafeStr_3109;
        function end(_arg_1:_SafeStr_3109):_SafeStr_3109;
        function updateCaption(_arg_1:_SafeStr_3109):void;

    }
}//package com.sulake.core.window.services

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)


