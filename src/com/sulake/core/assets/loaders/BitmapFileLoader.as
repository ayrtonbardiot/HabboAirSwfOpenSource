// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.assets.loaders.BitmapFileLoader

package com.sulake.core.assets.loaders
{
    import flash.display.Loader;
    import flash.system.LoaderContext;
    import flash.utils.Timer;
    import flash.events.Event;
    import flash.net.URLRequest;
    import flash.utils.ByteArray;
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.PNGEncoderOptions;
    import flash.system.Security;
    import flash.events.TimerEvent;

    public class BitmapFileLoader extends _SafeStr_37 implements _SafeStr_36 
    {

        protected var _SafeStr_5275:String;
        protected var _SafeStr_4028:String;
        protected var _SafeStr_6780:Loader;
        protected var _SafeStr_8001:LoaderContext;
        private var _cacheKey:String = null;
        private var _cacheRevision:String = null;
        private var _fromCache:Boolean = false;
        private var _SafeStr_3820:int = -1;
        private var _SafeStr_8002:Timer;
        private var _SafeStr_8003:Event;

        public function BitmapFileLoader(_arg_1:String, _arg_2:URLRequest=null, _arg_3:String=null, _arg_4:String=null, _arg_5:ByteArray=null, _arg_6:int=-1)
        {
            _SafeStr_5275 = ((_arg_2 == null) ? "" : _arg_2.url);
            _SafeStr_4028 = _arg_1;
            _SafeStr_6780 = new Loader();
            _SafeStr_8001 = new LoaderContext();
            _SafeStr_8001.checkPolicyFile = true;
            _SafeStr_6780.contentLoaderInfo.addEventListener("complete", completeEventHandler);
            _SafeStr_6780.contentLoaderInfo.addEventListener("unload", loadEventHandler);
            _SafeStr_6780.contentLoaderInfo.addEventListener("httpStatus", loadEventHandler);
            _SafeStr_6780.contentLoaderInfo.addEventListener("progress", loadEventHandler);
            _SafeStr_6780.contentLoaderInfo.addEventListener("ioError", loadEventHandler);
            _SafeStr_6780.contentLoaderInfo.addEventListener("securityError", loadEventHandler);
            _cacheKey = _arg_3;
            _cacheRevision = _arg_4;
            _SafeStr_3820 = _arg_6;
            if (((!(_arg_5 == null)) && (_arg_5.length > 0)))
            {
                _fromCache = true;
                _SafeStr_6780.loadBytes(_arg_5);
            }
            else
            {
                if (((!(_arg_2 == null)) && (!(_arg_2.url == null))))
                {
                    _SafeStr_6780.load(_arg_2, _SafeStr_8001);
                };
            };
        }

        public function get url():String
        {
            return (_SafeStr_5275);
        }

        public function get content():Object
        {
            return ((_SafeStr_6780) ? _SafeStr_6780.content : null);
        }

        public function get bytes():ByteArray
        {
            var _local_2:Bitmap = (content as Bitmap);
            if (_local_2 == null)
            {
                return (null);
            };
            var _local_1:BitmapData = _local_2.bitmapData;
            return (_local_1.encode(_local_1.rect, new PNGEncoderOptions()));
        }

        public function get mimeType():String
        {
            return (_SafeStr_4028);
        }

        public function get bytesLoaded():uint
        {
            return ((_SafeStr_6780) ? _SafeStr_6780.contentLoaderInfo.bytesLoaded : 0);
        }

        public function get bytesTotal():uint
        {
            return ((_SafeStr_6780) ? _SafeStr_6780.contentLoaderInfo.bytesTotal : 0);
        }

        public function get loaderContext():LoaderContext
        {
            return (_SafeStr_8001);
        }

        public function get cacheKey():String
        {
            return (_cacheKey);
        }

        public function get cacheRevision():String
        {
            return (_cacheRevision);
        }

        public function get fromCache():Boolean
        {
            return (_fromCache);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function load(_arg_1:URLRequest):void
        {
            _SafeStr_5275 = _arg_1.url;
            _SafeStr_7999 = 0;
            _SafeStr_6780.load(_arg_1, _SafeStr_8001);
        }

        override protected function retry():Boolean
        {
            if (!_disposed)
            {
                if (++_SafeStr_7999 <= _SafeStr_8000)
                {
                    try
                    {
                        _SafeStr_6780.close();
                        _SafeStr_6780.unload();
                    }
                    catch(e:Error)
                    {
                    };
                    _SafeStr_6780.load(new URLRequest((((_SafeStr_5275 + ((_SafeStr_5275.indexOf("?") == -1) ? "?" : "&")) + "retry=") + _SafeStr_7999)), _SafeStr_8001);
                    return (true);
                };
            };
            return (false);
        }

        override public function dispose():void
        {
            if (!_disposed)
            {
                super.dispose();
                _SafeStr_6780.contentLoaderInfo.removeEventListener("complete", completeEventHandler);
                _SafeStr_6780.contentLoaderInfo.removeEventListener("unload", loadEventHandler);
                _SafeStr_6780.contentLoaderInfo.removeEventListener("httpStatus", loadEventHandler);
                _SafeStr_6780.contentLoaderInfo.removeEventListener("progress", loadEventHandler);
                _SafeStr_6780.contentLoaderInfo.removeEventListener("ioError", loadEventHandler);
                _SafeStr_6780.contentLoaderInfo.removeEventListener("securityError", loadEventHandler);
                if (_SafeStr_8002)
                {
                    _SafeStr_8002.stop();
                    _SafeStr_8002.removeEventListener("timerComplete", securityPollTimerEvent);
                    _SafeStr_8002 = null;
                };
                try
                {
                    _SafeStr_6780.close();
                }
                catch(e)
                {
                };
                _SafeStr_6780.unload();
                _SafeStr_6780 = null;
                _SafeStr_4028 = null;
                _SafeStr_5275 = null;
            };
        }

        private function completeEventHandler(_arg_1:Event):void
        {
            if (_SafeStr_5275 == _SafeStr_6780.contentLoaderInfo.url)
            {
                loadEventHandler(_arg_1);
                return;
            };
            _SafeStr_8003 = _arg_1;
            var _local_3:int = _SafeStr_6780.contentLoaderInfo.url.indexOf("//");
            var _local_2:String = (_SafeStr_6780.contentLoaderInfo.url.slice(0, (_SafeStr_6780.contentLoaderInfo.url.indexOf("/", (_local_3 + 3)) + 1)) + "crossdomain.xml");
            Security.loadPolicyFile(_local_2);
            startSecurityPolling();
        }

        private function securityPollTimerEvent(_arg_1:TimerEvent):void
        {
            if (_SafeStr_6780.contentLoaderInfo.childAllowsParent)
            {
                loadEventHandler(_SafeStr_8003);
            }
            else
            {
                startSecurityPolling();
            };
        }

        private function startSecurityPolling():void
        {
            _SafeStr_8002 = new Timer(250, 1);
            _SafeStr_8002.addEventListener("timerComplete", securityPollTimerEvent);
            _SafeStr_8002.start();
        }


    }
}//package com.sulake.core.assets.loaders

// _SafeStr_36 = "_-26" (String#6685, DoABC#3)
// _SafeStr_37 = "_-81q" (String#7109, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)
// _SafeStr_5275 = "_-J1N" (String#7775, DoABC#3)
// _SafeStr_6780 = "_-Y1l" (String#8851, DoABC#3)
// _SafeStr_7999 = "_-t1Z" (String#10256, DoABC#3)
// _SafeStr_8000 = "_-41F" (String#6805, DoABC#3)
// _SafeStr_8001 = "_-A1G" (String#7217, DoABC#3)
// _SafeStr_8002 = "_-F2" (String#7560, DoABC#3)
// _SafeStr_8003 = "_-E1M" (String#7471, DoABC#3)


