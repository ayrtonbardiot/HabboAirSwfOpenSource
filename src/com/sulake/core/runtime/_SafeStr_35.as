// by nota

//com.sulake.core.runtime._SafeStr_35

package com.sulake.core.runtime
{
    import com.sulake.core.utils._SafeStr_68;
    import flash.utils.Dictionary;
    import flash.events.IEventDispatcher;

    [SecureSWF(rename="true")]
    public /*dynamic*/ interface _SafeStr_35 extends _SafeStr_31, _SafeStr_19 
    {

        function initialize():void;
        function purge():void;
        function hibernate(_arg_1:int, _arg_2:int=1):void;
        function resume():void;
        function get fileProxy():_SafeStr_68;
        function writeDictionaryToProxy(_arg_1:String, _arg_2:Dictionary):Boolean;
        function readDictionaryFromProxy(_arg_1:String):Dictionary;
        function writeXMLToProxy(_arg_1:String, _arg_2:XML):Boolean;
        function readXMLFromProxy(_arg_1:String):XML;
        function readStringFromProxy(_arg_1:String):String;
        function writeStringToProxy(_arg_1:String, _arg_2:String):Boolean;
        function readConfigDocument(_arg_1:XML, _arg_2:IEventDispatcher=null):void;
        function getNumberOfFilesPending():uint;
        function getNumberOfFilesLoaded():uint;
        function setProfilerMode(_arg_1:Boolean):void;
        function get arguments():Dictionary;
        function clearArguments():void;

    }
}//package com.sulake.core.runtime

// _SafeStr_19 = "_-01r" (String#6494, DoABC#3)
// _SafeStr_31 = "_-Ee" (String#7513, DoABC#3)
// _SafeStr_35 = "_-wP" (String#10480, DoABC#3)
// _SafeStr_68 = "_-H1s" (String#7683, DoABC#3)


