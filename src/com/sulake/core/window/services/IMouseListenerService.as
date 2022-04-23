// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.services.IMouseListenerService

package com.sulake.core.window.services
{
    import com.sulake.core.window._SafeStr_3109;

    public /*dynamic*/ interface IMouseListenerService 
    {

        function get eventTypes():Array;
        function get areaLimit():uint;
        function set areaLimit(_arg_1:uint):void;
        function dispose():void;
        function begin(_arg_1:_SafeStr_3109, _arg_2:uint=0):_SafeStr_3109;
        function end(_arg_1:_SafeStr_3109):_SafeStr_3109;

    }
}//package com.sulake.core.window.services

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)


