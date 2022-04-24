// by nota

//com.sulake.core.runtime._SafeStr_19

package com.sulake.core.runtime
{
    import flash.utils.Dictionary;

    [SecureSWF(rename="true")]
    public /*dynamic*/ interface _SafeStr_19 extends IUnknown 
    {

        function propertyExists(_arg_1:String):Boolean;
        function getProperty(_arg_1:String, _arg_2:Dictionary=null):String;
        function setProperty(_arg_1:String, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false):void;
        function getBoolean(_arg_1:String):Boolean;
        function getInteger(_arg_1:String, _arg_2:int):int;
        function interpolate(_arg_1:String):String;
        function updateUrlProtocol(_arg_1:String):String;

    }
}//package com.sulake.core.runtime

// _SafeStr_19 = "_-01r" (String#6494, DoABC#3)


