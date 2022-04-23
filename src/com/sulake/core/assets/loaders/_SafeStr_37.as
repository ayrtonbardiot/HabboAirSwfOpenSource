// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.assets.loaders._SafeStr_37

package com.sulake.core.assets.loaders
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.runtime._SafeStr_13;
    import flash.events.HTTPStatusEvent;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import flash.events.Event;

    internal class _SafeStr_37 extends EventDispatcherWrapper implements _SafeStr_13 
    {

        public static const _SafeStr_4205:uint = 0;
        public static const IO_ERROR:uint = 1;
        public static const _SafeStr_7998:uint = 2;

        protected var _status:int = 0;
        protected var _SafeStr_7999:int = 0;
        protected var _SafeStr_8000:int = 2;
        protected var _SafeStr_7053:uint = 0;


        public function get errorCode():uint
        {
            return (_SafeStr_7053);
        }

        protected function loadEventHandler(_arg_1:Event):void
        {
            switch (_arg_1.type)
            {
                case "httpStatus":
                    _status = HTTPStatusEvent(_arg_1).status;
                    dispatchEvent(new AssetLoaderEvent("AssetLoaderEventStatus", _status));
                    return;
                case "complete":
                    dispatchEvent(new AssetLoaderEvent("AssetLoaderEventComplete", _status));
                    return;
                case "unload":
                    dispatchEvent(new AssetLoaderEvent("AssetLoaderEventUnload", _status));
                    return;
                case "open":
                    dispatchEvent(new AssetLoaderEvent("AssetLoaderEventOpen", _status));
                    return;
                case "progress":
                    dispatchEvent(new AssetLoaderEvent("AssetLoaderEventProgress", _status));
                    return;
                case "ioError":
                    _SafeStr_7053 = 1;
                    if (!retry())
                    {
                        dispatchEvent(new AssetLoaderEvent("AssetLoaderEventError", _status));
                    };
                    return;
                case "securityError":
                    _SafeStr_7053 = 2;
                    if (!retry())
                    {
                        dispatchEvent(new AssetLoaderEvent("AssetLoaderEventError", _status));
                    };
                    return;
                default:
                    return;
            };
        }

        protected function retry():Boolean
        {
            return (false);
        }


    }
}//package com.sulake.core.assets.loaders

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_37 = "_-81q" (String#7109, DoABC#3)
// _SafeStr_4205 = "_-51E" (String#6877, DoABC#3)
// _SafeStr_7053 = "_-66" (String#6980, DoABC#3)
// _SafeStr_7998 = "_-Y18" (String#8830, DoABC#3)
// _SafeStr_7999 = "_-t1Z" (String#10256, DoABC#3)
// _SafeStr_8000 = "_-41F" (String#6805, DoABC#3)


