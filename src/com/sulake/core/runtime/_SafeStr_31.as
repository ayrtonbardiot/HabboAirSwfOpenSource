// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.runtime._SafeStr_31

package com.sulake.core.runtime
{
    import com.sulake.core.assets._SafeStr_21;
    import flash.events.IEventDispatcher;
    import flash.display.DisplayObjectContainer;
    import flash.net.URLRequest;
    import flash.system.LoaderContext;
    import com.sulake.core.utils._SafeStr_39;
    import flash.system.ApplicationDomain;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import __AS3__.vec.Vector;

    [SecureSWF(rename="true")]
    public /*dynamic*/ interface _SafeStr_31 extends IUnknown 
    {

        function get assets():_SafeStr_21;
        function get events():IEventDispatcher;
        function get root():_SafeStr_31;
        function error(_arg_1:String, _arg_2:Boolean, _arg_3:int=-1, _arg_4:Error=null):void;
        function getLastErrorMessage():String;
        function debug(_arg_1:String):void;
        function getLastDebugMessage():String;
        function warning(_arg_1:String):void;
        function getLastWarningMessage():String;
        function get displayObjectContainer():DisplayObjectContainer;
        function loadFromFile(_arg_1:URLRequest, _arg_2:LoaderContext):_SafeStr_39;
        function attachComponent(_arg_1:_SafeStr_20, _arg_2:Array):void;
        function detachComponent(_arg_1:_SafeStr_20):void;
        function prepareComponent(_arg_1:Class, _arg_2:uint=0, _arg_3:ApplicationDomain=null):IUnknown;
        function prepareAssetLibrary(_arg_1:XML, _arg_2:Class):Boolean;
        function registerUpdateReceiver(_arg_1:_SafeStr_41, _arg_2:uint):void;
        function removeUpdateReceiver(_arg_1:_SafeStr_41):void;
        function toXMLString(_arg_1:uint=0):String;
        function get configuration():_SafeStr_19;
        function set configuration(_arg_1:_SafeStr_19):void;
        function addLinkEventTracker(_arg_1:ILinkEventTracker):void;
        function removeLinkEventTracker(_arg_1:ILinkEventTracker):void;
        function createLinkEvent(_arg_1:String):void;
        function get linkEventTrackers():Vector.<ILinkEventTracker>;

    }
}//package com.sulake.core.runtime

// _SafeStr_19 = "_-01r" (String#6494, DoABC#3)
// _SafeStr_20 = "_-W1o" (String#8724, DoABC#3)
// _SafeStr_21 = "_-61a" (String#6965, DoABC#3)
// _SafeStr_31 = "_-Ee" (String#7513, DoABC#3)
// _SafeStr_39 = "_-N4" (String#8085, DoABC#3)
// _SafeStr_41 = "_-m5" (String#9820, DoABC#3)


