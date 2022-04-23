// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.assets.loaders.ZipFileLoader

package com.sulake.core.assets.loaders
{
    import flash.net.URLStream;
    import flash.utils.ByteArray;
    import flash.utils.Timer;
    import flash.net.URLRequest;
    import flash.events.Event;
    import flash.events.TimerEvent;

    public class ZipFileLoader extends _SafeStr_37 implements _SafeStr_36 
    {

        protected var _SafeStr_5275:String;
        protected var _SafeStr_4028:String;
        protected var _SafeStr_8005:URLStream;
        protected var _SafeStr_3740:ByteArray;
        private var _cacheKey:String;
        private var _cacheRevision:String;
        private var _fromCache:Boolean = false;
        private var _SafeStr_3820:int;

        public function ZipFileLoader(_arg_1:String, _arg_2:URLRequest=null, _arg_3:String=null, _arg_4:String=null, _arg_5:ByteArray=null, _arg_6:int=-1)
        {
            var _local_7:* = null;
            super();
            _SafeStr_5275 = ((_arg_2 == null) ? "" : _arg_2.url);
            _SafeStr_4028 = _arg_1;
            _SafeStr_8005 = new URLStream();
            _SafeStr_8005.addEventListener("complete", loadEventHandler);
            _SafeStr_8005.addEventListener("httpStatus", loadEventHandler);
            _SafeStr_8005.addEventListener("ioError", loadEventHandler);
            _SafeStr_8005.addEventListener("open", loadEventHandler);
            _SafeStr_8005.addEventListener("progress", loadEventHandler);
            _SafeStr_8005.addEventListener("securityError", loadEventHandler);
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
                this.load(_arg_2);
            };
        }

        public function get url():String
        {
            return (_SafeStr_5275);
        }

        public function get content():Object
        {
            return ((_SafeStr_3740) ? _SafeStr_3740 : _SafeStr_8005);
        }

        public function get bytes():ByteArray
        {
            if (_SafeStr_3740)
            {
                return (_SafeStr_3740);
            };
            var _local_1:ByteArray = new ByteArray();
            _SafeStr_8005.readBytes(_local_1);
            return (_local_1);
        }

        public function get mimeType():String
        {
            return (_SafeStr_4028);
        }

        public function get bytesLoaded():uint
        {
            return (_SafeStr_8005.bytesAvailable);
        }

        public function get bytesTotal():uint
        {
            return (_SafeStr_8005.bytesAvailable);
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
            _SafeStr_8005.load(_arg_1);
        }

        override public function dispose():void
        {
            if (!_disposed)
            {
                super.dispose();
                _SafeStr_8005.removeEventListener("complete", loadEventHandler);
                _SafeStr_8005.removeEventListener("httpStatus", loadEventHandler);
                _SafeStr_8005.removeEventListener("ioError", loadEventHandler);
                _SafeStr_8005.removeEventListener("open", loadEventHandler);
                _SafeStr_8005.removeEventListener("progress", loadEventHandler);
                _SafeStr_8005.removeEventListener("securityError", loadEventHandler);
                _SafeStr_8005.close();
                _SafeStr_8005 = null;
                _SafeStr_4028 = null;
                _SafeStr_5275 = null;
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
// _SafeStr_8005 = "_-H1V" (String#7671, DoABC#3)


