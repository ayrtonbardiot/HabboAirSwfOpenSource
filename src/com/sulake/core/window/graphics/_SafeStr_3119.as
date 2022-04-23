// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.graphics._SafeStr_3119

package com.sulake.core.window.graphics
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3109;
    import flash.geom.Rectangle;
    import com.sulake.core.window._SafeStr_3160;
    import flash.display.BitmapData;

    public /*dynamic*/ interface _SafeStr_3119 extends _SafeStr_13 
    {

        function set debug(_arg_1:Boolean):void;
        function render():void;
        function addToRenderQueue(_arg_1:_SafeStr_3109, _arg_2:Rectangle, _arg_3:uint):void;
        function flushRenderQueue():void;
        function invalidate(_arg_1:_SafeStr_3160, _arg_2:Rectangle):void;
        function getDrawBufferForRenderable(_arg_1:_SafeStr_3109):BitmapData;
        function purge(_arg_1:_SafeStr_3109=null, _arg_2:Boolean=true):void;

    }
}//package com.sulake.core.window.graphics

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3119 = "_-y1F" (String#6445, DoABC#4)
// _SafeStr_3160 = "_-dQ" (String#2821, DoABC#4)


