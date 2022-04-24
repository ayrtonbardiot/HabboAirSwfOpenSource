// by nota

//com.sulake.core.assets.SoundAsset

package com.sulake.core.assets
{
    import flash.media.Sound;
    import flash.utils.ByteArray;

    public class SoundAsset implements IAsset 
    {

        private var _disposed:Boolean = false;
        private var _content:Sound = null;
        private var _SafeStr_8024:AssetTypeDeclaration;
        private var _SafeStr_5275:String;

        public function SoundAsset(_arg_1:AssetTypeDeclaration, _arg_2:String=null)
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
            return (_content as Object);
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
            if ((_arg_1 is Sound))
            {
                if (_content)
                {
                    _content.close();
                };
                _content = (_arg_1 as Sound);
                return;
            };
            if ((_arg_1 is ByteArray))
            {
            };
            if ((_arg_1 is Class))
            {
                if (_content)
                {
                    _content.close();
                };
                _content = (new ((_arg_1 as Class))() as Sound);
                return;
            };
            if ((_arg_1 is SoundAsset))
            {
                if (_content)
                {
                    _content.close();
                };
                _content = SoundAsset(_arg_1)._content;
                return;
            };
        }

        public function setFromOtherAsset(_arg_1:IAsset):void
        {
            if ((_arg_1 is SoundAsset))
            {
                _content = SoundAsset(_arg_1)._content;
            };
        }

        public function setParamsDesc(_arg_1:XMLList):void
        {
        }


    }
}//package com.sulake.core.assets

// _SafeStr_5275 = "_-J1N" (String#7775, DoABC#3)
// _SafeStr_8024 = "_-p0" (String#9968, DoABC#3)


