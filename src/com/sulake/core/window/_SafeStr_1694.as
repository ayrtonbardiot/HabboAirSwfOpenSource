// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window._SafeStr_1694

package com.sulake.core.window
{
    import flash.geom.Rectangle;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.window.components._SafeStr_3216;
    import com.sulake.core.window.utils.INotify;

    public /*dynamic*/ interface _SafeStr_1694 
    {

        function create(_arg_1:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:Rectangle, _arg_6:Function=null, _arg_7:String="", _arg_8:uint=0, _arg_9:Array=null, _arg_10:_SafeStr_3109=null, _arg_11:Array=null, _arg_12:String=""):_SafeStr_3109;
        function destroy(_arg_1:_SafeStr_3109):void;
        function buildFromXML(_arg_1:XML, _arg_2:uint=1, _arg_3:_SafeStr_24=null):_SafeStr_3109;
        function windowToXMLString(_arg_1:_SafeStr_3109):String;
        function getDesktop(_arg_1:uint):_SafeStr_3216;
        function notify(_arg_1:String, _arg_2:String, _arg_3:Function, _arg_4:uint=0):INotify;
        function findWindowByName(_arg_1:String):_SafeStr_3109;
        function findWindowByTag(_arg_1:String):_SafeStr_3109;
        function groupWindowsWithTag(_arg_1:String, _arg_2:Array, _arg_3:int=0):uint;

    }
}//package com.sulake.core.window

// _SafeStr_1694 = "_-41e" (String#5816, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3216 = "_-o1L" (String#2319, DoABC#4)


