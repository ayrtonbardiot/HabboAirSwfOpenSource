// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window._SafeStr_3160

package com.sulake.core.window
{
    import com.sulake.core.window.services.IInternalWindowServices;
    import com.sulake.core.window.utils._SafeStr_3319;
    import com.sulake.core.window.components._SafeStr_3216;
    import flash.geom.Rectangle;

    public /*dynamic*/ interface _SafeStr_3160 
    {

        function getWindowServices():IInternalWindowServices;
        function getWindowParser():_SafeStr_3319;
        function getDesktopWindow():_SafeStr_3216;
        function registerLocalizationListener(_arg_1:String, _arg_2:_SafeStr_3109):void;
        function removeLocalizationListener(_arg_1:String, _arg_2:_SafeStr_3109):void;
        function findWindowByName(_arg_1:String):_SafeStr_3109;
        function findWindowByTag(_arg_1:String):_SafeStr_3109;
        function groupChildrenWithTag(_arg_1:String, _arg_2:Array, _arg_3:int=0):uint;
        function create(_arg_1:String, _arg_2:String, _arg_3:uint, _arg_4:uint, _arg_5:uint, _arg_6:Rectangle, _arg_7:Function, _arg_8:_SafeStr_3109, _arg_9:uint, _arg_10:Array=null, _arg_11:String="", _arg_12:Array=null):_SafeStr_3109;
        function destroy(_arg_1:_SafeStr_3109):Boolean;
        function invalidate(_arg_1:_SafeStr_3109, _arg_2:Rectangle, _arg_3:uint):void;
        function getLastError():Error;
        function getLastErrorCode():int;
        function flushError():void;
        function addMouseEventTracker(_arg_1:IInputEventTracker):void;
        function removeMouseEventTracker(_arg_1:IInputEventTracker):void;

    }
}//package com.sulake.core.window

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3160 = "_-dQ" (String#2821, DoABC#4)
// _SafeStr_3216 = "_-o1L" (String#2319, DoABC#4)
// _SafeStr_3319 = "_-Kx" (String#11293, DoABC#4)


