// by nota

//com.sulake.core.assets.loaders.BinaryFileLoader

package com.sulake.core.assets.loaders
{
    import flash.net.URLLoader;
    import flash.utils.Timer;
    import flash.net.URLRequest;
    import flash.utils.ByteArray;
    import com.sulake.core.utils._SafeStr_880;
    import flash.events.SecurityErrorEvent;
    import flash.events.Event;
    import flash.events.TimerEvent;

    public class BinaryFileLoader extends _SafeStr_37 implements _SafeStr_36 
    {

        protected var _SafeStr_5275:String;
        protected var _SafeStr_4028:String;
        protected var _SafeStr_3740:Object;
        protected var _SafeStr_6780:URLLoader;
        private var _cacheKey:String = null;
        private var _cacheRevision:String = null;
        private var _fromCache:Boolean = false;
        private var _SafeStr_3820:int;

        public function BinaryFileLoader(_arg_1:String, _arg_2:URLRequest=null, _arg_3:String=null, _arg_4:String=null, _arg_5:ByteArray=null, _arg_6:int=-1)
        {
            var _local_7:* = null;
            super();
            _SafeStr_5275 = ((_arg_2 == null) ? "" : _arg_2.url);
            _SafeStr_4028 = _arg_1;
            _SafeStr_6780 = new URLLoader();
            _SafeStr_6780.dataFormat = "binary";
            _SafeStr_6780.addEventListener("complete", loadEventHandler);
            _SafeStr_6780.addEventListener("unload", loadEventHandler);
            _SafeStr_6780.addEventListener("httpStatus", loadEventHandler);
            _SafeStr_6780.addEventListener("progress", loadEventHandler);
            _SafeStr_6780.addEventListener("ioError", loadEventHandler);
            _SafeStr_6780.addEventListener("securityError", securityErrorEventHandler);
            _cacheKey = _arg_3;
            _cacheRevision = _arg_4;
            _SafeStr_3820 = _arg_6;
            if (((!(_arg_5 == null)) && (_arg_5.length > 0)))
            {
                _fromCache = true;
                _SafeStr_3740 = _arg_5;
                _local_7 = new Timer(10, 1);
                _local_7.addEventListener("timer", timerEventHandler);
                _local_7.start();
                return;
            };
            if (_arg_2 != null)
            {
                load(_arg_2);
            };
        }

        public function get url():String
        {
            return (_SafeStr_5275);
        }

        public function get content():Object
        {
            return ((_SafeStr_3740) ? _SafeStr_3740 : ((_SafeStr_6780) ? _SafeStr_6780.data : null));
        }

        public function get bytes():ByteArray
        {
            var _local_1:* = null;
            if (_SafeStr_6780)
            {
                if ((_SafeStr_6780.data is ByteArray))
                {
                    return (_SafeStr_6780.data);
                };
                if ((_SafeStr_6780.data is String))
                {
                    _local_1 = new ByteArray();
                    _local_1.writeUTFBytes(_SafeStr_6780.data);
                    return (_local_1);
                };
            };
            return (null);
        }

        public function get mimeType():String
        {
            return (_SafeStr_4028);
        }

        public function get bytesLoaded():uint
        {
            return ((_SafeStr_6780) ? _SafeStr_6780.bytesLoaded : 0);
        }

        public function get bytesTotal():uint
        {
            return ((_SafeStr_6780) ? _SafeStr_6780.bytesTotal : 0);
        }

        public function get fromCache():Boolean
        {
            return (_fromCache);
        }

        public function get cacheKey():String
        {
            return (_cacheKey);
        }

        public function get cacheRevision():String
        {
            return (_cacheRevision);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function load(_arg_1:URLRequest):void
        {
            var _local_2:* = null;
            _SafeStr_5275 = _arg_1.url;
            _SafeStr_3740 = null;
            _SafeStr_7999 = 0;
            _SafeStr_6780.dataFormat = "binary";
            _SafeStr_3740 = (_SafeStr_880.get(_arg_1.url) as String);
            if (_SafeStr_3740)
            {
                _local_2 = new Timer(10, 1);
                _local_2.addEventListener("timer", timerEventHandler);
                _local_2.start();
                return;
            };
            _SafeStr_6780.load(_arg_1);
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
                    }
                    catch(e:Error)
                    {
                    };
                    _SafeStr_6780.load(new URLRequest((((_SafeStr_5275 + ((_SafeStr_5275.indexOf("?") == -1) ? "?" : "&")) + "retry=") + _SafeStr_7999)));
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
                _SafeStr_6780.removeEventListener("complete", loadEventHandler);
                _SafeStr_6780.removeEventListener("unload", loadEventHandler);
                _SafeStr_6780.removeEventListener("httpStatus", loadEventHandler);
                _SafeStr_6780.removeEventListener("progress", loadEventHandler);
                _SafeStr_6780.removeEventListener("ioError", loadEventHandler);
                _SafeStr_6780.removeEventListener("securityError", securityErrorEventHandler);
                try
                {
                    _SafeStr_6780.close();
                }
                catch(e:Error)
                {
                };
                _SafeStr_6780 = null;
                _SafeStr_4028 = null;
                _SafeStr_3740 = null;
                _SafeStr_5275 = null;
            };
        }

        private function securityErrorEventHandler(_arg_1:SecurityErrorEvent):void
        {
            if (!_disposed)
            {
                loadEventHandler(_arg_1);
            };
        }

        private function timerEventHandler(_arg_1:TimerEvent):void
        {
            var _local_2:Timer = (_arg_1.target as Timer);
            if (_local_2)
            {
                _local_2.stop();
                _local_2.removeEventListener("timer", timerEventHandler);
            };
            if (!_disposed)
            {
                loadEventHandler(new Event("complete"));
            };
        }


    }
}//package com.sulake.core.assets.loaders

// _SafeStr_36 = "_-26" (String#6685, DoABC#3)
// _SafeStr_37 = "_-81q" (String#7109, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)
// _SafeStr_5275 = "_-J1N" (String#7775, DoABC#3)
// _SafeStr_6780 = "_-Y1l" (String#8851, DoABC#3)
// _SafeStr_7999 = "_-t1Z" (String#10256, DoABC#3)
// _SafeStr_8000 = "_-41F" (String#6805, DoABC#3)
// _SafeStr_880 = "_-o1k" (String#9934, DoABC#3)


