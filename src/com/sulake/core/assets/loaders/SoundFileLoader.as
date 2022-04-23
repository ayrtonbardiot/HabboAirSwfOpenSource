// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.assets.loaders.SoundFileLoader

package com.sulake.core.assets.loaders
{
    import flash.media.Sound;
    import flash.net.URLRequest;
    import flash.utils.ByteArray;

    public class SoundFileLoader extends _SafeStr_37 implements _SafeStr_36 
    {

        protected var _SafeStr_5275:String;
        protected var _SafeStr_4028:String;
        protected var _SafeStr_8004:Sound;
        private var _cacheKey:String;
        private var _cacheRevision:String;
        private var _fromCache:Boolean = false;
        private var _SafeStr_3820:int;

        public function SoundFileLoader(_arg_1:String, _arg_2:URLRequest=null, _arg_3:String=null, _arg_4:String=null, _arg_5:ByteArray=null, _arg_6:int=-1)
        {
            _SafeStr_5275 = ((_arg_2 == null) ? "" : _arg_2.url);
            _SafeStr_4028 = _arg_1;
            _SafeStr_8004 = new Sound(null, null);
            _SafeStr_8004.addEventListener("id3", loadEventHandler);
            _SafeStr_8004.addEventListener("open", loadEventHandler);
            _SafeStr_8004.addEventListener("complete", loadEventHandler);
            _SafeStr_8004.addEventListener("ioError", loadEventHandler);
            _SafeStr_8004.addEventListener("progress", loadEventHandler);
            _cacheKey = _arg_3;
            _cacheRevision = _arg_4;
            _SafeStr_3820 = _arg_6;
            if (((!(_arg_5 == null)) && (_arg_5.length > 0)))
            {
                _fromCache = true;
                _SafeStr_8004.loadPCMFromByteArray(_arg_5, _arg_5.length);
            }
            else
            {
                if (_arg_2 != null)
                {
                    this.load(_arg_2);
                };
            };
        }

        public function get url():String
        {
            return (_SafeStr_5275);
        }

        public function get content():Object
        {
            return (_SafeStr_8004);
        }

        public function get bytes():ByteArray
        {
            var _local_1:ByteArray = new ByteArray();
            _SafeStr_8004.extract(_local_1, _SafeStr_8004.length);
            return (_local_1);
        }

        public function get mimeType():String
        {
            return (_SafeStr_4028);
        }

        public function get bytesLoaded():uint
        {
            return ((_SafeStr_8004) ? _SafeStr_8004.bytesLoaded : 0);
        }

        public function get bytesTotal():uint
        {
            return ((_SafeStr_8004) ? _SafeStr_8004.bytesTotal : 0);
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

        override public function dispose():void
        {
            if (!disposed)
            {
                _SafeStr_8004.removeEventListener("id3", loadEventHandler);
                _SafeStr_8004.removeEventListener("open", loadEventHandler);
                _SafeStr_8004.removeEventListener("complete", loadEventHandler);
                _SafeStr_8004.removeEventListener("ioError", loadEventHandler);
                _SafeStr_8004.removeEventListener("progress", loadEventHandler);
                _SafeStr_8004 = null;
                _SafeStr_4028 = null;
                _SafeStr_5275 = null;
                super.dispose();
            };
        }

        public function load(_arg_1:URLRequest):void
        {
            _SafeStr_5275 = _arg_1.url;
            _SafeStr_8004.load(_arg_1, null);
        }


    }
}//package com.sulake.core.assets.loaders

// _SafeStr_36 = "_-26" (String#6685, DoABC#3)
// _SafeStr_37 = "_-81q" (String#7109, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)
// _SafeStr_5275 = "_-J1N" (String#7775, DoABC#3)
// _SafeStr_8004 = "_-56" (String#6903, DoABC#3)


