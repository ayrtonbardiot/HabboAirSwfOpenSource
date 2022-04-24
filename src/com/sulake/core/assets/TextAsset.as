// by nota

//com.sulake.core.assets.TextAsset

package com.sulake.core.assets
{
    import flash.utils.ByteArray;

    public class TextAsset implements IAsset 
    {

        private var _disposed:Boolean = false;
        private var _content:String = "";
        private var _SafeStr_8024:AssetTypeDeclaration;
        private var _SafeStr_5275:String;

        public function TextAsset(_arg_1:AssetTypeDeclaration, _arg_2:String=null)
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
                _SafeStr_8024 = null;
                _SafeStr_5275 = null;
            };
        }

        public function setUnknownContent(_arg_1:Object):void
        {
            var _local_2:* = null;
            if ((_arg_1 is String))
            {
                _content = (_arg_1 as String);
                return;
            };
            if ((_arg_1 is Class))
            {
                _local_2 = (new ((_arg_1 as Class))() as ByteArray);
                _content = _local_2.readUTFBytes(_local_2.length);
                return;
            };
            if ((_arg_1 is ByteArray))
            {
                _local_2 = (_arg_1 as ByteArray);
                _content = _local_2.readUTFBytes(_local_2.length);
                return;
            };
            if ((_arg_1 is TextAsset))
            {
                _content = TextAsset(_arg_1)._content;
                return;
            };
            _content = ((_arg_1) ? _arg_1.toString() : "");
        }

        public function setFromOtherAsset(_arg_1:IAsset):void
        {
            if ((_arg_1 is TextAsset))
            {
                _content = TextAsset(_arg_1)._content;
            }
            else
            {
                throw (Error("Provided asset is not of type TextAsset!"));
            };
        }

        public function setParamsDesc(_arg_1:XMLList):void
        {
        }


    }
}//package com.sulake.core.assets

// _SafeStr_5275 = "_-J1N" (String#7775, DoABC#3)
// _SafeStr_8024 = "_-p0" (String#9968, DoABC#3)


