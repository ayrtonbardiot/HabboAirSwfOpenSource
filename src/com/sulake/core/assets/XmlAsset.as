// by nota

//com.sulake.core.assets.XmlAsset

package com.sulake.core.assets
{
    import flash.utils.ByteArray;

    public class XmlAsset implements ILazyAsset 
    {

        private var _disposed:Boolean = false;
        private var _SafeStr_8025:Object;
        private var _content:XML;
        private var _SafeStr_8024:AssetTypeDeclaration;
        private var _SafeStr_5275:String;

        public function XmlAsset(_arg_1:AssetTypeDeclaration, _arg_2:String=null)
        {
            _SafeStr_8024 = _arg_1;
            _SafeStr_5275 = _arg_2;
        }

        public function get url():String
        {
            return (_SafeStr_5275);
        }

        public function get content():Object
        {
            if (!_content)
            {
                prepareLazyContent();
            };
            return (_content);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get declaration():AssetTypeDeclaration
        {
            return (_SafeStr_8024);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                _disposed = true;
                _content = null;
                _SafeStr_8025 = null;
                _SafeStr_8024 = null;
                _SafeStr_5275 = null;
            };
        }

        public function setUnknownContent(_arg_1:Object):void
        {
            _content = null;
            _SafeStr_8025 = _arg_1;
        }

        public function prepareLazyContent():void
        {
            var _local_1:* = null;
            if ((_SafeStr_8025 is Class))
            {
                _local_1 = (new ((_SafeStr_8025 as Class))() as ByteArray);
                _content = new XML(_local_1.readUTFBytes(_local_1.length));
                return;
            };
            if ((_SafeStr_8025 is ByteArray))
            {
                _local_1 = (_SafeStr_8025 as ByteArray);
                _content = new XML(_local_1.readUTFBytes(_local_1.length));
                return;
            };
            if ((_SafeStr_8025 is String))
            {
                _content = new XML((_SafeStr_8025 as String));
                return;
            };
            if ((_SafeStr_8025 is XML))
            {
                _content = (_SafeStr_8025 as XML);
                return;
            };
            if ((_SafeStr_8025 is XmlAsset))
            {
                _content = XmlAsset(_SafeStr_8025)._content;
                return;
            };
        }

        public function setFromOtherAsset(_arg_1:IAsset):void
        {
            if ((_arg_1 is XmlAsset))
            {
                _content = XmlAsset(_arg_1)._content;
            }
            else
            {
                throw (Error("Provided asset is not of type XmlAsset!"));
            };
        }

        public function setParamsDesc(_arg_1:XMLList):void
        {
        }

        public function toString():String
        {
            var _local_1:String = "XmlAsset";
            _local_1 = (_local_1 + (" _url:" + _SafeStr_5275));
            _local_1 = (_local_1 + (" _content:" + _content));
            return (_local_1 + (" _unknown:" + _SafeStr_8025));
        }


    }
}//package com.sulake.core.assets

// _SafeStr_5275 = "_-J1N" (String#7775, DoABC#3)
// _SafeStr_8024 = "_-p0" (String#9968, DoABC#3)
// _SafeStr_8025 = "_-AK" (String#7278, DoABC#3)


