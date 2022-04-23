// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.assets.loaders._SafeStr_36

package com.sulake.core.assets.loaders
{
    import flash.events.IEventDispatcher;
    import com.sulake.core.runtime._SafeStr_13;
    import flash.utils.ByteArray;
    import flash.net.URLRequest;

    public /*dynamic*/ interface _SafeStr_36 extends IEventDispatcher, _SafeStr_13 
    {

        function get url():String;
        function get content():Object;
        function get bytes():ByteArray;
        function get mimeType():String;
        function get bytesLoaded():uint;
        function get bytesTotal():uint;
        function get errorCode():uint;
        function get cacheKey():String;
        function get cacheRevision():String;
        function get fromCache():Boolean;
        function get id():int;
        function load(_arg_1:URLRequest):void;

    }
}//package com.sulake.core.assets.loaders

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_36 = "_-26" (String#6685, DoABC#3)


